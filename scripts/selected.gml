/// boolean selected(Entity);

for (var i=0; i<ds_list_size(selection); i++){
    if (script_execute(selection[| i].selected_determination, selection[| i], argument0)){
        return true;
    }
}

return false;
