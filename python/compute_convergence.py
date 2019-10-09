import matplotlib
matplotlib.use('Agg')
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
            data[:,:,variable_index] = f.variables[f'sample_0_{variable}'][:,:,0]
            
        return data



def load_file_mean(filename, conserved_variables):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
        
        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        mean = np.zeros((resolution, resolution, len(conserved_variables)))
        
        for sample in range(resolution):
            for variable_index, variable in enumerate(conserved_variables):
                key = f'sample_{sample}_{variable}'
                mean[:,:,variable_index] += f.variables[key][:,:,0]
        
        mean /= resolution
        
        return mean
            
    
def load_file_variance(filename, conserved_variables):
    with netCDF4.Dataset(filename) as f:
        for attr in f.ncattrs():
            plot_info.add_additional_plot_parameters(filename.replace("/", "_") + "_" + attr, f.getncattr(attr))
        
        resolution = f.variables[f'sample_0_{conserved_variables[0]}'].shape[0]
        
        mean = np.zeros((resolution, resolution, len(conserved_variables)))
        m2 = np.zeros((resolution, resolution, len(conserved_variables)))
        for sample in range(resolution):
            for variable_index, variable in enumerate(conserved_variables):
                key = f'sample_{sample}_{variable}'
                mean[:,:,variable_index] += f.variables[key][:,:,0]
                m2[:,:,variable_index] += f.variables[key][:,:,0]**2
                
        
        mean /= resolution
        m2 /= resolution
        
        return m2 - mean**2
        
           
    
def load_file(filename, conserved_variables, statistic_name):
    if statistic_name == 'single_sample':
        return load_file_single_sample(filename, conserved_variables)
    elif statistic_name == 'mean':
        return load_file_mean(filename, conserved_variables)
    elif statistic_name == 'variance':
        return load_file_variance(filename, conserved_variables)
    else:
        raise Exception(f"Unknown statistics: {statistic_name}")
    
    
def get_time(filename):
    with netCDF4.Dataset(filename) as f:
        return f.variables['time'][0]
    
    
def plot_convergence(basename, statistic_name, title, conserved_variables = conserved_variables_default,
                                resolutions=[64, 128,256,512,1024]):
    
    # We do reference convergence
    reference_resolution = max(resolutions)
    reference_solution = load_file(basename.format(resolution=reference_resolution),
                                   conserved_variables, statistic_name)
    
    errors = []
    for resolution in resolutions[:-1]:
        timepoint = get_time(basename.format(resolution=resolution))
        
        
        data = load_file(basename.format(resolution=resolution), 
                         conserved_variables, 
                         statistic_name)
        
        # Plot the solution
        x, y = np.mgrid[0:1:resolution*1j, 0:1:resolution*1j]
        
        for variable_index, variable in enumerate(conserved_variables):
            min_value = np.min(reference_solution[:,:,variable_index])
            max_value = np.max(reference_solution[:,:,variable_index])
            
            plt.pcolormesh(x, y, data[:,:,variable_index],
                           vmin=min_value, vmax=max_value)
            
            plt.xlabel("$x$")
            plt.ylabel("$y$")
            
            plt.title(f"{variable}\n{title}\n$T={timepoint}$")
            
            plt.colorbar()
            
            plot_info.savePlot(f"field_plot_{variable}_{title}_{timepoint}")
            plt.close('all')
        
        # Upscale
        while data.shape[0] < reference_resolution:
            data = np.repeat(np.repeat(data, 2, 0), 2, 1)
        
        # compute error in L^1
        error = np.sum(abs(data - reference_solution))/resolution**2
        
        errors.append(error)
        
    plot_info.saveData(f'convergence_{statistic_name}_{title}_{timepoint}_errors', errors)
    plot_info.saveData(f'convergence_{statistic_name}_{title}_{timepoint}_resolutions', resolutions)
    
    plt.loglog(resolutions[:-1], errors, '-o')
    poly = np.polyfit(np.log(resolutions[:-1]), np.log(errors), 1)
    
    plt.loglog(resolutions[:-1], np.exp(poly[1])*resolutions[:-1]**poly[0],
               '--', label=f'$\\mathcal{{O}}(N^{{{poly[0]:.1f}}})$', basex=2,
               basey=2)
    
    plt.xlabel("Resolution ($N\\times N$)")
    plt.ylabel(f"Error ($||{stats_latex(statistic_name, 'N')}-{stats_latex(statistic_name, str(reference_resolution))}||_{{L^1(D)}}$)")
    
    plt.title(f'Convergence of {statistic_name}\n{title}\n$T={timepoint}$')
    
    plot_info.saveData(f'convergence_{statistic_name}_{title}')
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
    
    args = parser.parse_args()
    
    

    plot_convergence(args.input_basename, 
                     args.statistic_name, 
                     args.title, 
                     conserved_variables=conserved_variables_default)