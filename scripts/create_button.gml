/// UIButton create_button(x, y, text, width, height, alignment, onmouseup, root);

with (instance_create(argument0, argument1, UIButton)){
    text=argument2;
    width=argument3;
    height=argument4;

    alignment=argument5;    
    onmouseup=argument6;
    root=argument7;
    
    return id;
}
