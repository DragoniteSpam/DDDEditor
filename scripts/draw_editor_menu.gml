// if you're using this in debug mode the overlay is going to be
// shown and that's going to block out the first part of the menu
if (DEBUG){
    var yy=24;
} else {
    var yy=0;
}

script_execute(menu.render, menu, 0, yy);
