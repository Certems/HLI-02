/*
Notes about how certain game functions should play out
0. World
1. Map
2. Tiles
3. Crops
4. Brewing
5. Entities
6. Items


0 -> World
The world is the space in which all maps exist. It also shows a more overarching
view of the land environment and relief, even on places where there is no map. Map 
qualities are determined by the location in the world.
The world will be viewable when travelling to other inns or viewing the a record of 
the world map.

1 -> Map
The map holds tiles, which build up environments. These will be taverns, varying from
more outside views to interior views. Certain factions will prefer certain 'qualities' 
in maps (e.g will like beaches, or forests, or candles in rooms or organic walls). Maps 
stored and viewed at later points and the player can travel to different maps.
The 'mapQuality' array stores features about the map used for generation and to determine
faction interests, where each index represents, respecively;
0 = Map size                  (e.g small, medium, large, etc)
1 = Map general               (e.g interior, exterior, etc)
2 = Map temperature           (e.g hot, cold, neutral, etc)
3 = Map border Style        (e.g water , open, etc)
4 = Map border Quantity     (e.g sparse , dense, etc)
5 = Map foliage Style         (e.g forest , desert, etc)
6 = Map foliage Quantity      (e.g sparse , dense, etc)
7 = Map structures Style    (e.g clear , ancient, etc)
8 = Map structures Quantity (e.g sparse , dense, etc)


2 -> Tiles
Tiles represent spaces in the array forming the map. Tiles can hold floors, volumes and 
ceilings. The tiles hold the position of said components and other information that is 
general but relevent.
Volumes refer to the main content on the tile, whereas the floor and ceiling represent 
the floor texture beneath the tile (sometimes invisible when covered by volume) and the 
ceiling which appears when moving away from a structure (fades in and out )

3 -> Crops
Crops are stored as a series of different items for each stage of growth
Each crop knows what crop it will become when grown (or have null if it is the final crop)
Crops will calculate growth when in grower tiles
Crops can only be planted in their 0th stage / seed form, but can be harvested early

4 -> Brewing

5 -> Entities
Entities can either be interactive, inert or boss
Interactive entities can wander a map and chat to you, or go to your inn and buy drinks 
(e.g. orc men, bird men, lizard men, robots, ###big boss creatures ->MAYBE MOVE TO 
ANOTHER ENTITY TYPE###, some dogs, etc)
Inert entities will move around the map in a more passive state, not being able to be 
talked to or get involved in the process of the game loop, being more ambient in general 
(e.g. birds, dogs, etc)
Boss entities take huge authority when entering the map. They require large amounts of 
space for them and the 'interactive customers' they spawn, and will change the flow and 
demands of the tavern. (e.g big slime man, big priest guy, leader of faction, etc)

Entities will be given patterns and ideas when spawned, which they will carry out while 
in the map, such as [Wants to buy X beer of Y type] or [wants to explore X points and spend 
roughly Y time at each] or [wants to follow X entity].
They will also appear with stories that can be accessed via interacting with them (sometimes 
given stories, sometimes not). These will be paced out to take a certain number of spawns to 
access them all and discover the world's story -> possibly triggrt events.

6 -> Items
Items can be tileHolders, ingredients or actives where;
tileHolders = represents a type of tile component that is able to be placed
Ingredients = Any item which is just a symbol for a task (e.g. wheat is not useful as 
    an item in itself, it is just a slot that works with a machine to make bread or a brew,
    but likewise is still individual). Those refer to more than just food ingredients and could
    refer to things like bolts and washers too.
Actives     = An item which is used from the inventory and serves a purpose there alone, 
    e.g a fishing rod or brew
These are split into groups of 'Unique' and 'General' items, where ingredients and tileHolders 
are considered genral and actives are considered unique
In reality, these are all just item types but are narratively separated into these groups, which 
is reflected in design and usage

Item packets are sub-inventories for organisation.
*/