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




def load_file_single_sample(filename, conserved_variables, sample_number):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
            

        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        data = np.zeros((resolution, resolution, len(conserved_variables)))
        for variable_index, variable in enumerate(conserved_variables):
            data[:,:,variable_index] = f.variables[f'sample_{sample_number}_{variable}'][:,:,0]
            
        return data

def get_time(filename):
    with netCDF4.Dataset(filename) as f:
        return f.variables['time'][0]

def plot_convergence(basename, title, conserved_variables = conserved_variables_default,
                     resolutions=[64, 128,256,512,1024],
                     reference=True):
    errors = []
    errors_std = []
    for resolution in resolutions[:-1]:
        timepoint = get_time(basename.format(resolution=resolution))
        
        number_of_samples = 1024

        errors_per_sample = np.zeros(number_of_samples)

        for sample in range(number_of_samples):
            if reference_solution:
                reference_resolution = resolutions[-1]
            else:
                reference_resolution = 2 * resolution

            data_coarse = load_file_single_sample(basename.format(resolution=resolution),
                                                  conserved_variables,
                                                  sample)
            data_fine = load_file_single_sample(basename.format(resolution=reference_resolution),
                                                conserved_variables,
                                                sample)
            # Upscale
            while data_coarse.shape[0] < reference_resolution:
                data_coarse = np.repeat(np.repeat(data_coarse, 2, 0), 2, 1)

            errors_per_sample[sample] = np.sum(abs(data_coarse-data_fine)) / reference_resolution**2

        errors.append(np.mean(errors_per_sample))
        errors_std.append(np.std(errors_per_sample))
        
    if reference:
        convergence_type = 'reference'
    else:
        convergence_type = 'cauchy'
        
    plot_info.saveData(f'convergence_{convergence_type}_expected_error_{title}_{timepoint}_errors', errors)
    plot_info.saveData(f'convergence_{convergence_type}_expected_error_{title}_{timepoint}_resolutions', resolutions)
    
    plt.errorbar(resolutions[:-1], errors, yerr=error_std, fmt='-o')
    poly = np.polyfit(np.log(resolutions[:-1]), np.log(errors), 1)
    
    plt.loglog(resolutions[:-1], np.exp(poly[1])*resolutions[:-1]**poly[0],
               '--', label=f'$\\mathcal{{O}}(N^{{{poly[0]:.1f}}})$', basex=2,
               basey=2)
    
    plt.xlabel("Resolution ($N\\times N$)")
    latex_name='u'
    if reference:
        plt.ylabel(f"Averaged error ($\\mathbb{{E}}(\\|{latex_name}^N(\\cdot)-{latex_name}^{{{reference_resolution}}}(\\cdot) \\|_{{L^1(D)}})$)")
    else:
        plt.ylabel(f"Averaged error ($\\mathbb{E}(\\|{latex_name}^N(\\cdot)-{latex_name}^{{2N}}(\\cdot)\\|_{{L^1(D)}})$)")
    
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
    plot_info.savePlot(f'convergence_{convergence_type}_expected_error_{title}_{timepoint}')
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
    
    args = parser.parse_args()
    
    

    plot_convergence(args.input_basename, 
                     args.title, 
                     conserved_variables=conserved_variables_default,
                     reference=args.reference)
