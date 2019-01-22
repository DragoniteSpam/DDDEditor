/// void data_load_vra();

var vra_path=".\vra\";

if (!directory_exists(vra_path)){
    directory_create(vra_path);
}

if (file_exists(".\data.ini")){
    ini_open(".\data.ini");
    vra_name=ini_read_string("important", "vrax", "");
    ini_close();

    if (file_exists(vra_path+vra_name)){
        data_load_vra_actually_thanks(vra_path+vra_name);
    } else if (string_length(vra_name)>0){
        show_message("Did not find vrax (mesh) file: "+vra_name);
    } else {
        debug("no vrax defined");
    }
}
