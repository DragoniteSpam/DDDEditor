/// void dc_close_data_discard(Dialog, [force?]);

// for whatever dumb reason, the original objects are the ones
// that get changed. so delete the original objects and replace
// them with the cached ones.
var pending=ds_list_create();
ds_list_copy(pending, Stuff.all_data);
for (var i=0; i<ds_list_size(pending); i++){
    instance_activate_object(pending[| i]);
    instance_destroy(pending[| i]);
}

ds_list_destroy(pending);
ds_list_destroy(Stuff.all_data);

Stuff.all_data=Stuff.original_data;

for (var i=0; i<ds_list_size(Stuff.all_data); i++){
    var data=Stuff.all_data[| i];
    guid_set(data);
    for (var j=0; j<ds_list_size(data.properties); j++){
        guid_set(data.properties[| j]);
    }
}

Stuff.original_data=noone;

dc_close_no_questions_asked(argument0);
