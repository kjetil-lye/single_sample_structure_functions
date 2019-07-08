import argparse
import xml.dom.minidom
import shutil
import os

from xml_tools import set_in_xml, get_xml_node, get_in_xml, read_config
if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description="""
Makes an instance of the configuration file for each resolution and each perturbation. Folder layout will be

    pEPSILON/NRESOLUTION/configname.xml
            """)

    parser.add_argument('--cuda_cutoff', type=int, default=1024,
                        help="The lowest resolution for which to still use cuda")

    parser.add_argument('--resolutions', type=int, nargs='+', required=True,
                        help='Resolutions')
    
    parser.add_argument('--perturbations', type=str, nargs='+',
                        help="values of epsilon")


    parser.add_argument('--config', type=str, required=True,
                        help="Path to configuration file")

    args = parser.parse_args()

    config = read_config(args.config)



    for n, perturbation in enumerate(args.perturbations):
        perturbation_folder = "p{}".format(perturbation.replace(".","_"))
        os.mkdir(perturbation_folder)

        for m, resolution in enumerate(args.resolutions):
            resolution_folder = f"{perturbation_folder}/N{resolution}"
            os.mkdir(resolution_folder)

           
          
            set_in_xml(config, "config.fvm.grid.dimension", f"{resolution} {resolution} 1")

            python_file = get_in_xml(config, "config.initialData.python")

            initial_data_parameters = get_xml_node(config, "config.initialData.parameters")

            for initial_data_parameter in initial_data_parameters.getElementsByTagName("parameter"):
                name = get_in_xml(initial_data_parameter, "name")

                if name == "epsilon":
                    set_in_xml(initial_data_parameter, "value", perturbation)

            shutil.copyfile(os.path.join(os.path.dirname(args.config), python_file),
                             os.path.join(resolution_folder, python_file))
            stats = get_xml_node(config, "config.uq.stats")
                    
            for stat in stats.getElementsByTagName("stat"):
                set_in_xml(stat, "numberOfH", int(resolution*32/1024))


            with open(os.path.join(resolution_folder, os.path.basename(args.config)), 'w') as f:
                config.writexml(f)



