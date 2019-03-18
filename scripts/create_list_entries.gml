/// void create_list_entries(UIList, string0, color0, .. stringn, colorn);

for (var i=1; i<argument_count; i=i+2){
    ds_list_add(argument[0].entries, argument[i]);
    ds_list_add(argument[0].entry_colors, argument[i+1]);
}
