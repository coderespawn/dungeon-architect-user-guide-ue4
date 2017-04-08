Query Interface
===============

The query interface has various helper functions to query the structure of the dungeon.    You can use the query interface in your selector / transform logics or marker emitters for more control

Each builder implements its own query interface.    


##Access the Query Interface
You can access the query interface from different places


![Query interface in the selection rule](../assets/images/query_interface_access_selector_logic.png)

---

![Query interface in the transformer rule](../assets/images/query_interface_access_transform_logic.png)

---

![Query interface in the marker emitter](../assets/images/query_interface_access_marker_emiter.png)

---

![Query interface from other blueprints](../assets/images/query_interface_access_dungeon_actor.png)

---

##Grid Query Interface

The Grid Query Interface lets you query the structure of a grid builder based dungeon

###Get Cells

Gets a list of all the Cell IDs in the dungeon. A corridor patch or a room is a cell. A cell is always rectangular in shape, with a center and size

![Get Cells](../assets/images/query_grid_GetCells.png)


###Get Cells Of Type
Similar to Get Cells function but filters the cells based on a type (Room, Coordor)

![Get Cells Of Type](../assets/images/query_grid_GetCellsOfType.png)

###Get Cell Dimension
Gets the dimension of a cell.  This takes in a cell id and will return the center and the size of the cell

![Get Cell Dimension](../assets/images/query_grid_GetCellDimension.png)

###Get Path Between Cells
Gets a valid path between any two cell points.  This can be used to create waypoints in your game.  There is an example in the quick start guide demonstrating this

![Get Path Between Cells](../assets/images/query_grid_GetPathBetweenCells.png)

![Query path between two cells](../assets/images/query_grid_path.jpg)


###Get Furthest Rooms
Find the furthest rooms in the dungeon.   This function returns two cell ID.  This can be useful for setting the start / end rooms (or spawn / boss rooms)

![Get Furthest Rooms](../assets/images/query_grid_GetFurthestRooms.png)


### Get Cell At Location
Pass in a world location and get the cell id.  This is useful for finding the cell an actor is in.   For e.g., if you'd like to check if all NPCs in a room are dead before unlocking a door, you would iterate through all the actors and check if they are in the same room the player is in

![Get Cell At Location](../assets/images/query_grid_GetCellAtLocation.png)


### Get Cell Type
Find the type of the cell (Room, corridor).    There is another category called CorridorPadding, which should also be considered a Corridor

![Get Cell Type](../assets/images/query_grid_GetCellType.png)


### Get Random Cell
Gets a random cell from the dungeon.  

There also a version that takes in a random stream. You should use the random stream version if you want to guarantee the same dungeon for a particular configuration. The dungeon's random stream is access from within the selector and transform rules

![Get Random Cell](../assets/images/query_grid_GetRandomCell.png)


### Get Random Cell Of Type
Gets a random cell of a particular type from the dungeon.  

There also a version that takes in a random stream. You should use the random stream version if you want to guarantee the same dungeon for a particular configuration. The dungeon's random stream is access from within the selector and transform rules

![Get Random Cell Of Type](../assets/images/query_grid_GetRandomCellOfType.png)


### Contains Stair Between

Check if there is a stair connecting the two input cells

![Contains Stair Between](../assets/images/query_grid_ContainsStairBetween.png)


### Contains Door Between

Check if there is a door connecting the two input cells

![Contains Door Between](../assets/images/query_grid_ContainsDoorBetween.png)


### Get Stair Between

Get the stair information between the two input cells

![Get Stair Between](../assets/images/query_grid_GetStairBetween.png)


### Get Opening Point Between Adjacent Cells

When two cells are adjacent to each other, there might be a constraint on how we can traverse through them. There might be a height variation, or there might be a wall between the cells.  In that case, the only valid way to move across is through the stair or a door repectively.   This function calculates and returns the correct world position.  This position lies in the edge of the two cells.  If there is no barrier between the two cells (doors / stairs) a point in the center of the edge is returned

![Get Opening Point Between Adjacent Cells](../assets/images/query_grid_GetOpeningPointBetweenAdjacentCells.png)

This function is used in the path demo to correctly place the spline through the doors and stairs

![Query path between two cells](../assets/images/query_grid_path.jpg)


### Get Adjacent Cells On Edge

![Get Adjacent Cells On Edge](../assets/images/query_grid_GetAdjacentCellsOnEdge.png)

You can use this function in a selector logic of a marker that is on the edge (e.g. Walls / Fence).   This function returns the cells adjacent to the marker.   You can use it to decorate your walls / fence selectively. E.g. do no spawn lights on walls of an empty side, or have a different art style when a wall is shared by two rooms

### Is Near Marker

![Is Near Marker](../assets/images/query_grid_IsNearMarker.png)

The function returns true if a marker with the specified name is found nearby.    You specify the distance to search and the marker name. 

This function is useful if you don't want to place blocking items near doors / stairs.

![Query System](../assets/images/query_grid_near_marker_1.png)
![Query System](../assets/images/query_grid_near_marker_2.png)


