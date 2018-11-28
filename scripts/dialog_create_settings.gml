/// void dialog_create_settings();

var dw=512;
var dh=320;

var dg=dialog_create(dw, dh, "Settings", dialog_settings);

var ew=(dw-64)/2;
var eh=24;

var element=create_checkbox(dg.x+32, dg.y+64, "Dummy option", ew, eh, null, false);
ds_list_add(dg.contents, element);
