/// uivc_input_entity_name(UIThing);

var list=selection_all();

// for things like this that are more specific than Entity check to
// make sure that they're instanceof whatever before setting/modifying
// the value
for (var i=0; i<ds_list_size(list); i++){
    list[| i].name=argument0.value;
}

ds_list_destroy(list);