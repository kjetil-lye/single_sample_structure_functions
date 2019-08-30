
if __name__ == '__main__':
    import argparse

    
    parser = argparse.ArgumentParser(description='Quick fix: The structure computation expects files that have variables with names "sample_x_var", this script converts the mean to such a format')

    parser.add_argument('--input', type=str, required=True,
                    help='input filename')

    basename_input = os.path.basename(args.input)
    output_basename = basename_input.replace('mean', 'meanassample')
    output_filename = os.path.join(os.path.dirname(args.input),
                                   output_basename)
    with netCDF4.Dataset(args.input) as inputfile:
        with netCDF4.Dataset(output_filename, 'w', format='NETCDF3_64BIT_DATA') as outf:
            
            xdim = None
            ydim = None
            zdim = None

            for variable in inputfile.variables.keys():
                
                if variable == 'time':
                    time = inputfile.variables[variable][0]
                    tdim = outf.createDimension('t', 1)
                    t = outf.createVariable("time", np.float64, ("t",))
                    t[0] = time
                else:
                    data = inputfile.variables[variable]

                    if xdim is None:
                        
                        xdim = outf.createDimension("x", d.shape[0])
                        ydim = outf.createDimension("y", d.shape[1])
                        zdim = outf.createDimension("z", d.shape[2])

                    newvar = outf.createVariable(f'sample_0_{variable}', d.dtype, ("x", "y", "z"))
                    newvar[:,:,:] = d[:,:,:]

            outf.setncattr("WORKING_DIR", os.getcwd())
            outf.setncattr("IMPORTANT_NODE", """
This file was converted with the script python/make_mean_as_sample.py
in the single_sample_structure_functions repository. This was done as a postprocessing step
            """)


            outf.setncattr("COMMAND_RUN_TO_MAKE_MEAN_AS_SAMPLE", " ".join([
                    sys.executable,
                    *sys.argv]))

            with open(sys.argv[0]) as scriptfile:
                outf.setncattr("SCRIPTFILE", scriptfile.read())


            for attr_name in inputfile.ncattrs():
                outf.setncattr(attr_name, inputfile.getncattr(attr_name))
