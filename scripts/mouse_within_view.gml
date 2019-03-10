/// boolean mouse_within_view(view);

return point_in_rectangle(Camera.MOUSE_X, Camera.MOUSE_Y,
    view_xport[argument0], view_yport[argument0],
    view_xport[argument0]+view_wport[argument0],
    view_yport[argument0]+view_hport[argument0]);
