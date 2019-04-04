/// void uivc_data_set_property_list(UIList);

var data=guid_get(Camera.ui_game_data.active_type_guid);
var selection=ui_list_selection(Camera.ui_game_data.el_instances);
var property_selection=ui_list_selection(argument0);

if (selection>=0){
    this is causing things to break even though as far as i can tell it shouldnt be
    
    trying to index a variable which is not an array
     at gml_Script_uivc_data_set_property_list (line 9) -     (guid_get(data.instances[| selection].GUID)).values[| argument0.key]=property_selection; 
     
    show_message(argument0.key)
    (guid_get(data.instances[| selection].GUID)).values[| argument0.key]=property_selection;
}
