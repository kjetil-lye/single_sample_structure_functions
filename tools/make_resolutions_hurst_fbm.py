import argparse
import xml.dom.minidom
import shutil
import os

MAX_RESOLUTION=2048

from xml_tools import set_in_xml, get_xml_node, get_in_xml, read_config
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

  

    args = parser.parse_args()

    config = read_config(args.config)

    if args.resolutions[-1] > MAX_RESOLUTION:
        raise Exception("You need to edit the file fbm_base/fbm.xml by hand to allow this")

    for n, hurst_index in enumerate(args.hurst_indices):
        perturbation_folder = "H{}".format(hurst_index.replace(".","_"))
        os.makedirs(perturbation_folder, exist_ok=True)

        for m, resolution in enumerate(args.resolutions):

           
                
            resolution_folder = f"{perturbation_folder}/N{resolution}"
            os.makedirs(resolution_folder, exist_ok=True)

          
            
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
                    
            stats = get_xml_node(config, "config.uq.stats")
                    
            for stat in stats.getElementsByTagName("stat"):
                set_in_xml(stat, "numberOfH", int(resolution*32/1024))

            shutil.copyfile(os.path.join(os.path.dirname(args.config), python_file),
                             os.path.join(resolution_folder, python_file))



            with open(os.path.join(resolution_folder, os.path.basename(args.config)), 'w') as f:
                config.writexml(f)



