/// void uivc_backups(UIThing);

if (script_execute(argument0.validation, argument0.value)){
    Stuff.setting_backups=clamp(script_execute(argument0.value_conversion, argument0.value),
        argument0.value_lower, argument0.value_upper);
}
