/// void create_radio_array_options(UIRadioArray, string0, .. stringn);

for (var i=1; i<argument_count; i++){
    var n=ds_list_size(argument[0].contents);
    var option=instance_create(0, argument[0].height*(1+n), UITextRadio);
    option.text=argument[i];
    option.root=argument[0];
    option.height=argument[0].height;
    option.value=n;
    
    ds_list_add(argument[0].contents, option);
}
