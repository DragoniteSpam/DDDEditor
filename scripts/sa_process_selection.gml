/// void sa_process_selection();
// could use selection_count() here but you may need to access
// element(s) of the list so that won't work

var list=selection_all();
ds_list_destroy(Camera.selected_entities);
Camera.selected_entities=list;

if (ds_list_size(list)==0){
    Camera.ui.element_entity_name.interactive=false;
    Camera.ui.element_entity_solid.interactive=false;
    Camera.ui.element_entity_static.interactive=false;
    Camera.ui.element_entity_events.interactive=false;
    Camera.ui.element_entity_event_add.interactive=false;
    Camera.ui.element_entity_event_remove.interactive=false;
    Camera.ui.element_entity_event_edit.interactive=false;
    
    ds_map_clear(Camera.ui.element_entity_events.selected_entries);
} else if (ds_list_size(list)==1){
    safa_on_select(list[| 0]);
} else {
    // populate the UI elements with a nice ¯\_(ツ)_/¯
    Camera.ui.element_entity_name.value="";
    Camera.ui.element_entity_solid.value=2;
    Camera.ui.element_entity_static.value=2;
    
    ds_map_clear(Camera.ui.element_entity_events.selected_entries);
    
    Camera.ui.element_entity_name.interactive=true;
    Camera.ui.element_entity_solid.interactive=true;
    Camera.ui.element_entity_static.interactive=true;
    
    Camera.ui.element_entity_events.interactive=false;
    Camera.ui.element_entity_event_add.interactive=false;
    Camera.ui.element_entity_event_remove.interactive=false;
    Camera.ui.element_entity_event_edit.interactive=false;
}
