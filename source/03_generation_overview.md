Generation Overview
===================
A dungeon is generated in two phases

* Layout Generation
* Visual Generation

![Architecture](../assets/images/da_design.png)

Layout Generation
-----------------
In this phase, only the layout of the dungeon is generated in memory. No meshes or actors are actually spawned.

![Layout of the dungeon in memory](../assets/images/layout_2d.jpg)

Next, the level is populated with invisible points called **Markers** around the generated layout.  A **marker** has only a name and a transformation in the 3D space.

![Markers populated for a sample room](../assets/images/marker_system_01.png)

In the above image, after the layout has been built, the dungeon builder has populated the level with marker points around the layout of the dungeon


Visual Generation
-----------------
This phase spawns the actors in your scene.   It takes all the marker points inserted in the previous phase and replaces them with actors (meshes, lights, blueprints etc) that you have mapped in your theme files

![Actors spawned by a theme mapping](../assets/images/marker_system_02.png)

The theming engine is executed for each marker inserted in the Layout generation phase.   In the above example, when a `Ground` marker is encountered, it would look for a `Ground` marker mapping in your theme file and replace the marker with the meshes you have mapped to it

![Result after theme mapping](../assets/images/sample_dungeon.jpg)

The advantage of this data driven theme based approach is that theme files can be swapped to give your dungeon a completly different look.  Theme files can also be shared across mulitple projects / teams

Multiple themes can also be used within the same dungeon to create variations

