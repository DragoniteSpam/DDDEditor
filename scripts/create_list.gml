/// UIRadioArray create_list(x, y, text, vacant text, width, height, content slots, onvaluechange, allow multi select?, root);

with (instance_create(argument0, argument1, UIList)){
    text=argument2;
    text_vacant=argument3;
    width=argument4;
    height=argument5;
    
    slots=argument6;
    onvaluechange=argument7;
    allow_multi_select=argument8;
    
    root=argument9;
    
    return id;
}
