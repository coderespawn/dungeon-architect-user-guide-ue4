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

###Get Cells

Gets a list of all the Cell IDs in the dungeon. A corridor patch or a room is a cell. A cell is always rectangular in shape, with a center and size

![Query Interface](../assets/images/query_grid_GetCells.png)


###Get Cells Of Type
Similar to Get Cells function but filters the cells based on a type (Room, Coordor)

![Query Interface](../assets/images/query_grid_GetCellsOfType.png)

###Get Cell Dimension
Gets the dimension of a cell.  This takes in a cell id and will return the center and the size of the cell

![Query Interface](../assets/images/query_grid_GetCellDimension.png)

###Get Path Between Cells
Gets a valid path between any two cell points.  This can be used to create waypoints in your game.  There is an example in the quick start guide demonstrating this

![Query Interface](../assets/images/query_grid_GetPathBetweenCells.png)

![Query path between two cells](../assets/images/query_grid_path.jpg)


###Get Furthest Rooms
Find the furthest rooms in the dungeon.   This function returns two cell ID.  This can be useful for setting the start / end rooms (or spawn / boss rooms)

![Query Interface](../assets/images/query_grid_GetFurthestRooms.png)


### Get Cell At Location
Pass in a world location and get the cell id.  This is useful for finding the cell an actor is in.   For e.g., if you'd like to check if all NPCs in a room are dead before unlocking a door, you would iterate through all the actors and check if they are in the same room the player is in

![Query Interface](../assets/images/query_grid_GetCellAtLocation.png)


### GetCellType

![Query Interface](../assets/images/query_grid_GetCellType.png)


### GetRandomCell

![Query Interface](../assets/images/query_grid_GetRandomCell.png)


### GetRandomCellOfType

![Query Interface](../assets/images/query_grid_GetRandomCellOfType.png)


### ContainsStairBetween

![Query Interface](../assets/images/query_grid_ContainsStairBetween.png)


### ContainsDoorBetween

![Query Interface](../assets/images/query_grid_ContainsDoorBetween.png)


### GetStairBetween

![Query Interface](../assets/images/query_grid_GetStairBetween.png)


### GetOpeningPointBetweenAdjacentCells

![Query Interface](../assets/images/query_grid_GetOpeningPointBetweenAdjacentCells.png)


### GetAdjacentCellsOnEdge

![Query Interface](../assets/images/query_grid_GetAdjacentCellsOnEdge.png)


### IsNearMarker

![Query Interface](../assets/images/query_grid_IsNearMarker.png)

