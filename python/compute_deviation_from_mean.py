"""
For each sample, computes the deviation from the mean field. That is, it computes

   \hat{u}_k := u_k-\bar{u}
"""
import numpy as np
import netCDF4
import copy
import collections
import re
import os
import sys


def get_shape(input_filename):
    with netCDF4.Dataset(input_filename) as f:
        for variable in f.variables.keys():
            if variable != 'time':
                return copy.deepcopy(f.variables[variable].shape)

def get_conserved_variable_name(variable):

    return str(re.search(r'sample_\d+_(.+)', variable).group(1))
    
def compute_mean_field(input_filename):
    mean_field_shape = get_shape(input_filename)
    mean_per_conserved_variable = \
        collections.defaultdict(lambda : np.zeros(mean_field_shape))

    number_of_samples = collections.defaultdict(int)
    with netCDF4.Dataset(input_filename) as f:
        for variable in f.variables.keys():
            if variable != 'time':
                data = f.variables[variable][:,:,:]
                
                conserved_name = get_conserved_variable_name(variable)
                
                mean_per_conserved_variable[conserved_name] += data

                number_of_samples[conserved_name] += 1

    for conserved_variable in mean_per_conserved_variable.keys():
        if number_of_samples[conserved_name] == 0:
            raise Exception(f"No samples found for {conserved_variable}")
        
        mean_per_conserved_variable[conserved_variable] /= number_of_samples[conserved_name]


    return mean_per_conserved_variable
    
    
def get_conserved_variables(input_filename):
    variables = set()
    with netCDF4.Dataset(input_filename) as f:
        for variable in f.variables.keys():
            re_match = re.search(r'sample_\d+_(.+)', variable)
            if re_match:
                variables.add(re_match.group(1))
    return variable


def compute_deviation(*, input_filename, output_filename):
    mean_field = compute_mean_field(input_filename)

    with netCDF4.Dataset(input_filename) as inputfile:
        with netCDF4.Dataset(output_filename, 'w', format='NETCDF3_64BIT_DATA') as outputfile:
            
            xdim = None
            ydim = None
            zdim = None

            for variable in inputfile.variables.keys():
                
                if variable == 'time':
                    time = inputfile.variables[variable][0]
                    tdim = outputfile.createDimension('t', 1)
                    t = outputfile.createVariable("time", np.float64, ("t",))
                    t[0] = time
                else:
                    conserved_name = get_conserved_variable_name(variable)
                    data = inputfile.variables[variable]

                    if xdim is None:
                        
                        xdim = outputfile.createDimension("x", data.shape[0])
                        ydim = outputfile.createDimension("y", data.shape[1])
                        zdim = outputfile.createDimension("z", data.shape[2])

                    newvar = outputfile.createVariable(variable, data.dtype, ("x", "y", "z"))
                    newvar[:,:,:] = data[:,:,:] - mean_field[conserved_name]

            outputfile.setncattr("WORKING_DIR", os.getcwd())
            outputfile.setncattr("IMPORTANT_NODE", """
This file was converted with the script python/compute_deviation_from_mean.py
in the single_sample_structure_functions repository. This was done as a postprocessing step
            """)


            outputfile.setncattr("COMMAND_RUN_TO_COMPUTE_DEVIATION", " ".join([
                    sys.executable,
                    *sys.argv]))

            with open(sys.argv[0]) as scriptfile:
                outputfile.setncattr("SCRIPTFILE", scriptfile.read())


            for attr_name in inputfile.ncattrs():
                outputfile.setncattr(attr_name, inputfile.getncattr(attr_name))


if __name__ == '__main__':
    import argparse

    
    parser = argparse.ArgumentParser(description='Compute the deviation from the mean')

    parser.add_argument('--input', type=str, required=True,
                    help='input filename')

    parser.add_argument('--output', type=str, required=True,
                    help='output filename')

    
    
    args = parser.parse_args()

    compute_deviation(input_filename=args.input,
                      output_filename=args.output)
