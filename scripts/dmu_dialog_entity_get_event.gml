/// void dmu_dialog_entity_get_event(UIThing);

var new_event=Stuff.all_events[| ui_list_selection(argument0.root.el_list)];

// safe
var index=ui_list_selection(Camera.ui.element_entity_events);
var list=selection_all();
var entity=list[| 0];
var page=entity.object_events[| index];
ds_list_destroy(list);

if (new_event.GUID!=page.event_guid){
    page.event_guid=new_event.GUID;
    show_message("spawn a second dialog to select the entrypoint here");
    argument0.root.root.el_event_guid.text="Event: "+new_event.name;
}

dmu_dialog_commit(argument0);
