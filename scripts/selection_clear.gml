for (var i=0; i<ds_list_size(selection); i++){
    instance_activate_object(selection[| i]);
    instance_destroy(selection[| i]);
}

ds_list_clear(selection);
last_selection=noone;

Camera.ui.element_entity_name.value="";
Camera.ui.element_entity_solid.value=false;
Camera.ui.element_entity_static.value=false;
