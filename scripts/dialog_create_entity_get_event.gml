/// void dialog_create_entity_get_event(Dialog);

var dw=320;
var dh=640;

// you can assume that this is valid data because this won't be called otherwise
var index=ui_list_selection(Camera.ui.element_entity_events);
var list=selection_all();
var entity=list[| 0];
if you select an event once and try to select another one, things explode around here.
i need to go to class now though so fix this later.
var page=entity.object_events[| index];
var dg=dialog_create(dw, dh, "Select Event", dialog_default, dc_settings_map, argument0);
ds_list_destroy(list);

// three columns!
var columns=1;
var ew=(dw-columns*32)/columns;
var eh=24;

var vx1=dw/(columns*2)-16;
var vy1=0;
var vx2=vx1+dw/(columns*2)-16;
var vy2=vy1+eh;

var yy=64;
var spacing=16;

var el_list=create_list(16, yy, "Select an event", "<should never see this>", ew, eh, 20, null, false, dg);
el_list.render=ui_render_list_event;
el_list.entries_are_instances=true;
dg.el_list=el_list;

for (var i=0; i<ds_list_size(Stuff.all_events); i++){
    if (Stuff.all_events[| i].GUID==page.event_guid){
        ds_list_add(el_list.selected_entries, i);
        break;
    }
}

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Commit", b_width, b_height, fa_center, dmu_dialog_entity_get_event, dg);
// on commit: select entrypoint as well, since the existing one most likely won't exist in the new event
// unless it has the generic name; additionally, validate the event entrypoint and the existence of the
// event GUID on closing the parent form, and on saving, and on loading
ds_list_add(dg.contents, el_list,
    el_confirm);

keyboard_string="";

return dg;
