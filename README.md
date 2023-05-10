# FFA
this sourcemod plugin brings free for all deathmatch to tf2

# Requirements
* Friendly Fire: https://forums.alliedmods.net/showthread.php?t=342166
* Instant Respawn: https://forums.alliedmods.net/showthread.php?p=2174552
* Custom Spawn Locations [not yet complete]: https://github.com/tf2-cjm/custom-spawn-locations
* Disable Team Objectives: https://forums.alliedmods.net/showthread.php?t=140862&page=4

# Contributing
* Setup for development: https://www.youtube.com/watch?v=QF7urRJIgrE

# Development
* Looking at some of the best competitive tf2 plugins we have today such as mge and soap DM, they can be broken down into simple sub-components. 
For example, if we look at soap dm it stands as one singular plugin, but in reality it does 4 main things. 
  1. Instant Respawn
  2. Removes all team objectives
  3. Restores health and ammo on kill
  4. Uses custom spawn locations
* If soap-dm was simply the composition of 4 sub-plugins like above, then ffa would be very close to being complete as we could re-use the spawn modifications and team objectives.
* Therefore all we should have to develop is a custom point scoring system (1 frag = 1 point) and win condition (10 minutes or first to 20 frags?)

# Related Links:
* https://www.reddit.com/r/tf2/comments/30b6pe/deathmatch_maps/
* changing players score using sourcemod https://forums.alliedmods.net/showthread.php?t=69248
* change color of players: https://sm.alliedmods.net/api/index.php?fastload=show&id=815&
