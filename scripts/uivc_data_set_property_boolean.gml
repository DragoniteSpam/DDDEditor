/// void uivc_data_set_property_boolean(UIThing);

var data=guid_get(Camera.ui_game_data.active_type_guid);
var selection=ui_list_selection(Camera.ui_game_data.el_instances);

if (selection>=0){
    (guid_get(data.instances[| selection].GUID)).values[| argument0.key]=argument0.value;
}
