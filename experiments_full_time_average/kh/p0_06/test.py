import netCDF4
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from numpy import *
import numpy as np
import sys
def getlineintegral(filename, variable,resolution):
    d = readnetcdf4(filename, variable)
    print(d.shape)
    dx = 1.0/resolution
    
    for h in range(1,len(d)):
        d[h] += d[h-1]
    for h in range(1,len(d)):
        d[h] /=(2*h+1)**2

        
    return d

def readnetcdf4(filename, variable):

    with netCDF4.Dataset(filename) as f:
        return f.variables[f'sample_0_{variable}'][:,0,0]

def upscale(d, r):

    while d.shape[0] < r:
       
        d = repeat(d,2,0)
    return d

power = int (sys.argv[1])
for variable_sets in [['rho', 'mx', 'my', 'E'], ['rho'], ['mx'], ['my'], ['E']]:
    for resolution in [64, 128, 256, 512]:#, 1024]:
        fname = f'N{resolution}/kh_functional_time_integrated_structure_cube_{power}_0.nc'
        base_K = 32
        K = (base_K*resolution)//1024
        struct = zeros(K)
        for variable in variable_sets:
            struct += getlineintegral(fname, variable, resolution)
        struct /= 2

        struct = struct**(1/power)

        h = linspace(0, base_K/1024., K)
        p = plt.loglog(h, struct, label=f'N={resolution}')
    
        poly = np.polyfit(np.log(h[1:]), np.log(struct[1:]), 1)
        plt.loglog(h, np.exp(poly[1])*h**poly[0], '--',
               color=p[0].get_color(),
               label=f'${np.exp(poly[1]):.2f}r^{{{poly[0]:.2f}}}$')



        fname = f'N{resolution}/kh_functional_structure_cube_{power}_7.nc'
        base_K = 32
        K = (base_K*resolution)//1024
        struct = zeros(K)
        struct = struct**(1/power)
        for variable in variable_sets:
            struct += getlineintegral(fname, variable, resolution)
        

        h = linspace(0, base_K/1024., K)
        p = plt.loglog(h, struct, '-.', label=f'not averaged N={resolution}')

    
    #plt.axvline(x=32./1024., color='grey', linestyle='--')
    
    plt.legend()

    plt.title(f"DRAFT! NOT FINAL!\nKH, $p={power}, \\epsilon=0.05, T=2, M=1$, time averaged, single sample\nvariables:{', '.join(variable_sets)}\n$r_{{\\mathrm{{max}}}}={K/1024:e}$")
    ax = plt.gca()
    ax.legend(fontsize=14, loc='center left', bbox_to_anchor=(1, 0.5))



    variable_string = "_".join(variable_sets)
    plt.savefig(f'test_{variable_string}_{power}', bbox_inches='tight')
                
    plt.close('all')
