/// UIImageButton create_image_button(x, y, text, image, width, height, alignment, onmouseup, root, [help], [anchor horizontal], [anchor vertical]);

with (instance_create(argument[0], argument[1], UIImageButton)){
    text=argument[2];
    image=argument[3];
    width=argument[4];
    height=argument[5];

    alignment=argument[6];
    onmouseup=argument[7];
    root=argument[8];
    
    switch (argument_count){
        case 12:
            switch (argument[11]){
                case fa_top:
                    break;
                case fa_middle:
                    y=y-height/2;
                    break;
                case fa_bottom:
                    y=y-height;
                    break;
            }
        case 11:
            switch (argument[10]){
                case fa_left:
                    break;
                case fa_center:
                    x=x-width/2;
                    break;
                case fa_right:
                    x=x-width;
                    break;
            }
        case 10:
            help=argument[9];
            break;
    }
    
    return id;
}
