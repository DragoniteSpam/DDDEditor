/// UIRadioArray create_checkbox(x, y, text, width, height, onvaluechange, default);

with (instance_create(argument0, argument1, UICheckbox)){
    text=argument2;
    width=argument3;
    height=argument4;
    
    onvaluechange=argument5;
    index=argument6;
    
    return id;
}
