/// Dialog dialog_create(width, height, text, render, commit, root);

var base_x=128;
var base_y=96;
var offset=64;
var n=ds_list_size(Camera.dialogs);

var dg=instance_create(base_x+n*offset, base_y+n*offset, Dialog);
dg.width=argument0;
dg.height=argument1;
dg.text=argument2;
dg.render=argument3;
dg.commit=argument4;
dg.root=argument5;
ds_list_add(Camera.dialogs, dg);
instance_deactivate_object(dg);

return dg;
