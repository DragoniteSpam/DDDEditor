/// UIImageButton create_image_button(x, y, text, image, width, height, alignment, onmouseup, root, [help]);

with (instance_create(argument[0], argument[1], UIButton)){
    text=argument[2];
    image=argument[3];
    width=argument[4];
    height=argument[5];

    alignment=argument[6];
    onmouseup=argument[7];
    root=argument[8];
    
    switch (argument_count){
        case 10:
            help=argument[9];
            break;
    }
    
    return id;
}
