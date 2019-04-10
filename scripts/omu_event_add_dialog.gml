/// void omu_event_add_dialog(UIThing);

if (ds_list_size(Stuff.all_event_custom)>0){
    var selection=ui_list_selection(argument0.root.el_list_main);
    if (selection>=0){
        var node=event_create_node(Stuff.active_event, EventNodeTypes.CUSTOM);
        node.custom_guid=Stuff.all_event_custom[| selection].GUID;
    }
}

dialog_destroy();
