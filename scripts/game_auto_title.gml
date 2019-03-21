/// void game_auto_title();

var displayname="";

if (string_length(Stuff.save_name_data)>0){
    displayname=Stuff.save_name_data+" [data]";
}

if (string_length(Stuff.save_name_data)>0&&string_length(Stuff.save_name_map)>0){
    displayname=": "+displayname+" / ";
}

if (string_length(Stuff.save_name_map)>0){
    displayname=displayname+Stuff.save_name_map+" [map]";
}

window_set_caption("DDD Editor - "+displayname);
