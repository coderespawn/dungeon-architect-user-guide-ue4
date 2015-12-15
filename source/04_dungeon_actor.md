Dungeon Actor
=============
A dungeon actor is used to build your dungeons.   Drop a dungeon actor into the scene and reset its transform

![Dungeon Actors](../assets/images/dugeon_actor_01.png)

The dungeon actor generate a procedural layout for your dungeon based on the various configuration paramters.  
After the layout has been generated, it spawns meshes, lights, blueprints etc, based on the mappings you have defined in the Theme file.   This way you can define what meshes needs to be attached to the floors, walls, ceilings, etc


Properties
----------
The Dungeon actor lets you perform various actions on your procedural dungeon.  Select the Dungeon Actor and have a look at the Dungeon category under the details window

![Dungeon Actor Properties](../assets/images/dungeon_actor_actions.png)

**Build Dungeon:** Builds a procedural dungeon.  You need to define atleast one theme before you build

**Destroy Dungeon:** Destroys an existing dungeon owned by this actor.  If you want to rebuild a dungeon after modifying the theme, there is no need to destroy first and you can directly click build

**Randomize Seed:** A convenience function that changes the seed in the configuration.  Changing the seed would completly change the layout of your dungeon

**Edit Builder Config:** If you have specified a custom builder (see below), you can customize it's exposed parameters

**Config:** The configuration structure.   Modify this to tweak the layout of your dungeon.  Detailed explanation of each field below

**Themes:** A theme file lets you design the look and feel of your dungeon.  There's an interactive editor that lets you design your own themes.  You need to specify atleast one theme file before you can build your dungeon (quick start guide comes with many pre-created themes to get you started)

**Marker Emitters:** Dungeon Architect is designed to be modular and it contains many extension points so you can plugin in your own functionality using Blueprints or C++.   Marker Emitters is one such extension point that lets you insert marker points in the scene, which your theme can later pick up replace with actors (like meshes, lights etc)


Config Parameters
-----------------
Select the Dungeon Actor and expand the Config structure in the Details window

![Dungeon Config Parameters](../assets/images/config_params.png)

The various config parameters determine how the layout of the dungeon is generated procedurally.  The default layout generator algorithm is implemented based on the excellent [writeup](http://www.reddit.com/r/gamedev/comments/1dlwc4/procedural_dungeon_generation_algorithm_explained/) by TinyKeep's author Phi Dinh

The various parameters are:

* **Seed**: Changing this number would completely change the layout of the dungeon.  This is the base random number seed that is used to build the dungeon
* **Num Cells**: The number of cells to use while building the dungeon.  You will not see these cells in the final result.   A larger number would create a bigger and more complex dungeon.   A number of 100-150 builds a medium to large sized dungeon. Experiment with different ranges
* **Min/Max Cell Size**: This is how big or small a cell size can be. While generation, a cell is either converted to a room, corridor or is discarded completely.  The Cell width / height is randomly chosen within this range
* **Room Area Threshold**: If a cell size exceeds past this limit, it is converted into a room.  After cells are promoted to rooms, all rooms are connected to each other through corridors (either directly or indirectly. See spanning tree later)
* **Room Aspect Delta**: The aspect ratio of the cells (width to height ratio).  Keeping this value near 0 would create square rooms.   Bringing this close to 1 would create elongated / stretched rooms with a high width to height ratio
* **Spanning Tree Loop**:  Determines how many loops you would like to have in your dungeon.  A value near 0 will create fewer loops creating linear dungeons.   A value near 1 would create lots of loops, which would look unoriginal.  Its good to allow a few loops so a value close to zero (like 0.2 should be good)
* **Stair Connection Tolerance**: The generator would add stairs to make different areas of the dungeon accessible.  However, we do not want too many stairs. For e.g., before adding a stair in a particular elevated area, the generator would check if this area is already accessible from a nearby stair. If so, it would not add it.   This tolerance parameter determines how far to look for an existing path before we can add a stair.   Play with this parameter if you see too many stairs close to each other, or too few
* **Height Variation Probability**: Tweak this value to increase / reduce the height variations (and stairs) in your dungeon.  A value close to 0 reduces the height variation and increases as you approach 1.   Increasing this value to a higher level might create dungeons with no place for proper stair placement since there is too much height variation.   A value of 0.2 to 0.4 seems good
* **Normal Mean / Std**: The random number generator used in the dungeon generator does not use a uniform distribution.  Instead it uses a normal distribution to get higher frequency of lower values and fewer higher values (and hence fewer room cells and a lot more corridor cells). Play with these parameters for different results
* **Grid Cell Size**: The dungeon generator works on a grid based system and required modular mesh assets to be placed on each cell (floors, walls, doors etc).   This important field specifies the size of the cell to use. This size is determined by the art asset used in the dungeon theme designed by the artist.  In the demo,  we have a floor mesh that is 400x400.  The height of a floor is chosen to be 200 units as the stair mesh is 200 units high.  Hence the defaults are set to 400x400x200.   You should change this to the dimension of the modular asset your designer has created for the dungeon
* **Max Allowed Stair Height**: The number of logical floor units the dungeon height can vary. This determines how high the dungeon's height can vary (e.g. max 2 floors high).   Set this value depending on the stair meshes you designer has created. In the sample demo, there are two stair meshes, one 200 units high (1 floor) and another 400 units high (2 floors).  So the default is set to 2
* **Initial Room Radius**: Internal Usage.  Keep to a low value like 10-15
* **Floor Height**: Internal Usage. Ignored for now

