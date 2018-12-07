/// boolean dialog_exists();
// also returns true if the 3D preview is enabled. i should rename this.

return !ds_list_empty(Camera.dialogs)||view_visible[view_3d_preview];
