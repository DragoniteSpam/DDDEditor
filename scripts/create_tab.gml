/// UITab create_tab(name, destination, home row, root);

with (instance_create(0, 0, UITab)){
    text=argument0;
    destination=argument1;
    home_row=argument2;
    
    root=argument3;
    return id;
}
