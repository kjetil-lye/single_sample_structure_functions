import latex_plots


import plot_info
import numpy as np
import matplotlib.pyplot as plt
import netCDF4

conserved_variables_default = [
        "rho",
        "mx",
        "my",
        "E"
        ]



def stats_latex(name, resolution):
    inner_name = f'u^{{{resolution}}}'
    
    
    if name == 'mean':
        return f'\\mathbb{{E}}({inner_name})'
    elif name == 'variance':
        return f'\\mathrm{{Var}}({inner_name})'
    
    return inner_name

def load_file_single_sample(filename, conserved_variables):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
            

        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        data = np.zeros((resolution, resolution, len(conserved_variables)))
        for variable_index, variable in enumerate(conserved_variables):
            # 42 is the answer to everything. (Wanted different realizations than the ones already shown a thousand times)
            data[:,:,variable_index] = f.variables[f'sample_42_{variable}'][:,:,0].T
            
        return data



def load_file_mean(filename, conserved_variables, number_of_samples):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
        
        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        mean = np.zeros((resolution, resolution, len(conserved_variables)))
        
        for sample in range(number_of_samples):
            for variable_index, variable in enumerate(conserved_variables):
                key = f'sample_{sample}_{variable}'
                mean[:,:,variable_index] += f.variables[key][:,:,0].T
        
        mean /= number_of_samples
        
        return mean
            
    
def load_file_variance(filename, conserved_variables, number_of_samples):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
        
        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        
        mean = np.zeros((resolution, resolution, len(conserved_variables)))
        m2 = np.zeros((resolution, resolution, len(conserved_variables)))
        for sample in range(number_of_samples):
            for variable_index, variable in enumerate(conserved_variables):
                key = f'sample_{sample}_{variable}'
                mean[:,:,variable_index] += f.variables[key][:,:,0].T
                m2[:,:,variable_index] += f.variables[key][:,:,0].T**2
                
        
        mean /= number_of_samples
        m2 /= number_of_samples
        
        return m2 - mean**2
        
           
    
def load_file(filename, conserved_variables, statistic_name, number_of_samples):
    if statistic_name == 'single_sample':
        return load_file_single_sample(filename, conserved_variables)
    elif statistic_name == 'mean':
        return load_file_mean(filename, conserved_variables, number_of_samples)
    elif statistic_name == 'variance':
        return load_file_variance(filename, conserved_variables, number_of_samples)
    else:
        raise Exception(f"Unknown statistics: {statistic_name}")
    
    
def get_time(filename):
    with netCDF4.Dataset(filename) as f:
        return f.variables['time'][0]
        
def load_all_data(basename, resolutions, variables, statistic_name, number_of_samples):
    data = {}
    for resolution in resolutions:
        data[resolution] = load_file(basename.format(resolution=resolution),
            variables, statistic_name, number_of_samples)
        
    return data

def get_min_max_values(all_data):
    min_over_resolutions = []
    max_over_resolutions = []
    
    for resolution, data in all_data.items():
        min_at_resolution = np.zeros(data.shape[-1])
        max_at_resolution = np.zeros(data.shape[-1])
        
        for component in range(data.shape[-1]):
            min_at_resolution[component] = np.min(data[:,:,component])
            max_at_resolution[component] = np.max(data[:,:,component])
            
        min_over_resolutions.append(min_at_resolution)
        max_over_resolutions.append(max_at_resolution)
        
    min_over_resolutions = np.array(min_over_resolutions)
    max_over_resolutions = np.array(max_over_resolutions)
    
    return np.min(min_over_resolutions, axis=0), np.max(max_over_resolutions, axis=0)
    
def plot_convergence(basename, statistic_name, title, conserved_variables = conserved_variables_default,
                     resolutions=[64, 128,256,512,1024],
                     reference=True,
                     vmax=None):
    
    all_data = load_all_data(basename, resolutions, conserved_variables,
                             statistic_name, max(resolutions))
    
    min_values, max_values = get_min_max_values(all_data)
    
    if reference:
        # We do reference convergence
        reference_resolution = max(resolutions)
        reference_solution = all_data[reference_resolution]
    
    errors = []
    
    if reference:
        
        for resolution in resolutions:
            timepoint = get_time(basename.format(resolution=resolution))
            data = all_data[resolution]
            # Plot the solution
            x, y = np.mgrid[0:1:resolution*1j, 0:1:resolution*1j]
           
            for variable_index, variable in enumerate(conserved_variables):
                min_value = min_values[variable_index]
                if vmax is None:
                    max_value = max_values[variable_index]
                    vmax_append=''
                    vmax_title=''
                else:
                    max_value = vmax
                    vmax_append=f'_vmax_{str(vmax).replace(".", "_")}'
                    vmax_title=f' Colorbar capped with vmax {vmax}.'
                
                plt.pcolormesh(x, y, data[:,:,variable_index],
                               vmin=min_value, vmax=max_value)
                
                plt.xlabel("$x$")
                plt.ylabel("$y$")
                
                plt.title(f"{variable}\n{title.replace('_', ' ')}\n$T={timepoint}$.{vmax_title}")
                
                plt.colorbar()
                
                plot_info.savePlot(f"field_plot_{statistic_name}_{variable}_{title}_{timepoint}_N{resolution}{vmax_append}")
                plt.close('all')
                
    
    for resolution in resolutions[:-1]:
        timepoint = get_time(basename.format(resolution=resolution))
        
        
        data = all_data[resolution]
        
        if not reference:
            reference_resolution = resolution * 2
            reference_solution = all_data[reference_resolution]
        
        # Upscale
        while data.shape[0] < reference_resolution:
            data = np.repeat(np.repeat(data, 2, 0), 2, 1)
        
        # compute error in L^1
        error = np.sum(abs(data - reference_solution))/reference_resolution**2
        
        errors.append(error)
        
    if reference:
        convergence_type = 'reference'
    else:
        convergence_type = 'cauchy'
        
    plot_info.saveData(f'convergence_{convergence_type}_{statistic_name}_{title}_{timepoint}_errors', errors)
    plot_info.saveData(f'convergence_{convergence_type}_{statistic_name}_{title}_{timepoint}_resolutions', resolutions)
    
    plt.loglog(resolutions[:-1], errors, '-o')
    poly = np.polyfit(np.log(resolutions[:-1]), np.log(errors), 1)
    
    plt.loglog(resolutions[:-1], np.exp(poly[1])*resolutions[:-1]**poly[0],
               '--', label=f'$\\mathcal{{O}}(N^{{{poly[0]:.1f}}})$', basex=2,
               basey=2)
    
    plt.xlabel("Resolution ($N\\times N$)")
    if reference:
        plt.ylabel(f"Error ($\\|{stats_latex(statistic_name, 'N')}-{stats_latex(statistic_name, str(reference_resolution))}\\|_{{L^1(D)}}$)")
    else:
        plt.ylabel(f"Error ($\\|{stats_latex(statistic_name, 'N')}-{stats_latex(statistic_name, '2N')}\\|_{{L^1(D)}}$)")
    
    plt.xticks(resolutions[:-1], [f'${N}\\times {N}$' for N in resolutions[:-1]])
    plt.title(f'Convergence of {statistic_name.replace("_", " ")}\n{title.replace("_"," ")}\n$T={timepoint}$ {convergence_type} convergence')
    
    
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
    
    parser.add_argument('--statistic_name', type=str, required=True,
                        help='Statistics name, can be either "mean", "variance" or "single_sample"')
    
    parser.add_argument('--reference', action='store_true',
                        help='Compute convergence against reference solution, else use Cauchy convergence.')

    parser.add_argument('--vmax', type=float, required=False,
                        help='Maximum value for colorbar for the field plot')
    
    args = parser.parse_args()
    
    

    plot_convergence(args.input_basename, 
                     args.statistic_name, 
                     args.title, 
                     conserved_variables=conserved_variables_default,
                     reference=args.reference,
                     vmax=args.vmax)
