/// void uivc_entity_auto_speed(UIThing);

// safe
var entity=Camera.selected_entities[| 0];

entity.autonomous_movement_speed=argument0.value;
