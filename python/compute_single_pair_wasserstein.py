"""
Computes the wasserstein distance between two files
"""
import mpi4py
from mpi4py import MPI
import netCDF4
import ot
import numpy as np
conserved_variables = [
    "rho",
    "mx",
    "my",
    "E"
]

# We are not going to plot, but we will save data
import plot_info
def get_rank_global():
    comm = MPI.COMM_WORLD
    return comm.Get_rank()

def get_global_size():
    comm = MPI.COMM_WORLD
    return comm.Get_size()

def get_resolution(filename):
    with netCDF4.Dataset(filename) as f:
        return f.variables['sample_0_rho'].shape[0]
    


def load_plane_line(filename, start_x, end_x, start_y, end_y, number_of_samples, variables):
    
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
        
        
        length_y = end_y - start_y
        length_x = end_x - start_x

        samples = np.zeros((number_of_samples, length_x, length_y, len(variables)))
        for variable_index, variable in enumerate(variables):
            for sample in range(number_of_samples):
                key = f'sample_{sample}_{variable}'
                
                samples[sample,:,:,variable_index] = f.variables[key][start_x:end_x, start_y:end_y,0]
                
    return samples

def get_node_x_y_ranges(multi_x, multi_y, resolution):
    rank = get_rank_global()
    
    
    
    rank_y = rank // multi_x
    rank_x = rank % multi_x
    
    number_of_points_per_node = resolution // multi_x
    number_of_lines_per_node = resolution // multi_x
    
    start_x = rank_x * number_of_points_per_node    
    end_x = (rank_x + 1) * number_of_points_per_node
    
    start_y = rank_y * number_of_lines_per_node    
    end_y = (rank_y  + 1) * number_of_lines_per_node

    return start_x, end_x, start_y, end_y

def compute_wasserstein_one_point(file_a, file_b, multi_x, multi_y):
    resolution_a = get_resolution(file_a)
    resolution_b = get_resolution(file_b)
    
    resolution = max(resolution_a, resolution_b)
    
    if resolution_a > resolution_b:
        file_a, file_b = file_b, file_a
        resolution_a, resolution_b = resolution_b, resolution_a
        
    factor = resolution_b // resolution_a
    
    start_x, end_x, start_y, end_y = get_node_x_y_ranges(multi_x, multi_y, resolution)
    
    start_y_coarse = start_y // factor
    end_y_coarse = max(start_y_coarse + 1, end_y // factor)

    wasserstein_distance_sum = 0.0
    weights_a = np.ones(resolution) / resolution
    weights_b = np.ones(resolution) / resolution


    for y_coarse in range(start_y_coarse, end_y_coarse):
        data_a = load_plane_line(file_a,
                                 start_x // factor, 
                                 end_x // factor,
                                 y_coarse,
                                 y_coarse + 1,
                                 resolution, 
                                 conserved_variables)

        for y_fine_offset in range(factor):
            y = y_coarse * factor + y_fine_offset

            data_b = load_plane_line(file_b,
                                     start_x, 
                                     end_x,
                                     y,
                                     y + 1,
                                     resolution, 
                                     conserved_variables)
    
    

            for x in range(end_x - start_x):
                distances = ot.dist(data_a[:, 0, x//factor, :],
                                    data_b[:, 0, x, :], metric='euclidean')
                            
                emd_pairing = ot.emd(weights_a, weights_b, distances)
                wasserstein_distance = np.sum(emd_pairing * distances)
                wasserstein_distance_sum += wasserstein_distance

    return wasserstein_distance_sum / resolution**2
    
def is_power_of_two(n):
    """ see https://stackoverflow.com/a/57027610 """
    return (n != 0) and (n & (n-1) == 0)
    
if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description="""
Computes the 1 pt wasserstein distance between two files
            """)

    parser.add_argument('--file_a', type=str, required=True,  
                        help='first file')

    parser.add_argument('--file_b', type=str, required=True,  
                        help='second file')


    parser.add_argument('--multi_x', type=int, required=True,
                     help='Number of processes in x direction')
    
    parser.add_argument('--multi_y', type=int, required=True,
                     help='Number of processes in y direction')
    
    parser.add_argument('--outfile', type=str, required=True,
                        help='Name of output file')
    
    

    args = parser.parse_args()
    
    mpi_size = get_global_size()
    
    if args.multi_x * args.multi_y != mpi_size:
        raise Exception(f'Wrong number of mpi processes given.\n\tGiven: {mpi_size}\n\tExpected: multi_x*multi_y = {args.multi_x} * {args.multi_y} = {args.multi_z * args.multi_y}\n')
    
    
    # maybe these two next checks are too strict, but wanted to be on the safe side
    if not is_power_of_two(args.multi_x):
        raise Exception(f'multi_x must be power of 2, given {args.multi_x}')

    if not is_power_of_two(args.multi_y):
        raise Exception(f'multi_y must be power of 2, given {args.multi_y}')
        
    wasserstein = compute_wasserstein_one_point(args.file_a, args.file_b, args.multi_x, args.multi_y)
    comm = MPI.COMM_WORLD
    sum_distance = comm.reduce(wasserstein, op=MPI.SUM)
    
    if get_rank_global() == 0:
        plot_info.saveData(args.outfile, np.array(sum_distance).reshape(1))
    
