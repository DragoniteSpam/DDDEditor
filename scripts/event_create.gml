/// DataEvent event_create(name);

var event=instance_create(0, 0, DataEvent);
event.name=argument0;
instance_deactivate_object(event);

ds_list_add(Stuff.all_events, event);

return event;
