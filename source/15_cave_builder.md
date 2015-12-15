Cave Builder
============

**Experimental** - Note: This feature is still experimental and not fully supported

This implementation of a Dungeon Builder uses [Cellular Automata](http://www.roguebasin.com/index.php?title=Cellular_Automata_Method_for_Generating_Random_Cave-Like_Levels) to build cave like structures

The builder is implemented in C++ and available here:

`Plugins/DungeonArchitect/Source/DungeonArchitectRuntime/Classes/Dungeon/Builders/DungeonBuilderCave.h`



Using the builder
-----------------
Have a look at the Quick start sample folder `DA_Cave_SideScroll` for examples

To use the builder, select your dungeon and choose `DungeonBuilderCave`

![Swap out the default builder with the Cave builder](../assets/images/cave_builder_a.png)

Customize the builder properties by selecting the dungeon and choosing **Edit Builder Config**

![Customize the builder config](../assets/images/cave_builder_b.png)

![Cave Builder configuration](../assets/images/cave_builder_c.png)


Theming
-------

To preview the cave builder in your theme file, go to Properties > Dungeon

![Preview Dungeon Properties](../assets/images/cave_builder_d.png)

Assign the cave builder to the **Builder Class** property and the preview viewport should use the cave builder to build the preview dungeon

![Builder Class](../assets/images/cave_builder_f.png)

The Cave Builder emits a marker named **CaveWall** wherever a wall is expected

Here is a sample theme

![Sample Cave theme](../assets/images/cave_builder_g.png)


2D Extension
------------
There is also a 2D Cave builder for your Paper2D games

For 2D cave samples, have a look at the `DA_Cave2D` folder in the Quick Start samples 

![Paper2D Cave](../assets/images/cave2d_1.png)

![More Procedural 2D Caves](../assets/images/cave2d_2.png)


The cave is beautified with decorative props using a marker emitter

![Cave decoration theme](../assets/images/cave2d_3.png)

The marker emitter to decorate the cave:  `DA_Cave2D/Rules/BPE_TileBeautifier`
