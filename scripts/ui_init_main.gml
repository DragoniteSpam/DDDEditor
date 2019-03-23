/// ui_init_main();

with (instance_create(0, 0, UIMain)){
    /*
     * tab system setup
     */
    
    // it would be best if you don't ask to access these later but if you need to these are just
    // object variables so you can look them up
    t_general=create_tab("General", 0, id, HelpPages.TAB_GENERAL);
    t_stats=create_tab("Stats", 0, id);
    t_2=create_tab("ehh", 0, id);
    
    t_p_tile_editor=create_tab("Tile Ed.", 1, id, HelpPages.TAB_TILE_EDITOR);
    t_p_autotile_editor=create_tab("Autotile Ed.", 1, id, HelpPages.TAB_AUTOTILE_EDITOR);
    t_p_mesh_editor=create_tab("Mesh Ed.", 1, id, HelpPages.TAB_MESH_EDITOR);
    t_p_other_editor=create_tab("Other Ed.", 1, id);
    
    t_p_entity=create_tab("Entity", 2, id, HelpPages.TAB_ENTITY);
    t_p_tile=create_tab("Tile", 2, id, HelpPages.TAB_TILE);
    t_p_mesh=create_tab("Mesh", 2, id, HelpPages.TAB_MESH);
    t_p_mob=create_tab("Mob", 2, id, HelpPages.TAB_MOB);
    t_p_effect=create_tab("Effect", 2, id, HelpPages.TAB_EFFECT);
    t_p_event=create_tab("Event", 2, id, HelpPages.TAB_EVENT);
    
    // the game will crash if you create a tab row with zero width.
    var tr_general=ds_list_create();
    ds_list_add(tr_general, t_general, t_stats, t_2);
    var tr_editor=ds_list_create();
    ds_list_add(tr_editor, t_p_tile_editor, t_p_autotile_editor, t_p_mesh_editor, t_p_other_editor);
    var tr_world=ds_list_create();
    ds_list_add(tr_world, t_p_entity, t_p_tile, t_p_mesh, t_p_mob, t_p_effect, t_p_event);
    
    ds_list_add(tabs, tr_general, tr_editor, tr_world);
    
    active_tab=t_general;
    
    // don't try to make three columns. the math has been hard-coded
    // for two. everything will go very badly if you try three or more.
    var element;
    var spacing=16;
    var legal_x=CW+32;
    var legal_y=128;
    var legal_width=ui_legal_width();
    var col_width=legal_width/2-spacing*1.5;
    var col2_x=legal_x+col_width+spacing*2;
    
    var button_width=128;
    
    /*
     * general tab setup
     */
    
    var yy=legal_y+spacing;
    
    element=create_radio_array(legal_x+spacing, yy, "Selection mode", col_width, element_height, uivc_radio_selection_mode, Camera.selection_mode, t_general);
    create_radio_array_options(element, "Single", "Rectangle", "Circle");
    ds_list_add(t_general.contents, element);
    
    yy=yy+ui_get_radio_array_height(element)+spacing;
    
    element=create_checkbox(legal_x+spacing, yy, "Additive Selection", col_width, element_height, uivc_check_selection_addition, "", Camera.selection_addition, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_radio_array(legal_x+spacing, yy, "Fill Type", col_width, element_height, uivc_radio_fill_type, Camera.selection_fill_type, t_general);
    create_radio_array_options(element, "Tile", "Autotile", "Mesh", "Mob", "Effect");
    ds_list_add(t_general.contents, element);
    
    yy=yy+ui_get_radio_array_height(element)+spacing;
    
    element=create_button(legal_x+spacing, yy, "Fill Selection (Space)", col_width, element_height, fa_center, uimu_selection_fill, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_button(legal_x+spacing, yy, "Delete Selection (Delete)", col_width, element_height, fa_center, uimu_selection_delete, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=legal_y+spacing;
    
    element=create_button(col2_x, yy, "View Master Texture", col_width, element_height, fa_center, uimu_view_master_texture, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "View Wireframes", col_width, element_height, uivc_check_view_wireframe, "", Camera.view_wireframe, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "View Grid and Markers", col_width, element_height, uivc_check_view_grids, "", Camera.view_grid, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "View Texture", col_width, element_height, uivc_check_view_texture, "", Camera.view_texture, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "View Entities", col_width, element_height, uivc_check_view_entities, "", Camera.view_entities, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "View Backfaces", col_width, element_height, uivc_check_view_backface, "", Camera.view_backface, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_text(col2_x, yy, "Map Settings", col_width, element_height, fa_left, col_width, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_button(col2_x, yy, "Freeze Selected", col_width, element_height, fa_center, uimu_freeze_ask, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "Dummy Option 2", col_width, element_height, null, "", false, t_general);
    ds_list_add(t_general.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_checkbox(col2_x, yy, "Dummy Option 3", col_width, element_height, null, "", false, t_general);
    ds_list_add(t_general.contents, element);
    
    /*
     * entity tab
     */
    
    yy=legal_y+spacing;
    
    element_all_entities=create_list(legal_x+spacing, yy, "All Entities", "<No entities>", col_width, element_height, 28, null, true, t_stats);
    element_all_entities.render=ui_render_list_all_entities;
    ds_list_add(t_stats.contents, element_all_entities);
    
    yy=yy+element.height+spacing;
    
    /*
     * entity tab
     */
    
    yy=legal_y+spacing;
    
    element=create_text(legal_x+spacing, yy, "Common entity properties will show up here, hopefully", col_width, element_height*2, fa_left, col_width, t_p_entity);
    ds_list_add(t_p_entity.contents, element);
    
    /*
     * tile tab
     */
    
    yy=legal_y+spacing;
    
    element=create_text(legal_x+spacing, yy, "Select a tile to place down!", col_width, element_height, fa_left, col_width, t_p_tile_editor);
    ds_list_add(t_p_tile_editor.contents, element);
    
    element=create_button(col2_x+col_width/2, yy, "Tileset Data", button_width, element_height, fa_center, omu_manager_tileset, t_p_tile_editor, HelpPages.TAB_TILE_EDITOR, fa_middle, fa_top);
    ds_list_add(t_p_tile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_tile_selector(legal_x+spacing, yy, legal_width-spacing*2, (legal_width div Stuff.tile_width)*Stuff.tile_width-element_height, uivc_select_tile, uivc_select_tile_backwards, t_p_tile_editor);
    ds_list_add(t_p_tile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    var yy_aftergrid=yy;
    
    element=create_radio_array(legal_x+spacing, yy, "Data to View", col_width, element_height, uivc_tile_set_data_view, Camera.tile_data_view, t_p_tile_editor);
    create_radio_array_options(element, "Passage", "Priority", "Flags (off)", "Tags");
    ds_list_add(t_p_tile_editor.contents, element);
    
    yy=yy+ui_get_radio_array_height(element)+spacing;
    
    element=create_radio_array(legal_x+spacing, yy, "On Click", col_width, element_height, uivc_tile_set_on_click, Camera.tile_on_click, t_p_tile_editor);
    create_radio_array_options(element, "Select", "Modify");
    ds_list_add(t_p_tile_editor.contents, element);
    
    // second column
    
    yy=yy_aftergrid;
    
    element=create_text(col2_x, yy, "Tile Properties: x, y", col_width, element_height, fa_left, col_width, t_p_tile_editor);
    element.render=ui_render_text_tile_label;
    ds_list_add(t_p_tile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    var s=10;
    
    element=create_bitfield(col2_x, yy, "Passage:", 84, element_height, null, TILE_PASSABLE, t_p_tile_editor);
    create_bitfield_options(element, create_bitfield_option_data(TilePassability.UP, ui_render_bitfield_option_picture_tile_passability, uivc_bitfield_tile_passability, "", spr_direction, 0, s, s),
        create_bitfield_option_data(TilePassability.DOWN, ui_render_bitfield_option_picture_tile_passability, uivc_bitfield_tile_passability, "", spr_direction, 1, s, s),
        create_bitfield_option_data(TilePassability.LEFT, ui_render_bitfield_option_picture_tile_passability, uivc_bitfield_tile_passability, "", spr_direction, 2, s, s),
        create_bitfield_option_data(TilePassability.RIGHT, ui_render_bitfield_option_picture_tile_passability, uivc_bitfield_tile_passability, "", spr_direction, 3, s, s),
        create_bitfield_option_data(TILE_PASSABLE, ui_render_bitfield_option_text_passability_tile_passable, uivc_bitfield_tile_passability_passable, "O", spr_direction, 0, s, s),
        create_bitfield_option_data(0, ui_render_bitfield_option_text_passability_tile_solid, uivc_bitfield_tile_passability_solid, "X", spr_direction, 0, s, s));
    ds_list_add(t_p_tile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_input(col2_x, yy, "Priority:", col_width, element_height, uivc_input_tile_priority, "", 0, 0, validate_int, ui_value_real, 0, TILE_MAX_PRIORITY-1, 3, 84, 0, 84+64, element_height, t_p_tile_editor);
    element.render=ui_render_input_tile_priority;
    ds_list_add(t_p_tile_editor.contents, element);
    
    // this is totally cheating but game maker allows me to do it so shut up
    t_p_tile_editor.element_priority=element;
    
    yy=yy+element.height+spacing;
    
    element=create_bitfield(col2_x, yy, "Flags:", 84, element_height, fa_left, col_width, t_p_tile_editor);
    create_bitfield_options(element, create_bitfield_option_data(TileFlags.BUSH, ui_render_bitfield_option_text_tile_flag, uivc_bitfield_tile_flag, "B", -1, 0, s, s),
        create_bitfield_option_data(TileFlags.COUNTER, ui_render_bitfield_option_text_tile_flag, uivc_bitfield_tile_flag, "C", -1, 0, s, s));
    ds_list_add(t_p_tile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_input(col2_x, yy, "Tag:", col_width, element_height, uivc_input_tile_tag, "", 0, 0, validate_int, ui_value_real, 0, TileTerrainTags.FINAL-1, 2, 84, 0, 84+64, element_height, t_p_tile_editor);
    ds_list_add(t_p_tile_editor.contents, element);
    
    t_p_tile_editor.element_tag=element;
    
    yy=yy+element.height+spacing;
    
    element=create_button(col2_x+16, yy, "-", element_height, element_height, fa_center, uimu_tile_tag_down, t_p_tile_editor);
    ds_list_add(t_p_tile_editor.contents, element);
    element=create_text(col2_x+48, yy, "tag name", col_width, element_height, fa_left, 128, t_p_tile_editor);
    element.render=ui_render_text_tile_tag;
    ds_list_add(t_p_tile_editor.contents, element);
    element=create_button(col2_x+176, yy, "+", element_height, element_height, fa_center, uimu_tile_tag_up, t_p_tile_editor);
    ds_list_add(t_p_tile_editor.contents, element);
    
    /*
     * mesh tab
     */
    
    yy=legal_y+spacing;
    
    // this is an object variable
    element_mesh_list=create_list(legal_x+spacing, yy, "Available meshes: ", "<no meshes>", col_width, element_height, 28, uivc_list_selection_mesh, false, t_p_mesh_editor);
    ds_map_add(element_mesh_list.selected_entries, 0, true);
    // NOT POPULATED YET. the meshes haven't been loaded in yet. it gets populated when that happens.
    ds_list_add(t_p_mesh_editor.contents, element_mesh_list);
    
    element=create_text(col2_x, yy, "Mesh Properties:", col_width, element_height, fa_left, col_width, t_p_mesh_editor);
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_text(col2_x, yy, "<Name>", col_width, element_height, fa_left, col_width, t_p_mesh_editor);
    element.render=ui_render_text_mesh_label;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    var s=10;
    
    yy=yy+element.height+spacing;
    
    element=create_bitfield(col2_x, yy, "Passage:", 84, element_height, null, TILE_PASSABLE, t_p_mesh_editor);
    create_bitfield_options(element, create_bitfield_option_data(TilePassability.UP, ui_render_bitfield_option_picture_mesh_passability, uivc_bitfield_mesh_passability, "", spr_direction, 0, s, s),
        create_bitfield_option_data(TilePassability.DOWN, ui_render_bitfield_option_picture_mesh_passability, uivc_bitfield_mesh_passability, "", spr_direction, 1, s, s),
        create_bitfield_option_data(TilePassability.LEFT, ui_render_bitfield_option_picture_mesh_passability, uivc_bitfield_mesh_passability, "", spr_direction, 2, s, s),
        create_bitfield_option_data(TilePassability.RIGHT, ui_render_bitfield_option_picture_mesh_passability, uivc_bitfield_mesh_passability, "", spr_direction, 3, s, s),
        create_bitfield_option_data(TILE_PASSABLE, ui_render_bitfield_option_text_passability_mesh_passable, uivc_bitfield_mesh_passability_passable, "O", spr_direction, 0, s, s),
        create_bitfield_option_data(0, ui_render_bitfield_option_text_passability_mesh_solid, uivc_bitfield_mesh_passability_solid, "X", spr_direction, 0, s, s));
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_bitfield(col2_x, yy, "Flags:", 84, element_height, fa_left, col_width, t_p_mesh_editor);
    create_bitfield_options(element, create_bitfield_option_data(TileFlags.BUSH, ui_render_bitfield_option_text_mesh_flag, uivc_bitfield_mesh_flag, "B", -1, 0, s, s),
        create_bitfield_option_data(TileFlags.COUNTER, ui_render_bitfield_option_text_mesh_flag, uivc_bitfield_mesh_flag, "C", -1, 0, s, s));
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_input(col2_x, yy, "Tag:", col_width, element_height, uivc_input_mesh_tag, "", 0, 0, validate_int, ui_value_real, 0, TileTerrainTags.FINAL-1, 2, 84, 0, 84+64, element_height, t_p_mesh_editor);
    ds_list_add(t_p_mesh_editor.contents, element);
    
    t_p_mesh_editor.element_tag=element;
    
    yy=yy+element.height+spacing;
    
    element=create_button(col2_x+16, yy, "-", element_height, element_height, fa_center, uimu_mesh_tag_down, t_p_mesh_editor);
    ds_list_add(t_p_mesh_editor.contents, element);
    element=create_text(col2_x+48, yy, "tag name", col_width, element_height, fa_left, 128, t_p_mesh_editor);
    element.render=ui_render_text_mesh_tag;
    ds_list_add(t_p_mesh_editor.contents, element);
    element=create_button(col2_x+176, yy, "+", element_height, element_height, fa_center, uimu_mesh_tag_up, t_p_mesh_editor);
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    var bounds_x=col2_x;
    var bounds_x_2=bounds_x+col_width/2;
    
    element=create_text(bounds_x, yy, "Bounds:", col_width, element_height, fa_left, col_width, t_p_mesh_editor);
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_text(bounds_x, yy, "", col_width/2, element_height, fa_left, col_width/2, t_p_mesh_editor);
    element.render=ui_render_text_mesh_xmin;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    element=create_text(bounds_x_2, yy, "", col_width/2, element_height, fa_left, col_width/2, t_p_mesh_editor);
    element.render=ui_render_text_mesh_xmax;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_text(bounds_x, yy, "", col_width/2, element_height, fa_left, col_width/2, t_p_mesh_editor);
    element.render=ui_render_text_mesh_ymin;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    element=create_text(bounds_x_2, yy, "", col_width/2, element_height, fa_left, col_width/2, t_p_mesh_editor);
    element.render=ui_render_text_mesh_ymax;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_text(bounds_x, yy, "", col_width/2, element_height, fa_left, col_width/2, t_p_mesh_editor);
    element.render=ui_render_text_mesh_zmin;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    element=create_text(bounds_x_2, yy, "", col_width/2, element_height, fa_left, col_width/2, t_p_mesh_editor);
    element.render=ui_render_text_mesh_zmax;
    ds_list_add(t_p_mesh_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_button(col2_x+col_width/2, yy, "Mesh Data", button_width, element_height, fa_center, omu_manager_mesh, t_p_mesh_editor, HelpPages.TAB_MESH_EDITOR, fa_middle, fa_top);
    ds_list_add(t_p_mesh_editor.contents, element);
    
    /*
     * autotile tab
     */
    
    yy=legal_y+spacing;
    
    element=create_list(legal_x+spacing, yy, "Defined Autotiles: ", "<something is wrong>", col_width, element_height, 28, uivc_list_selection_autotile, false, t_p_autotile_editor);
    ds_map_add(element.selected_entries, 0, true);
    for (var i=0; i<AUTOTILE_MAX; i++){
        create_list_entries(element, string(i)+". <none set>", c_black);
    }
    ds_list_add(t_p_autotile_editor.contents, element);
    
    t_p_autotile_editor.element_list=element;
    
    element=create_text(col2_x, yy, "Autotile Properties:", col_width, element_height, fa_left, col_width, t_p_autotile_editor);
    ds_list_add(t_p_autotile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    var s=10;
    
    element=create_bitfield(col2_x, yy, "Passage:", 84, element_height, null, TILE_PASSABLE, t_p_autotile_editor);
    create_bitfield_options(element, create_bitfield_option_data(TilePassability.UP, ui_render_bitfield_option_picture_autotile_passability, uivc_bitfield_autotile_passability, "", spr_direction, 0, s, s),
        create_bitfield_option_data(TilePassability.DOWN, ui_render_bitfield_option_picture_autotile_passability, uivc_bitfield_autotile_passability, "", spr_direction, 1, s, s),
        create_bitfield_option_data(TilePassability.LEFT, ui_render_bitfield_option_picture_autotile_passability, uivc_bitfield_autotile_passability, "", spr_direction, 2, s, s),
        create_bitfield_option_data(TilePassability.RIGHT, ui_render_bitfield_option_picture_autotile_passability, uivc_bitfield_autotile_passability, "", spr_direction, 3, s, s),
        create_bitfield_option_data(TILE_PASSABLE, ui_render_bitfield_option_text_passability_autotile_passable, uivc_bitfield_autotile_passability_passable, "O", spr_direction, 0, s, s),
        create_bitfield_option_data(0, ui_render_bitfield_option_text_passability_autotile_solid, uivc_bitfield_autotile_passability_solid, "X", spr_direction, 0, s, s));
    ds_list_add(t_p_autotile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_input(col2_x, yy, "Priority:", col_width, element_height, uivc_input_autotile_priority, "", 0, 0, validate_int, ui_value_real, 0, TILE_MAX_PRIORITY-1, 3, 84, 0, 84+64, element_height, t_p_autotile_editor);
    element.render=ui_render_input_tile_priority;
    ds_list_add(t_p_autotile_editor.contents, element);
    
    // this is totally cheating but game maker allows me to do it so shut up
    t_p_autotile_editor.element_priority=element;
    
    yy=yy+element.height+spacing;
    
    element=create_bitfield(col2_x, yy, "Flags:", 84, element_height, fa_left, col_width, t_p_autotile_editor);
    create_bitfield_options(element, create_bitfield_option_data(TileFlags.BUSH, ui_render_bitfield_option_autotext_tile_flag, uivc_bitfield_autotile_flag, "B", -1, 0, s, s),
        create_bitfield_option_data(TileFlags.COUNTER, ui_render_bitfield_option_text_autotile_flag, uivc_bitfield_autotile_flag, "C", -1, 0, s, s));
    ds_list_add(t_p_autotile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_input(col2_x, yy, "Tag:", col_width, element_height, uivc_input_autotile_tag, "", 0, 0, validate_int, ui_value_real, 0, TileTerrainTags.FINAL-1, 2, 84, 0, 84+64, element_height, t_p_autotile_editor);
    ds_list_add(t_p_autotile_editor.contents, element);
    
    t_p_autotile_editor.element_tag=element;
    
    yy=yy+element.height+spacing;
    
    element=create_button(col2_x+16, yy, "-", element_height, element_height, fa_center, uimu_autotile_tag_down, t_p_autotile_editor);
    ds_list_add(t_p_autotile_editor.contents, element);
    element=create_text(col2_x+48, yy, "tag name", col_width, element_height, fa_left, 128, t_p_autotile_editor);
    element.render=ui_render_text_autotile_tag;
    ds_list_add(t_p_autotile_editor.contents, element);
    element=create_button(col2_x+176, yy, "+", element_height, element_height, fa_center, uimu_autotile_tag_up, t_p_autotile_editor);
    ds_list_add(t_p_autotile_editor.contents, element);
    
    yy=yy+element.height+spacing;
    
    element=create_image_button(col2_x, yy, "(Click for autotile)", noone, col_width, col_width, fa_center, omu_autotile_selector, t_p_autotile_editor);
    element.render=ui_render_image_button_autotile;
    ds_list_add(t_p_autotile_editor.contents, element);
    
    /*
     * other tab
     */
    
    yy=legal_y+spacing;
    
    element=create_text(legal_x+spacing, yy, "We also need to be able to manage particle (image), npc (image), follower (image), ui (image), se (audio), bgm (audio), and possibly some other asset types but there's not enough space here; those might just be done with other items in the Data menu",
        legal_width-spacing*2, element_height, fa_left, legal_width-spacing*2, t_p_other_editor);
    element.valignment=fa_top;
    ds_list_add(t_p_other_editor.contents, element);
    
    return id;
}
