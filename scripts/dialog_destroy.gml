/// void dialog_destroy();
// closes the top dialog. or schedules it for closing. if you
// destroy it now, bad things will happen to other parts of the
// Draw event which still reference it.

if (dialog_exists()){
    ds_queue_enqueue(Camera.stuff_to_destroy, ds_list_pop(Camera.dialogs));
}
