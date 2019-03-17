/// void momu_open(MenuElement);

var catch=argument0;

// don't do it right here because you may do things with tileset surfaces and that makes
// bad things happen if you're in the middle of drawing
Camera.schedule_open=true;
