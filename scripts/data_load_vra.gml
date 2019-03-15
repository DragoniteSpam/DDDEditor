/// void data_load_vra();

if (!directory_exists(PATH_VRA)){
    directory_create(PATH_VRA);
}

if (file_exists(".\data.ini")){
    ini_open(".\data.ini");
    vra_name=ini_read_string("important", "vrax", "");
    ini_close();

    if (file_exists(PATH_VRA+vra_name)){
        data_load_vra_actually_thanks(PATH_VRA+vra_name);
    } else if (string_length(vra_name)>0){
        show_message("Did not find vrax (mesh) file: "+vra_name);
    } else {
        debug("no vrax defined");
    }
}
