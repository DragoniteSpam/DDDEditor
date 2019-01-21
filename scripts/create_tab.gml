/// UITab create_tab(name, destination, home row, root, [help]);

with (instance_create(0, 0, UITab)){
    text=argument[0];
    destination=argument[1];
    home_row=argument[2];
    
    root=argument[3];
    
    switch (argument_count){
        case 5:
            help=argument[4];
            break;
    }
    return id;
}
