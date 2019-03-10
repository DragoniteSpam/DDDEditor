/// void momu_open(MenuElement);

var catch=argument0;

var fn=get_open_filename("DDD game files ("+EXPORT_EXTENSION_DATA+", "+EXPORT_EXTENSION_MAP+")|*"+EXPORT_EXTENSION_DATA+";*"+EXPORT_EXTENSION_MAP, "");

if (file_exists(fn)){
    serialize_load(fn);
}
