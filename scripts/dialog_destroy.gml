/// void dialog_destroy();
// closes the top dialog.

if (dialog_exists()){
    var dg=ds_list_pop(Camera.dialogs);
    instance_activate_object(dg);
    instance_destroy(dg);
}
