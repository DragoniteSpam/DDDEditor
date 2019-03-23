var list=selection_all();

if (ds_list_size(list)==0){
} else if (ds_list_size(list)==1){
    safa_on_select(list[| 0]);
} else {
    // populate the UI elements with a nice ¯\_(ツ)_/¯
    Camera.ui.element_entity_name.value="";
    Camera.ui.element_entity_solid.value=2;
    Camera.ui.element_entity_static.value=2;
}

ds_list_destroy(list);
