
# RPS Killer for Freak Fortress 2

#### A plugin that instantly slays the boss player after it loses an RPS taunt to a non-Boss player.

I make this plugin to accommodate the imbalanced  RPS taunt outcome between the boss and non-boss player. Since the taunt only takes 1000 damage from the losing side, it doesn't hurt the boss much but it kills the non-boss player instantly, which is not fair and fun in my opinion.

### What this plugin does:
- When the boss loses the RPS taunt, it dies instead of just having 1000 health removed.
- It applies the exact amount of damage as its remaining health, and hold the winner responsible for the damage dealt to the boss, not just making the boss suicide in a blink.
- Prints out a message to all players that the boss is killed for losing an RPS taunt.
- Does not slay same team boss vs boss RPS Taunt.
### ConVars
```
rpskiller_interval <second(s)> - Interval in seconds before it slays the player (Default: 3.3 Seconds)
```
### Dependencies
- Multi-Colors: [https://github.com/Bara/Multi-Colors](https://github.com/Bara/Multi-Colors)
- Freak Fortress 2 (freak_fortress_2.inc): [https://github.com/50DKP/FF2-Official](https://github.com/50DKP/FF2-Official)
