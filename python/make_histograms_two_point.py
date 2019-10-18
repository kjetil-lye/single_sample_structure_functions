
import latex_plots
import plot_info
import numpy as np
import matplotlib.pyplot as plt

from make_histograms_one_point import load, get_time, variables, latex_variables

def get_all_data(basename, resolutions, point):
    all_data = []
    for resolution in resolutions:
        discrete_point = [resolution * point[0], resolution * point[1]]

        all_data.append(load(basename.format(resolution=resolution), discrete_point))
        time = get_time(basename.format(resolution=resolution))

    all_data = np.array(all_data)
    return all_data
    

def draw_histograms(basename, resolutions, point_a, point_b, title):
    all_data_a = get_all_data(basename, resolutions, point_a)
    all_data_b = get_all_data(basename, resolutions, point_b)
    
    for n, variable in enumerate(variables):
        min_value_a = np.min(all_data_a[:,:,n])
        max_value_a = np.max(all_data_a[:,:,n])

        min_value_b = np.min(all_data_b[:,:,n])
        max_value_b = np.max(all_data_b[:,:,n])

        for m, resolution in enumerate(resolutions):
            time = get_time(basename.format(resolution=resolution))
            bins = 32
            hist, x_edges, y_edges = np.histogram2d(all_data_a[m,:,n], all_data_b[m,:,n], range=[[min_value_a, max_value_a], [min_value_b, max_value_b]],
                                  bins=bins)

            x, y = np.meshgrid(x_edges, y_edges)
            
            plt.pcolormesh(x, y, hist)
            plt.colorbar()
            plt.title(f'Two point histogram for {title}\nat $({point_a[0]}, {point_a[1]})\\times ({point_b[0]}, {point_b[1]})$, $T={time}$')
            plt.xlabel(f'Value of ${latex_variables[variable]}^{{{resolution}}}({point_a[0]:.2f}, {point_a[1]:.2f})$')
            plt.ylabel(f'Value of ${latex_variables[variable]}^{{{resolution}}}({point_b[0]:.2f}, {point_b[1]:.2f})$')

            plot_info.showAndSave(f'histogram_two_points_{title}_{variable}_{resolution}_{time}_{point_a[0]}_{point_a[1]}_{point_b[0]}_{point_b[1]}')

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


    parser.add_argument('--point_a_x', type=float, default=[0.75, 0.25, 0.6],
                        help='x coordinate of point a')

    parser.add_argument('--point_a_y', nargs='+',
                        type=float, default=[0.25, 0.75, 0.6],
                        help='y coordinate of point a')

    parser.add_argument('--point_b_x', nargs='+',
                        type=float, default=[0.25, 0.6, 0.75],
                        help='x coordinate of point b')

    parser.add_argument('--point_b_y', nargs='+',
                        type=float, default=[0.75, 0.6, 0.25],
                        help='y coordinate of point b')


    args = parser.parse_args()
                

    resolutions = 2**np.arange(int(np.log2(args.starting_resolution)), int(np.log2(args.max_resolution)+1))

    for point_a_x, point_a_y, point_b_x, point_b_y in zip(args.point_a_x, args.point_a_y, args.point_b_x, args.point_b_y):
        draw_histograms(args.input_basename, resolutions,
                        [point_a_x, point_a_y],
                        [point_b_x, point_b_y],
                        args.title)
    
