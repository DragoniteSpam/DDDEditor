/// UICheckbox create_checkbox(x, y, text, width, height, onvaluechange, key, default, root, [help]);

with (instance_create(argument[0], argument[1], UICheckbox)){
    text=argument[2];
    width=argument[3];
    height=argument[4];
    
    onvaluechange=argument[5];
    key=argument[6];
    value=argument[7];
    
    root=argument[8];
    
    switch (argument_count){
        case 10:
            help=argument[9];
            break;
    }
    
    return id;
}
