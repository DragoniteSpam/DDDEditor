/// void omu_data_property_add(UIThing);

var datadata=argument0.root.selected_data;

var property=instance_create(0, 0, DataProperty);
property.name="Property"+string(ds_list_size(datadata.properties));
ds_list_add(datadata.properties, property);
instance_deactivate_object(property);
