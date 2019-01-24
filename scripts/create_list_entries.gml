/// void create_list_entries(UIList, string0, .. stringn);

for (var i=1; i<argument_count; i++){
    ds_list_add(argument[0].entries, argument[i]);
}
