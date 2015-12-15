Marker Emitters
===============

Marker Emitters are blueprint scripts (or C++) that lets you emit your own markers anywhere in the map

![Architecture](../assets/images/da_design_me.png)

As seen previously, *Markers* are emitted by the Dungeon Builder class around the layout of the dungeon (e.g. Wall, Ground, Fence etc) and you can insert actors at that location from the Theme graph.  You can even create your own markers emitted off of those parent markers, but without *Marker Emitters* you are restricted to the starting markers the dungeon builder has initially emitted for you

Marker Emitters gives you a lot of flexibility and you can query the dungeon model and emit markers anywhere in the map

A Marker Emitter is invoked right after the Dungeon Builder emits all the markers for the dungeon (Ground, Wall etc)

Creating a Marker Emitter
-------------------------

Add an existing marker emitter by selecting the Dungeon Actor and navigating to the Details tab

![Assign an existing marker emitter](../assets/images/marker_emitter_01.png)


You can create new marker emitter blueprint scripts by clicking the **+** icon next to the Marker Emitter name

![Create a new Marker Emitter](../assets/images/marker_emitter_02.png)

![Save the Marker Emitter blueprint](../assets/images/marker_emitter_03.png)

Start placing your logic in the blueprint by overriding the **Emit Markers** function

![Override the EmitMarkers function](../assets/images/marker_emitter_04.png)

This method is invoked by the engine and lets you emit as many markers as you like into the scene with any transforms.

To emit a marker, create a *Emit Marker* node

![Emit Marker Node](../assets/images/marker_emitter_05.png)

You can emit as many markers as you like

Theme Preview
-------------

If you want to preview your marker emitter logic in the Theme Editor's 3D Preview viewport,  you can set it up like this:

Navigate to the theme editor's 3D Viewport > Properties > Dungeon

![Theme Editor's 3D Viewport > Properties > Dungeon](../assets/images/marker_emitter_te_1.png)

This will open up the dungeon properties. Add your marker emitter there and the preview viewport will pick up the markers emitted by your Marker Emitter blueprint script and show it in the preview viewport

![Theme Editor's 3D Viewport > Properties > Dungeon](../assets/images/marker_emitter_te_2.jpg)


Example #1
----------

This marker emitter queries the dungeon model and emits a marker at the center of all the rooms

![Sample Marker Emitter](../assets/images/marker_emitter_eg1_1.png)

![Marker Emitted with this name](../assets/images/marker_emitter_eg1_2.png)

![Create a Marker node with the same name](../assets/images/marker_emitter_eg1_3.png)

![Theming engine picks it up and inserts it in the middle of the room](../assets/images/marker_emitter_eg1_4.png)

Example #2
----------

The *Hell Forge* demo has a good looking cave like system generated using Marker Emitters.

Since the rocks for the cave walls cannot be inserted in the Wall and Fence markers (as they are big and would block the passage), we need to find positions in the empty space that are further away from the walls and fences

This is done with a marker emitter blueprint `DA_InfinityBlade_Fire/Dungeons/Rules/MarkerEmitter/BPM_AdjacentCellEmitter`

![Visualizing the emitter with different colored cubes](../assets/images/marker_emitter_eg2_1.png)

![Visualizing the emitter with different colored cubes](../assets/images/marker_emitter_eg2_2.jpg)

The Hell Forge theme applies rocks to these markers (EmptySpaceN) and increases their scale as they move further away from the the ground

![Theme to create Mountains using a Marker Emitter](../assets/images/marker_emitter_eg2_3.jpg)

This gives a nice progressive elevation to the mountains giving the impression that the pathways are naturally formed

![Hell Forge theme with Mountains and Caves](../assets/images/marker_emitter_eg2_4.jpg)


Example #3
----------

Heres another example of a curved roof created over a room using marker emitters

![](../assets/images/marker_emitter_eg3_1.jpg)
![](../assets/images/marker_emitter_eg3_2.jpg)
![](../assets/images/marker_emitter_eg3_3.jpg)




