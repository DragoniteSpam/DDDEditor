#define regex_init
globalvar __regex_compilemode;
__regex_compilemode=c_regex_windows;

#define regex_setmode
__regex_compilemode=argument0;

#define regex_setinput
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _01dll(argument0);
        break;
    case c_regex_javascript:
        return _01js(argument0);
        break;
    case c_regex_android:
	return _01ad(argument0);
	break;
    default:
	return 0;
}

#define regex_setkey
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _02dll(argument0);
        break;
    case c_regex_javascript:
        return _02js(argument0);
        break;
    case c_regex_android:
	return _02ad(argument0);
	break;
    default:
	return 0;
}

#define regex_search
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _03dll();
        break;
    case c_regex_javascript:
        return _03js();
        break;
    case c_regex_android:
	return _03ad();
	break;
    default:
	return 0;
}

#define regex_match
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _04dll();
        break;
    case c_regex_javascript:
        return _04js();
        break;
    case c_regex_android:
	return _04ad();
	break;
    default:
	return 0;
}

#define regex_search_fast
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _05dll();
        break;
    case c_regex_javascript:
        return _05js();
        break;
    default:
	return 0;
}

#define regex_match_fast
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _06dll();
        break;
    case c_regex_javascript:
        return _06js();
        break;
    default:
	return 0;
}

#define regex_matchcount
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _07dll();
        break;
    case c_regex_javascript:
        return _07js();
        break;
    case c_regex_android:
	return _07ad();
	break;
    default:
	return 0;
}

#define regex_getmatch
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _08dll(argument0);
        break;
    case c_regex_javascript:
        return _08js(argument0);
        break;
    case c_regex_android:
	return _08ad(argument0);
	break;
    default:
	return "";
}

#define regex_replace
switch (__regex_compilemode)
{
    case c_regex_windows:
        return _09dll(argument0);
        break;
    case c_regex_javascript:
        return _09js(argument0);
        break;
    case c_regex_android:
	return _09ad(argument0);
	break;
    default:
	return argument0;
}

