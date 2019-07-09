import argparse
import xml.dom.minidom
import shutil
import os
import re

MAX_RESOLUTION=2048

from xml_tools import set_in_xml, get_xml_node, get_in_xml, read_config, make_functional_element, make_functional_element_time
if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description="""
Makes an instance of the configuration file for each resolution and each Hurst index. Folder layout will be

    H{HURST INDEX}/NRESOLUTION/configname.xml
            """)

    parser.add_argument('--cuda_cutoff', type=int, default=1024,
                        help='The lowest resolution for which to still use CUDA')

    parser.add_argument('--resolutions', type=int, nargs='+', required=True,
                        help='Resolutions')

    parser.add_argument('--hurst_indices', type=str, nargs='+', required=True,
                        help="values of H (hurst index)")

    parser.add_argument('--config', type=str, required=True,
                        help="Path to configuration file")
    
        
    parser.add_argument('--samples', type=int, nargs='+', default=[-1],
                        help='Number of samples per resolution (default 1 per resolution)')

  

    args = parser.parse_args()
    
    
    if args.samples == [-1]:
        samples = [1 for _ in args.resolutions]
    else:
        samples = args.samples
        


    if args.resolutions[-1] > MAX_RESOLUTION:
        raise Exception("You need to edit the file fbm_base/fbm.xml by hand to allow this")

    for n, hurst_index in enumerate(args.hurst_indices):
        perturbation_folder = "H{}".format(hurst_index.replace(".","_"))
        os.makedirs(perturbation_folder, exist_ok=True)

        for m, resolution in enumerate(args.resolutions):

           
            config = read_config(args.config)
                
            resolution_folder = f"{perturbation_folder}/N{resolution}"
            os.makedirs(resolution_folder, exist_ok=True)

          
            sample = samples[m]
            
            set_in_xml(config, "config.uq.samples", str(sample))
            set_in_xml(config, "config.fvm.grid.dimension", f"{resolution} {resolution} 1")

            python_file = get_in_xml(config, "config.fvm.initialData.python")

            initial_data_parameters = get_xml_node(config, "config.fvm.initialData.parameters")

            for initial_data_parameter in initial_data_parameters.getElementsByTagName("parameter"):
                name = get_in_xml(initial_data_parameter, "name")

                if name == "hurst_index":
                    set_in_xml(initial_data_parameter, "value", hurst_index)

                elif name == "X":
                    # We need a total of (nx-1)**2*2 random samples, but we will always generate the maximum number of samples
                    set_in_xml(initial_data_parameter, "length", 2*(MAX_RESOLUTION-1)**2)

            uq_parameters = get_xml_node(config, "config.uq.parameters")
            for uq_parameter in uq_parameters.getElementsByTagName("parameter"):
                name = get_in_xml(uq_parameter, "name")

                if name == "X":
                    # We need a total of (nx-1)**2*2 random samples
                    set_in_xml(uq_parameter, "length", 2*(MAX_RESOLUTION-1)**2)
            shutil.copyfile(os.path.join(os.path.dirname(args.config), python_file),
                             os.path.join(resolution_folder, python_file))
            
            stats = get_xml_node(config, "config.uq.stats")
        
            number_of_h = int(resolution*32/1024)
            for stat in stats.getElementsByTagName("stat"):
                set_in_xml(stat, "numberOfH", number_of_h)
                
            
            # Add functionals
            try:
                functionals_element = get_xml_node(config, "config.fvm.functionals")
            except:
                functionals_element = config.createElement("functionals")
                get_xml_node(config, "config.fvm").appendChild(functionals_element)
            for p in [1,2,3]:
                
                functional = make_functional_element(config, p, number_of_h)
                functionals_element.appendChild(functional)
                functional_time = make_functional_element_time(config, p, number_of_h)
                functionals_element.appendChild(functional_time)

            with open(os.path.join(resolution_folder, os.path.basename(args.config)), 'w') as f:
                
                pretty_xml = config.toprettyxml(indent="  ")
                
                # Default pretty print is not so pretty, so we make it prettier
                while re.search(r"\n\s*\n", pretty_xml):
                    pretty_xml = re.sub(r"\n\s*\n", "\n", pretty_xml)
                f.write(pretty_xml)



