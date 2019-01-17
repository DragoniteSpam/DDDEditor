/// uivc_select_tile(UITileSelector, tx, ty);

var catch=argument0;

switch (Camera.tile_on_click){
    case TileSelectorOnClick.SELECT:
        Camera.selection_fill_tile_x=argument1;
        Camera.selection_fill_tile_y=argument2;
        // refresh values that don't like to do it on their own
        Camera.ui.t_p_tile.element_priority.value=string(ActiveMap.tileset.priority[# argument1, argument2]);
        break;
    case TileSelectorOnClick.MODIFY:
        switch (Camera.tile_data_view){
            case TileSelectorDisplayMode.PASSAGE:
                var data=ActiveMap.tileset.passage;
                if (data[# argument1, argument2]==0){
                    data[# argument1, argument2]=TILE_PASSABLE;
                } else {
                    data[# argument1, argument2]=0;
                }
                break;
            case TileSelectorDisplayMode.PRIORITY:
                var data=ActiveMap.tileset.priority;
                data[# argument1, argument2]=++data[# argument1, argument2]%TILE_MAX_PRIORITY;
                break;
            case TileSelectorDisplayMode.FLAGS:
                // modifying a bit flag just by clicking on it with no other
                // information seems kinda useless to me
                break;
            case TileSelectorDisplayMode.TAGS:
                var data=ActiveMap.tileset.tags;
                data[# argument1, argument2]=++data[# argument1, argument2]%TileTerrainTags.FINAL;
                break;
        }
        break;
}
