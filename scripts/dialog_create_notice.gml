/// void dialog_create_notice(Dialog, message, [caption message], [confirm message]);

var message=argument[1];
var caption_message="Important!";
var confirm_message="sure";

switch (argument_count){
    case 4:
        confirm_message=argument[3]
    case 3:
        caption_message=argument[2];
        break;
}

var dw=400;
var dh=240;

var dg=dialog_create(dw, dh, caption_message, dialog_default, dc_close_no_questions_asked, argument[0]);

var b_width=128;
var b_height=32;

var el_text=create_text(dw/2, dh*2/5, message, 0, 0, fa_center, dw-128, dg);
var el_ok=create_button(dw/2-b_width/2, dh-32-b_height/2, confirm_message, b_width, b_height, fa_center, dmu_close_no_questions_asked, dg);

ds_list_add(dg.contents, el_text, el_ok);
