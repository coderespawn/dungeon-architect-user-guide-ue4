Dungeon Builders
================
The Default dungeon builder used to create the layout is swappable and you can provide your own implementation, as a blueprint script or in C++.

![The Dungeon Builder can be swapped with your own implementation](../assets/images/da_design_builder.png)


This is useful if you want to use your own algorithm for generating the layout of your dungeons.  

You are not limited to a grid based system.  Here are some examples of custom builders


![Cave Builder](../assets/images/builder_cave_C.jpg)

![Cave Builder](../assets/images/builder_cave_B.jpg)

![Planet Builder](../assets/images/builder_planet.jpg)

![Paper2D Builder](../assets/images/builder_paper.jpg)

Using a different Builder
-------------------------

To use a different builder to create your dungeon layout, Select the dungeon actor and choose the desired builder class

![Select a builder](../assets/images/builder_create_A.jpg)


Creating a new Builder
----------------------

To create a builder, select a Dungeon Actor, and navigate to the Details window

Click the **+** icon next to the Builder Class property and save the Blueprint 

![Create a new Builder](../assets/images/builder_create_B.png)

![Save the builder blueprint](../assets/images/builder_create_C.png)

Open the Builder blueprint and override the function **Emit Dungeon Markers**

![Override function to place your builder logic](../assets/images/builder_create_D.png)


Build your layout and emit markers using the **Emit Marker** node

![Emit markers into the scene](../assets/images/builder_create_E.png)


Specify the marker name in the SocketType field

![Specify a marker name](../assets/images/builder_create_F.png)

These marker names will be used in the theme files


Note: Builders are very low level and you need to emit markers for grounds, walls, doors etc yourself wherever needed.   It gives you a lot of power but you need to put in the work to emit the base markers yourself.  If you want to build on an existing layout (like the default grid based builder) try *Marker Emitters* instead.


Theming
-------

To preview your custom builder in a theme file, open the theme in the Theme Editor and go to Properties > Dungeon

![Preview Dungeon Properties](../assets/images/cave_builder_d.png)

Assign your builder to the **Builder Class** property and the preview viewport should use your builder to build the preview dungeon

![Builder Class](../assets/images/cave_builder_f.png)
