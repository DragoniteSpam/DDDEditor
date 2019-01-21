/// UIText create_text(x, y, text, width, height, halignment, wrap width, root, [help]);

with (instance_create(argument[0], argument[1], UIText)){
    text=argument[2];
    width=argument[3];
    height=argument[4];

    alignment=argument[5];
    wrap_width=argument[6];
    root=argument[7];
    
    switch (argument_count){
        case 9:
            help=argument[8];
            break;
    }
    
    return id;
}
