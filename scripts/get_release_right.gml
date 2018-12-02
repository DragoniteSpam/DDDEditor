/// boolean get_release_right();

var clear=true;
switch (argument_count){
    case 1:
        clear=argument[0];
}

var s=Controller.release_right;
if (clear){
    Controller.release_right=false;
}
return s;
