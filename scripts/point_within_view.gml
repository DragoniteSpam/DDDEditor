/// boolean point_within_view(view, x, y);

return point_in_rectangle(argument1, argument2,
    view_xport[argument0], view_yport[argument0],
    view_xport[argument0]+view_wport[argument0],
    view_yport[argument0]+view_hport[argument0]);
