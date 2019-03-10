/// boolean rectangle_within_view(view, x1, y1, x2, y2);

return
    // first corner
    point_in_rectangle(argument1, argument2,
    view_xview[argument0], view_yview[argument0],
    view_xview[argument0]+view_wview[argument0],
    view_yview[argument0]+view_hview[argument0])||
    // opposint corner
    point_in_rectangle(argument3, argument4,
    view_xview[argument0], view_yview[argument0],
    view_xview[argument0]+view_wview[argument0],
    view_yview[argument0]+view_hview[argument0]);
