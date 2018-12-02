/// void ui_render(UIThing, x, y);

for (var i=0; i<ds_list_size(argument0.contents); i++){
    var thing=argument0.contents[| i];
    script_execute(thing.render, thing, argument1, argument2);
}
