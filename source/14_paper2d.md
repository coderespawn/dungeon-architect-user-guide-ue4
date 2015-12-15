Paper 2D Extension
==================

Adds Paper2D support for your 2D games.  This extension plugin extends the core DungeonArchitect module by adding Paper2D support to the theme editor and builder

![Paper2D Extension Plugin](../assets/images/plugin_2d.png)

![Paper2D Extensions on the Theme Editor](../assets/images/builder_paper.jpg)

The decision to turn this into a separate module (instead of having it in the core module) was to avoid having to link to Paper2D

Theme Nodes
-----------

This module extends the Theme Editor with new 2D nodes that work well with the Paper2D plugin

![Paper2D Nodes](../assets/images/paper_context.png)

### Sprite Node

Place static sprites in the scene with this node.

![Sprite Node](../assets/images/paper_node_sprite.png)

Create a sprite node and specify the sprite your need from the details window

![Sprite Node Properties](../assets/images/paper_node_sprite2.png)


### Flipbook Node

Place animated sprites in the scene with this node.

![Flipbook Node](../assets/images/paper_node_flipbook.png)

Set the flipbook animation to use in the details window

### Tile Node

Select a tile from your tileset to place in the scene.  This is a very useful node as it lets you theme your level with a tileset.

![Tile Node](../assets/images/paper_node_tile1.png)

Set the tileset you intend to use.  Once selected, the details window lets you pick a tile from the tileset

![Tile Node Properties](../assets/images/paper_node_tile2.png)

You can pick tiles of any dimension (e.g. 3x5) and are not restricted to a 1x1 selection

![Tile Selection](../assets/images/paper_node_tile3.png)

This is very useful if you have art spanning multiple tiles (e.g. trees)
