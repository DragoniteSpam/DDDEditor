// could use selection_count() here but you may need to access
// element(s) of the list so that won't work

var list=selection_all();

if (ds_list_size(list)==0){
} else if (ds_list_size(list)==1){
    safa_on_select(list[| 0]);
} else {
    // populate the UI elements with a nice ¯\_(ツ)_/¯
    Camera.ui.element_entity_name.value="";
    Camera.ui.element_entity_solid.value=2;
    Camera.ui.element_entity_static.value=2;
    
    Camera.ui.element_entity_event_add.interactive=false;
    Camera.ui.element_entity_event_remove.interactive=false;
}

ds_list_destroy(list);
