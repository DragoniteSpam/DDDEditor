/// UIInput create_input(x, y, text, width, height, onvaluechange, key, value, help text, validation, value conversion, lower bound, upper bound, value character limit, value x1, value y1, value x2, value y2, root, [help]);

with (instance_create(argument[0], argument[1], UIInput)){
    text=argument[2];
    width=argument[3];
    height=argument[4];
    
    onvaluechange=argument[5];
    key=argument[6];
    value=string(argument[7]);
    value_default=string(argument[8]);
    validation=argument[9];
    value_conversion=argument[10];
    
    value_lower=argument[11];
    value_upper=argument[12];
    value_limit=argument[13];
    
    value_x1=argument[14];
    value_y1=argument[15];
    value_x2=argument[16];
    value_y2=argument[17];
    
    root=argument[18];
    
    switch (argument_count){
        case 20:
            help=argument[19];
            break;
    }
    
    return id;
}
