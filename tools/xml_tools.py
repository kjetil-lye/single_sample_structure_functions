import xml.dom.minidom
def read_config(filename):
    return xml.dom.minidom.parse(filename)


def set_in_xml(xml_node, path, value):
    split_path = path.split(".")

    for tag_name in split_path:
        xml_node = xml_node.getElementsByTagName(tag_name)[0]

    xml_node.firstChild.nodeValue = value

def get_in_xml(xml_node, path):
    split_path = path.split(".")

    for tag_name in split_path:
        xml_node = xml_node.getElementsByTagName(tag_name)[0]

    return str(xml_node.firstChild.nodeValue)

def get_xml_node(xml_node, path):
    split_path = path.split(".")
    for tag_name in split_path:
        xml_node = xml_node.getElementsByTagName(tag_name)[0]

    return xml_node

def create_node_with_text(config, node_name, node_value):
    node = config.createElement(node_name)
    node_text = config.createTextNode(str(node_value))
    
    node.appendChild(node_text)
    return node
    

def make_functional_element(config, p, number_of_h, number_of_saves=8):
    basename = get_in_xml(config, "config.fvm.name").strip()

    
    functional = config.createElement("functional")
    
    name_node = create_node_with_text(config, "name", "structure_cube")
    p_node = create_node_with_text(config, "p", p)
    number_of_h_node = create_node_with_text(config, 'numberOfH', number_of_h)
    
    number_of_saves_node = create_node_with_text(config, "numberOfSaves", number_of_saves)
    
    writer_node = config.createElement("writer")
    
    type_node = create_node_with_text(config, "type", "netcdf")
    
    basename_node = create_node_with_text(config, 'basename',
                                          f"{basename}_functional_structure_cube_{p}")
    
    functional.appendChild(name_node)
    functional.appendChild(p_node)
    functional.appendChild(number_of_h_node)
    functional.appendChild(number_of_saves_node)
    writer_node.appendChild(type_node)
    writer_node.appendChild(basename_node)
    functional.appendChild(writer_node)
    
    return functional


def make_functional_element_time(config, p, number_of_h):
    basename = get_in_xml(config, "config.fvm.name").strip()
    end_time = float(get_in_xml(config, "config.fvm.endTime"))
    
    radius = 0.02 * end_time
    
    save_time = end_time - radius
    
    functional = config.createElement("functional")
    
    name_node = create_node_with_text(config, "name", "structure_cube")
    p_node = create_node_with_text(config, "p", p)
    number_of_h_node = create_node_with_text(config, 'numberOfH', number_of_h)
    
    time_node = create_node_with_text(config, "time", save_time)
    time_radius_node = create_node_with_text(config, "timeRadius", radius)
    
    writer_node = config.createElement("writer")
    
    type_node = create_node_with_text(config, "type", "netcdf")
    
    basename_node = create_node_with_text(config, 'basename', 
                                          f"{basename}_functional_time_integrated_structure_cube_{p}")
    
    functional.appendChild(name_node)
    functional.appendChild(p_node)
    functional.appendChild(time_node)
    functional.appendChild(number_of_h_node)
    functional.appendChild(time_radius_node)
    writer_node.appendChild(type_node)
    writer_node.appendChild(basename_node)
    functional.appendChild(writer_node)
    
    return functional
    
    
    