/// void uivc_bezier_precision(UIThing);

if (script_execute(argument0.validation, argument0.value)){
    Stuff.setting_bezier_precision=clamp(script_execute(argument0.value_conversion, argument0.value),
        argument0.value_lower, argument0.value_upper);
}
