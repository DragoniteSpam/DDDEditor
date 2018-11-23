if (!selection_empty()){
    for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
        var thing=ActiveMap.all_entities[| i];
        if (selected(thing)){
            thing.modification=Modifications.REMOVE;
            ds_list_add(changes, thing);
        }
    }
}
