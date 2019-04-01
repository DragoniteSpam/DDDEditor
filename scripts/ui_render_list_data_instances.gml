/// void ui_render_list_data_instances(UIList);

var otext=argument0.text;
var oentries=argument0.entries;
var otextvacant=argument0.text_vacant;

var data=guid_get(argument0.root.active_type_guid);

if (data!=noone){
    if (data.is_enum){
        argument0.text_vacant="<Enums can't be instantiated>"
    } else {
        argument0.entries=data.instances;
    }
    argument0.root.el_inst_add.interactive=!data.is_enum;
    argument0.root.el_inst_remove.interactive=!data.is_enum;
}

ui_render_list(argument0, argument1, argument2);

argument0.text=otext;
argument0.entries=oentries;
argument0.text_vacant=otextvacant;
