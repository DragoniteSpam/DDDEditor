/// UIRadioArray create_list(x, y, text, vacant text, width, element height, content slots, onvaluechange, allow multi select?, root, [help]);

with (instance_create(argument[0], argument[1], UIList)){
    text=argument[2];
    text_vacant=argument[3];
    width=argument[4];
    height=argument[5];
    
    slots=argument[6];
    onvaluechange=argument[7];
    allow_multi_select=argument[8];
    
    root=argument[9];
    
    switch (argument_count){
        case 11:
            help=argument[10];
            break;
    }
    
    if (slots*height<128){
        debug("List: "+text+" has a total height less than 128 ("+string(slots)+" slots of height "+string(height)+"). The scroll bar may not behave as intended.");
    }
    
    return id;
}
