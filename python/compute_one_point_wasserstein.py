import latex_plots


import plot_info
import numpy as np
import matplotlib.pyplot as plt
import netCDF4
import ot
import scipy.spatial

conserved_variables_default = [
        "rho",
        "mx",
        "my",
        "E"
        ]




def load_file(filename, conserved_variables, number_of_samples):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
            

        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        data = np.zeros((number_of_samples, resolution, resolution, len(conserved_variables)))
        
        for sample in range(number_of_samples):
            for variable_index, variable in enumerate(conserved_variables):
                data[sample,:,:,variable_index] = f.variables[f'sample_{sample}_{variable}'][:,:,0]
            
        return data



           
    
    
def get_time(filename):
    with netCDF4.Dataset(filename) as f:
        return f.variables['time'][0]

    
def compute_wasserstein_one_point(data, reference_solution, exponent):
    number_of_samples = data.shape[0]
    number_of_variables = data.shape[-1]
    
    xs = np.zeros((number_of_samples, number_of_variables))
    xt = np.zeros((number_of_samples, number_of_variables))
    
    factor_reference_data = reference_solution.shape[1]//data.shape[1]
    
    weights = np.ones(number_of_samples)/number_of_samples
    
    wasserstein_sum = 0.0
    
    for i in range(reference_solution.shape[0]):
        for j in range(reference_solution.shape[1]):
            xs[:,:] = reference_solution[:,i, j,:]

            xt[:,:] = data[:, i//factor_reference_data, j//factor_reference_data, :]
            
              
            cost_matrix = scipy.spatial.distance.cdist(xs, xt, metric='minkowski', p=exponent)
            assignment_matrix = ot.emd(weights, weights, cost_matrix)
            
            
            wasserstein_sum += np.sum(assignment_matrix * cost_matrix)**exponent
    
    wasserstein_sum /= reference_solution.shape[0]**2
    
    return wasserstein_sum**(1/p)
            
    
    
def plot_wasserstein_one_point_convergence(basename, title,
                                           conserved_variables = conserved_variables_default,
                                           resolutions=[64, 128,256,512,1024],
                                           reference=True,
                                           exponent = 1
                                           ):
    
    if reference:
        # We do reference convergence
        reference_resolution = max(resolutions)
        reference_solution = load_file(basename.format(resolution=reference_resolution),
                                       conserved_variables, max(resolutions))
    
    errors = []
    
    for resolution in resolutions[:-1]:
        timepoint = get_time(basename.format(resolution=resolution))
        
        if not reference and resolution > resolutions[0]:
            # We have already loaded this
            data = reference_solution
        else:
            data = load_file(basename.format(resolution=resolution),
                             conserved_variables, max(resolutions))
       
        if not reference:
            reference_resolution = resolution * 2
            reference_solution = load_file(basename.format(resolution=reference_resolution),
                             conserved_variables, max(resolutions))
        
        error = compute_wasserstein_one_point(data, reference_solution, exponent)
        
        errors.append(error)
        
    if reference:
        convergence_type = 'reference'
    else:
        convergence_type = 'cauchy'
        
    statistic_name = 'wasserstein'
        
    plot_info.saveData(f'convergence_{convergence_type}_{statistic_name}_{title}_{timepoint}_errors', errors)
    plot_info.saveData(f'convergence_{convergence_type}_{statistic_name}_{title}_{timepoint}_resolutions', resolutions)
    
    plt.loglog(resolutions[:-1], errors, '-o')
    poly = np.polyfit(np.log(resolutions[:-1]), np.log(errors), 1)
    
    plt.loglog(resolutions[:-1], np.exp(poly[1])*resolutions[:-1]**poly[0],
               '--', label=f'$\\mathcal{{O}}(N^{{{poly[0]:.1f}}})$', basex=2,
               basey=2)
    
    plt.xlabel("Resolution ($N\\times N$)")
    if reference:
        plt.ylabel(f"Error ($\\|W_{{{exponent}}}(\\nu^{{1,N}}, \\nu^{{1,{reference_resolution}}})\\|_{{L^{{{exponent}}}(D)}}$)")
    else:
        plt.ylabel(f"Error ($\\|W_{{{exponent}}}(\\nu^{{1,N}}, \\nu^{{1,2N}})\\|_{{L^{{{exponent}}}(D)}}$)")
    
    plt.xticks(resolutions[:-1], [f'${N}\\times {N}$' for N in resolutions[:-1]])
    plt.title(f'Convergence of {statistic_name}\n{title}\n$T={timepoint}$ {convergence_type} convergence')
    
    
    # Scale to nearest power of two to make the y axis not zoom in too much
    min_error = np.min(errors)
    max_error = np.max(errors)
    
    min_power_of_two = 2**(np.floor(np.log2(min_error)))
    max_power_of_two = 2**(np.ceil(np.log2(max_error)))
    
    if min_power_of_two == max_power_of_two:
        max_power_of_two *= 2
    
    plt.ylim([min_power_of_two, max_power_of_two])
    
    plt.legend()
    plot_info.savePlot(f'convergence_{convergence_type}_{statistic_name}_{title}_{timepoint}')
    plt.close('all')
    
    
    
if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description="""
Computes the wasserstein distances
        """)

    parser.add_argument('--input_basename', type=str, required=True,
                        help='Input filename (should have a format string {resolution})')

    parser.add_argument('--title', type=str, required=True,
                        help='Title of plot')
    
    parser.add_argument('--reference', action='store_true',
                        help='Compute convergence against reference solution, else use Cauchy convergence.')
    
    parser.add_argument('--exponent', type=int, default=1,
                        help='The power (p) of the L^p norm')
    
    args = parser.parse_args()
    
    

    plot_wasserstein_one_point_convergence(args.input_basename,
                                           args.title, 
                                           conserved_variables=conserved_variables_default,
                                           reference=args.reference,
                                           exponent = args.exponent)