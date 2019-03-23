/// void selection_all();

var list=ds_list_create();

for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
    var thing=ActiveMap.all_entities[| i];
    if (selected(thing)){
        ds_list_add(list, thing);
    }
}

return list;
