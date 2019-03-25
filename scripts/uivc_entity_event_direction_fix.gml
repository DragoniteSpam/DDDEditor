/// void uivc_entity_event_direction_fix(UIThing);

// safe
var index=ui_list_selection(Camera.ui.element_entity_events);
var list=selection_all();
var entity=list[| 0];
var page=entity.object_events[| index];
ds_list_destroy(list);

page.option_direction_fix=argument0.value;
