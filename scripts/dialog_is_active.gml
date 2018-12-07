/// boolean dialog_is_active(Dialog);
// this assumes that if there are no active dialog windows,
// any active ui elements live in a Free Parking part of the
// window.

if (view_visible[view_3d_preview]){
    return false;
}

if (ds_list_empty(Camera.dialogs)){
    return true;
}

return ds_list_top(Camera.dialogs)==argument0;
