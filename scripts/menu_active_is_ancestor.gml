/// boolean menu_active_is_ancestor(active, root);

if (argument0.parent==noone){
    return false;
}

if (argument0.parent==argument1){
    return true;
}

return menu_active_is_ancestor(argument0.parent, argument1);
