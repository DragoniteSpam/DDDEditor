/// Dialog dialog_create(width, height, text, render, commit, root, [close]);

var base_x=128;
var base_y=96;
var offset=64;
var n=ds_list_size(Camera.dialogs);

var dg=instance_create(base_x+n*offset, base_y+n*offset, Dialog);
dg.width=argument[0];
dg.height=argument[1];
dg.text=argument[2];
dg.render=argument[3];
dg.commit=argument[4];
dg.root=argument[5];

if (argument_count>6){
    dg.close=argument[6];
}

ds_list_add(Camera.dialogs, dg);
instance_deactivate_object(dg);

return dg;
