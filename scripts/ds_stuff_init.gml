/// void ds_stuff_init();
var dll = "data\stuff.dll";
var calltype = dll_cdecl;

global._ds_stuff_open=external_define(dll, "open", calltype, ty_real, 1, ty_string);
