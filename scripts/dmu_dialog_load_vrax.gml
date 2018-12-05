/// void dmu_dialog_load_vrax(UIThing);

var fn=get_open_filename("virgo mesh collections (*.vrax)|*.vrax", "");

var vra_path=".\vra\";

if (file_exists(fn)){
    var nn=filename_name(fn);
    file_copy(fn, vra_path+nn);
    with (Stuff){
        data_load_vra_actually_thanks(vra_path+nn);
        ini_open(".\data.ini");
        ini_write_string("important", "vrax", nn);
        ini_close();
    }
}
