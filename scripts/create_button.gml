/// UIButton create_button(x, y, text, width, height, alignment, onmouseup, root, [help]);

with (instance_create(argument[0], argument[1], UIButton)){
    text=argument[2];
    width=argument[3];
    height=argument[4];

    alignment=argument[5];
    onmouseup=argument[6];
    root=argument[7];
    
    switch (argument_count){
        case 9:
            help=argument[8];
            break;
    }
    
    return id;
}
