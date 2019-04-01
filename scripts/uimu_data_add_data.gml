/// uimu_data_add_data(UIThing);

var data=guid_get(argument0.root.active_type_guid);

if (data!=noone){
    var instance=instance_create(0, 0, DataInstantiated);
    instance.name=data.name+"_"+string(ds_list_size(data.instances));
    instance_deactivate_object(instance);
    ds_list_add(data.instances, instance);
}
