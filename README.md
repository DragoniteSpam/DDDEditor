# DDD Editor
Game data editor to go along with [DoOrDieDragonite](https://github.com/DragoniteSpam/PokemonDoOrDie).

**Update: as of 9 May 2019, this project is now being worked on in Game Maker Studio 2. You can find the new repository [here](https://github.com/DragoniteSpam/DDDEditorGMS2). I've also decided to start reducing the emphasis on Pokémon, for several different reasons but it should be functional if you want it.**

The plan is to create a fully-featured game editor that will be able to handle all of the information that the main game stores externally, such as maps, monster data, item data, and probably a bunch of other stuff. The map editor portion is going to take priority for the time being though.

# Known Issues

 - **Semi-transparency in 3D space** - if you try to draw surface underneath an existing semi-transparent surface, it won't work. This is a Game Maker-wide problem and I'll probably either deal with depth sorting later, or just get rid of semi-transparent textures.
 
 - **Deleting custom data types and their properties** - edge cases, that is all
