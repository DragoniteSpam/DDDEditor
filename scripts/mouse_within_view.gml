/// boolean mouse_within_view(view);

return point_in_rectangle(Camera.MOUSE_X, Camera.MOUSE_Y,
    view_xview[argument0], view_yview[argument0],
    view_xview[argument0]+view_wview[argument0],
    view_yview[argument0]+view_hview[argument0]);
