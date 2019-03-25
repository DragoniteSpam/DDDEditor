/// void uivc_entity_event_enable_item(UIThing);

// safe
var index=ui_list_selection(Camera.ui.element_entity_events);
var list=selection_all();
var entity=list[| 0];
var page=entity.object_events[| index];
ds_list_destroy(list);

page.condition_item_enabled=argument0.value;
