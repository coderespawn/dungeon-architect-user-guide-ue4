Rules
=====

You can attach Blueprint (or C++) based logic on the theme nodes for more control. There are two types of rules you can attach to Visual nodes

![Visual Node Rules](../assets/images/rules_01.png)

Selection Rule
--------------
A selection rule is a blueprint class (or C++ class) that is used to decide if the current node is to be attached to the scene.  This rule replaces the default **Affinity** property that is used for randomly deciding if visual node needs spawning based on a probability.

Selection rules gives you more power, when you need it.   In the rule's blueprint logic, you can query the dungeon model and determin if this node should be inserted into the scene

###Using Selection Rules
To assing an existing rule into the node, Check the **Use Selection Logic** property and select the rule you would like to attach to the node from the dropdown list

![Assign an existing Selection Rule](../assets/images/selection_rule_01.png)

You can create new rules by clicking the **+** sign and choosing a path to save you blueprint node

![Create a new Selection Rule](../assets/images/selection_rule_02.png)

Give your blueprint rule a name and save it somewhere

![Create a new Selection Rule Blueprint](../assets/images/selection_rule_03.png)

Open up the blueprint and override the **Select Node** function. This function will be called by the engine and the logic you put here will let you decide if the node should to be selected

![Override function to define logic](../assets/images/selection_rule_04.png)

### Example #1

Here is an example of a selection logic that selects a node only if the sum of their X and Y positions are even numbers (logic for a checkerboard pattern)

![Override function to define logic](../assets/images/selection_rule_05.png)

And the result after applying this rule to the ground node:

![Custom selection rule attached to a mesh node](../assets/images/selection_rule_06.jpg)

You can add more visual nodes and experiment with the **Consume on Attach** parameter to get interesting results

![Multiple visual nodes working together](../assets/images/selection_rule_07.jpg)

In the above example, the first node has **Consume on Attach** checked.  So if your blueprint logic selects the node, the sandstone mesh will be inserted and the execution stops.   However if the selection node doesn't select the node, the execution will always proceed to the next node and execute the mesh which inserts a clay brick mesh

![](../assets/images/selection_rule_eg1_1.jpg)
In the above example, the selection rule is applied to the golden pillar.  But whenever it is selected, it stops execution because the **Consume on Attach** variable is set and doesn't build a ground mesh there.    Unchecking **Consume on Attach** on the first node lets the execution proceed even if it is inserted into the scene
![](../assets/images/selection_rule_eg1_2.jpg)



### Example #2
This example places a stone mesh on the ground, but only if the cell is inside a room (and not a corridor)

![Stone ground mesh selection only when inside rooms](../assets/images/selection_rule_eg2_1.jpg)

![Room selector logic](../assets/images/selection_rule_eg2_2.jpg)

The above Selection logic was attached to the stone mesh ground node so it gets selected only when the ground marker is inside a room

Transform Rule
--------------

Dungeon Architect lets you specify offsets to your visual nodes to move/scale/rotate them from their relative marker locations.

![Static node Offset](../assets/images/offset.png)


However, if you want a more dynamic way of applying offsets (based on blueprint or C++ logic), you can do so with a *Transform Rule*.  This can be very useful to add variations to your levels for certain props


###Using Transform Rules
To assing an existing rule into the node, Check the **Use Transform Logic** property and select the rule you would like to attach to the node from the dropdown list

![Assign an existing Transform Rule](../assets/images/transform_rule_01.png)

You can create new rules by clicking the **+** sign and choosing a path to save you blueprint node

![Create a new Selection Rule](../assets/images/transform_rule_02.png)

Give your blueprint rule a name and save it somewhere

![Create a new Selection Rule Blueprint](../assets/images/transform_rule_03.png)

Open up the blueprint and override the **Get Node Offset** function. This function will be called by the engine and the logic you put here will let you decide on the offset that needs to be applied on this node

![Override function to define logic](../assets/images/transform_rule_04.png)


###Example #1

In this example, a single rock mesh is randomly rotated, and slightly scaled and translated to give a nice cave like look

![Rocks randomly rotated, translated and scaled](../assets/images/transform_rule_eg1_1.jpg)

A different transformation rule is applied to ceiling stone meshes for more variations

![Transform rule applied to rock nodes](../assets/images/transform_rule_eg1_2.jpg)

![Cliff Random rotation rule](../assets/images/transform_rule_eg1_3.png)

###Example #2

Here is an example where alternate pipes are rotated by 180 degrees to give a visually appealing look

![Alternate meshes are rotated by 180 degrees](../assets/images/transform_rule_eg2_1.jpg)

This was done by rotating the mesh node by 180 degrees for every alternate cell (similar to the checker rule logic seen previously)

![Rule assignment](../assets/images/transform_rule_eg2_2.jpg)


###Example #3

In this example a small random rotation is applied to orange ground tiles.  Useful while creating ruins when laying down broken tile meshes

![Transform rule applied to orange ground meshes](../assets/images/vol_platform_04c.jpg)

![Transformation Rule Blueprint](../assets/images/transform_rule_eg3_1.png)

