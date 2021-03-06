﻿Dungeon Builders
================

A Dungeon Builder generates the layout of your dungeon.    It contains the method and techniques to design your dungeon.  There are multiple builders available and you can also create your own implementation if you wish (in blueprint or C++).  This allows Dungeon Architect to be extensible and not restricted to a single dungeon layout technique

![Dungeon Builder](../assets/images/da_design_builder.png)

![Select a dungeon builder](../assets/images/dungeon_grid_builder_overview.png)

Here we explore the various dungeon builders that ship with Dungeon Architect

Grid Builder
------------
This builder creates complex and beautiful dungeons with rooms, cooridors and height variations.

This is the default builder used by Dungeon Architect

YOUTUBE(dbDak6J61zw)

![Grid Builder layout](../assets/images/paint_rect_04.jpg)
![Grid Builder layout](../assets/images/grid_builder_eg_1.jpg)
![Grid Builder layout](../assets/images/grid_builder_eg_2.jpg)
![Grid Builder layout](../assets/images/grid_builder_eg_3.jpg)
![Grid Builder layout](../assets/images/grid_builder_eg_4.jpg)
![Grid Builder layout](../assets/images/grid_builder_eg_5.jpg)


###Configuration

Select the Dungeon Actor from the Details window

![Dungeon Config Parameters](../assets/images/dungeon_config_grid.png)

The various config parameters determine how the layout of the dungeon is generated procedurally.  The default layout generator algorithm is implemented based on the excellent [writeup](http://www.reddit.com/r/gamedev/comments/1dlwc4/procedural_dungeon_generation_algorithm_explained/) by TinyKeep's author Phi Dinh

The various parameters are:

* **Seed**: Changing this number would completely change the layout of the dungeon.  This is the base random number seed that is used to build the dungeon
* **Num Cells**: The number of cells to use while building the dungeon.  You will not see these cells in the final result.   A larger number would create a bigger and more complex dungeon.   A number of 100-150 builds a medium to large sized dungeon. Experiment with different ranges
* **Min/Max Cell Size**: This is how big or small a cell size can be. While generation, a cell is either converted to a room, corridor or is discarded completely.  The Cell width / height is randomly chosen within this range
* **Room Area Threshold**: If a cell size exceeds past this limit, it is converted into a room.  After cells are promoted to rooms, all rooms are connected to each other through corridors (either directly or indirectly. See spanning tree later)
* **Room Aspect Delta**: The aspect ratio of the cells (width to height ratio).  Keeping this value near 0 would create square rooms.   Bringing this close to 1 would create elongated / stretched rooms with a high width to height ratio
* **Spanning Tree Loop**:  Determines how many loops you would like to have in your dungeon.  A value near 0 will create fewer loops creating linear dungeons.   A value near 1 would create lots of loops, which would look unoriginal.  Its good to allow a few loops so a value close to zero (like 0.2 should be good)
* **Stair Connection Tolerance**: The generator would add stairs to make different areas of the dungeon accessible.  However, we do not want too many stairs. For e.g., before adding a stair in a particular elevated area, the generator would check if this area is already accessible from a nearby stair. If so, it would not add it.   This tolerance parameter determines how far to look for an existing path before we can add a stair.   Play with this parameter if you see too many stairs close to each other, or too few
* **Door Proximity Steps**: Increase this value to remove nearby duplicate doors.  This value determines how many cell we can move to reach the two connected cells of a door if the door was removed
* **Height Variation Probability**: Tweak this value to increase / reduce the height variations (and stairs) in your dungeon.  A value close to 0 reduces the height variation and increases as you approach 1.   Increasing this value to a higher level might create dungeons with no place for proper stair placement since there is too much height variation.   A value of 0.2 to 0.4 seems good
* **Normal Mean / Std**: The random number generator used in the dungeon generator does not use a uniform distribution.  Instead it uses a normal distribution to get higher frequency of lower values and fewer higher values (and hence fewer room cells and a lot more corridor cells). Play with these parameters for different results
* **Grid Cell Size**: The dungeon generator works on a grid based system and required modular mesh assets to be placed on each cell (floors, walls, doors etc).   This important field specifies the size of the cell to use. This size is determined by the art asset used in the dungeon theme designed by the artist.  In the demo,  we have a floor mesh that is 400x400.  The height of a floor is chosen to be 200 units as the stair mesh is 200 units high.  Hence the defaults are set to 400x400x200.   You should change this to the dimension of the modular asset your designer has created for the dungeon
* **Max Allowed Stair Height**: The number of logical floor units the dungeon height can vary. This determines how high the dungeon's height can vary (e.g. max 2 floors high).   Set this value depending on the stair meshes you designer has created. In the sample demo, there are two stair meshes, one 200 units high (1 floor) and another 400 units high (2 floors).  So the default is set to 2
* **Initial Room Radius**: Internal Usage.  Keep to a low value like 10-15
* **Floor Height**: Internal Usage. Ignored for now
* **Instanced**: Use mesh instancing for lower batch count
* **Max Build Time Per Frame**: The dungeon can be built over multiple frames so as to not hang the game (or the editor UI) while it is being built.  This value determines how much time is spent on each frame to build the dungeon.  Setting it to 0 would build the entire dungeon synchronously in a single frame.  Settting to 33ms for eg, would build it over multiple frames.  You get a callback notification when the dungeon build is complete




Floor Plan Builder
------------------
Create floor plans for your indoor buildings.  This builder is a work in progress

YOUTUBE(K_iQH4TiVS0)

![Floor Plan Builder](../assets/images/floor_builder_eg_1.jpg)
![Floor Plan Builder](../assets/images/floor_builder_eg_2.jpg)
![Floor Plan Builder](../assets/images/floor_builder_eg_3.jpg)
![Floor Plan Builder](../assets/images/floor_builder_eg_4.jpg)
![Floor Plan Builder](../assets/images/floor_builder_eg_5.jpg)


###Configuration

Select the Dungeon Actor from the Details window

![Dungeon Config Parameters](../assets/images/dungeon_config_floor.png)

* **Seed**: Changing this number would completely change the layout of the dungeon.  This is the base random number seed that is used to build the dungeon

* **Building Size**: This is the building size in logical "Grid" units.  (see grid size below).  Adjust this to change the size of your floor

* **Grid Size**: The size of a tile in the floor map.   The floor map is created in a tiled grid.   Adjust the size here based on your art assets defined in the theme file

* **Min/Max Size**: The minimum / maximum size of the room, in logical grid cooridnates

* **Hall Width**: Every room is directly or indirectly connected to a hallway.  This parameter controls the size of the hallway in grid coordinate

* **Min Room Chunk Area**: Rooms are groups together with other rooms.  However, they may be split with a hallway in between them if the combined area is greater than this value

* **Instanced**: Use mesh instancing for lower batch count

* **Max Build Time Per Frame**: The dungeon can be built over multiple frames so as to not hang the game (or the editor UI) while it is being built.  This value determines how much time is spent on each frame to build the dungeon.  Setting it to 0 would build the entire dungeon synchronously in a single frame.  Settting to 33ms for eg, would build it over multiple frames.  You get a callback notification when the dungeon build is complete


Simple City Builder
-------------------
Create simple city layouts using this builder.  This builder is a work in progress

Check the quick start samples for examples

![City Builder](../assets/images/city_builder_toon_city.jpg)


There's a simple game that uses the city builder.  The cities are procedurally generated using Dungeon Architect.  In this game, Dungeon architect also spawns waypoints for the pedestrians to walk around the city

![Zombie City Game Demo](../assets/images/city_builder_zombie_city.png)

YOUTUBE(ybZuP8ikTsE)


###Configuration
* **CellSize**: Defines the cell size of your city.  This depends on your modular art asset used by the roads tiles and buildings
* **MinCitySize**: The minimum size of the city (in cell units)
* **MaxCitySize**: The maximum size of the city (in cell units)
* **MinBlockSize**: The minimum size of a city block (in cell units)
* **MaxBlockSize**: The maximum size of a city block (in cell units)
* **BiggerHouseProbability**: The house tiles are not restricted to 1x1 cell size. You can have larger dimension structures (e.g. stadiums, parking lots etc) that take up larger sizes e.g. 3x5, 2x4.   This probabiliy defines how often that happens.
* **RoadEdgeRemovalProbability**: Some of the road edges are removed to create a more uneven and natural look rather than a rectangular grid like structure (refer city image above)
* **CityBlockDimensions**: Specify larger structured blocks here with their dimension (e.g. 2x3) and their marker name (e.g. `ParkingLot`). You would then create a marker with this name and attach your larger mesh to it


###Layout
Houses inaccessible to roads are promoted to `Park`.  Houses also automatically face the roads.  If your house mesh is not facing the road, try rotating it from the mesh node in the theme graph


Snap Builder
------------
The snap builder allows you to stitch together custom designed rooms.   This gives the artist full control on how an individual room looks like.  These rooms are called Snap Modules.

Full documentation here

https://coderespawn.github.io/dungeon-architect-snap-map-user-guide-ue4/

YOUTUBE(woKkR6P_sHY)

YOUTUBE(R5Lcx9YSYpo)

YOUTUBE(9Crl9tGkHXA)

### Layout
A simple layout is used for now where there is a linear path from start to end and a few side branches along the way.  In the later updates, there will be multiple implementations of the layout algorithms and you should be able to swap between them


Isaac Builder
-------------
Generates levels similar to the game Binding of Isaac.    This builder is a work in progress

YOUTUBE(eRrh-SLcJ0A)


Custom Grid Builder
-------------------
This is based on the Grid Builder and allows you to define your own layouts easily from blueprints.  It has various high level functions for placement of rooms and their corridor connections.  If you are looking to define your own procedural layouts in blueprints,  you might want to start here

Check the quick start samples for more info
YOUTUBE(AzO2gI0NV-Q)



Theming
-------
To preview your custom builder in a theme file, open the theme in the Theme Editor and go to Properties > Dungeon

![Preview Dungeon Properties](../assets/images/cave_builder_d.png)

Assign your builder to the **Builder Class** property and the preview viewport should use your builder to build the preview dungeon

![Builder Class](../assets/images/cave_builder_f.png)
