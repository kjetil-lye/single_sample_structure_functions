import netCDF4
import latex_plots
import plot_info
import numpy as np
import matplotlib.pyplot as plt
import re

variables = [
    "rho",
    "mx",
    "my",
    "E"
    ]


latex_variables = {
    'rho' : '\\rho',
    'mx'  : 'm_x',
    'my'  : 'm_y',
    'E'   : 'E'
    }

def load(filename, point):
    data = []
    number_of_variables = len(variables)
    with netCDF4.Dataset(filename) as f:
        number_of_samples = (len(list(f.variables.keys()))-1)//number_of_variables
        data = np.zeros((number_of_samples, number_of_variables))

        
        for variable, field in f.variables.items():
            if variable != 'time':
                re_result = re.search(r'sample_(\d+)_(.+)', variable)
                if not re_result:
                    raise ValueError(f'Found unexpected variable name {variable}')
                sample = int(re_result.group(1))
                variable_conserved = str(re_result.group(2))
                index_variable = variables.index(variable_conserved)

                # Yes, we tranpose the point!
                data[sample, index_variable] = field[point[1], point[0], 0]

    return data

def get_time(filename):
    with netCDF4.Dataset(filename) as f:
        return f.variables['time'][0]
    

def draw_histograms(basename, resolutions, point, title):
    all_data = []
    for resolution in resolutions:
        discrete_point = [resolution * point[0], resolution * point[1]]

        all_data.append(load(basename.format(resolution=resolution), discrete_point))
        time = get_time(basename.format(resolution=resolution))

    all_data = np.array(all_data)
    
    for n, variable in enumerate(variables):
        min_value = np.min(all_data[:,:,n])
        max_value = np.max(all_data[:,:,n])

        for m, resolution in enumerate(resolutions):
            plt.hist(all_data[m,:,n], range=[min_value, max_value], bins=32)
            plt.title(f'Histogram for {title}\nat $({point[0]}, {point[1]})$, $T={time}$')
            plt.xlabel(f'Value of ${latex_variables[variable]}^{{{resolution}}}({point[0]:.2f}, {point[1]:.2f})$')

            plot_info.showAndSave(f'histogram_{title}_{variable}_{resolution}_{time}_{point[0]}_{point[1]}')

            plt.close('all')

if __name__ == '__main__':
    
            
    import argparse

    parser = argparse.ArgumentParser(description="""
Plots the one point histograms
            """)

    parser.add_argument('--input_basename', type=str, required=True,  
                        help='Input filename (should have a format string {resolution})')

    parser.add_argument('--title', type=str, required=True,
                        help='Title of plot')
    
    parser.add_argument('--starting_resolution', type=int, default=64,
                        help='Starting resolution (smallest resolution)')

    parser.add_argument('--max_resolution', type=int, default=1024,
                        help='Maximum resolution')


    parser.add_argument('--point_x', nargs="+", type=float, default=[0.75, 0.25, 0.3],
                        help='x coordinate of point')

    parser.add_argument('--point_y', type=float, default=[0.25, 0.75, 0.6],
                        help='y coordinate of point')

    args = parser.parse_args()
                

    resolutions = 2**np.arange(int(np.log2(args.starting_resolution)), int(np.log2(args.max_resolution)+1))

    for point_x, point_y in zip(args.point_x, args.point_y):
        draw_histograms(args.input_basename, resolutions,
                        [point_x, point_y], args.title)
    
