/// void omu_entity_remove_event(UIThing);

var list=selection_all();

var index=ui_list_selection(Camera.ui.element_entity_events);

if (index>-1&&show_question("Do you really want to delete Event Page "+list[| 0].object_events[| index].name+"?")){
    var event=list[| 0].object_events[| index];
    instance_activate_object(event);
    instance_destroy(event);
    ds_list_delete(list[| 0].object_events, index);
    ui_list_clear(Camera.ui.element_entity_events);
}

ds_list_destroy(list);
