Volumes
=======

Dungeon Architect provides various volumes to help you influence your dungeon as per your requirements.

Platform Volume
---------------

Place a platform volume anywhere in the scene and Dungeon Architect would adjust the dungeon layout and create a platform (room or corridor) at that location.  Scale the volume along the XY plane to change the size of the generated platform.   You can move the platform volume with the move tool to the desired location. (Rotation is not supported)

This gives you artistic control and lets you manipulate the dungeon to suit your needs

Here is an example of a user generated layout using volumes leading up to a boss fight

![User defined dungeon layout](../assets/images/vol_platform_01.jpg)

To place a platform volume,  go to Volumes tab and drag and drop it into the scene

![Place a platform volume into the scene](../assets/images/vol_platform_02.jpg)


Select the platform volume and have a look at it's properties

![Platform Volume Properties](../assets/images/vol_platform_03.jpg)

The Volume needs to know which dungeon the volume belongs to (DA Supports mulitple dungeons within the same scene). Select the dungeon you have in your scene.

Relatime Update flag updates the dungeon as you move/scale the platform volume, giving you interactive feedback.  Uncheck if you face performance issues (Or, build the dungeon over multiple frames without stalling the UI by setting the Dungeon actor config propery's field *MaxBuildTimePerFrameMs* to around 20 to 30)


An example of a corridor segment created using a platform volume.  Notice how the platform nicely blends with the existing geometry if it comes in contact with it

![Platform Volume Example](../assets/images/vol_platform_04a.jpg)
![Platform Volume Example](../assets/images/vol_platform_04b.jpg)
![Platform Volume Example](../assets/images/vol_platform_04c.jpg)
![Platform Volume Example](../assets/images/vol_platform_04d.jpg)


Rooms always connect to atleast one other room in the dungeon.  Changing the Cell type to *Room* creates this result

![Room creation using a Platform Volume](../assets/images/vol_platform_05.jpg)


Theme Override Volume
---------------------
Give certain areas of you dungeons a different look and feel.   Layout inside this volume would use the theme defined by this volume.  

This is useful for adding variations to your level


![Hell Forge Theme](../assets/images/vol_theme_01.jpg)

![A different theme applied to this section](../assets/images/vol_theme_02.jpg)

![Layout within the volume picks up the theme overridden by the volume](../assets/images/vol_theme_03.jpg)

![Theme Override Volume Properties](../assets/images/vol_theme_04.png)

The **Reversed** flag, if checked, overrides the theme of everything outside of the volume (as opposed to inside)

**Realtime Update** updates the dungeon as it is moved or scaled giving your immediate visual feedback

Note: When overriding, the themes needs to be designed for the same grid cell size for proper results

Negation Volume
---------------
This volume removes all procedural geometry inside of this volume.  Use this to get rid of procedural geometry in areas you do not need or when it is getting in the way while manually painting your layout

![Theme Override Volume Properties](../assets/images/vol_negation_01.jpg)
![Theme Override Volume Properties](../assets/images/vol_negation_02.jpg)

![Drag and drop a Negation Volume](../assets/images/create_volume_negation.png)

![Negation Volume Properties](../assets/images/vol_negation_properties.png)

The **Reversed** flag, if checked, removes all the procedural layout outside of the volume (as opposed to inside)

**Realtime Update** updates the dungeon as it is moved or scaled giving your immediate visual feedback


Mirror Volume
-------------
Mirror Volumes lets you create symmetric dungeon by mirroring the layout of a dungeon

![Dungeon Mirrored along the X-axis](../assets/images/vol_mirror_01.jpg)

![Dungeon Mirrored along both the X and Y-axis](../assets/images/vol_mirror_02.jpg)

This is useful when you need symmetry in your maps (e.g. strategy games)

To create a Mirror Volume, drag it from the volumes tab:

![Drag and drop a Mirror volume from the Volumes tab](../assets/images/vol_mirror_03.jpg)


Place the volume where you would like to have the layout mirrored.  The mirroring would happen along the local X-axis of the volume.  You can rotate the volume in steps of 90 degrees (0, 90, 180, 270) to mirror in different directions

Multiple mirrors can also be placed within the same dungeon

Example of procedural maps created for a 2-player twin stick RTS game
![](../assets/images/vol_mirror_eg_1.jpg)
![](../assets/images/vol_mirror_eg_2.jpg)
![](../assets/images/vol_mirror_eg_3.jpg)
![](../assets/images/vol_mirror_eg_4.jpg)
![](../assets/images/vol_mirror_eg_5.jpg)

