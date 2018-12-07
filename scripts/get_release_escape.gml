/// boolean get_release_escape([clear?]);

var clear=true;
switch (argument_count){
    case 1:
        clear=argument[0];
}

var s=Controller.release_escape;
if (clear){
    Controller.release_escape=false;
}
return s;
