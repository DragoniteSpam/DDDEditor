/// void create_bitfield_options(UIRadioArray, data0, .. datan);
/*
 * data is an array with the following data:
 * 1. render
 * 2. onvaluechange
 * 3. text
 * 4. sprite
 * 5. image index
 */

for (var i=1; i<argument_count; i++){
    var n=ds_list_size(argument[0].contents);
    var data=argument[i];
    var option=instance_create(0, argument[0].height*(1+n), UITextRadio);
    option.text=argument[i];
    option.parent=argument[0];
    option.height=argument[0].height;
    option.value=n;
    
    ds_list_add(argument[0].contents, option);
}
