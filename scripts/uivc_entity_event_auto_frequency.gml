/// void uivc_entity_event_auto_frequency(UIThing);

// safe
var index=ui_list_selection(Camera.ui.element_entity_events);
var list=Camera.selected_entities
var entity=list[| 0];
var page=entity.object_events[| index];

page.autonomous_movement_frequency=argument0.value;
