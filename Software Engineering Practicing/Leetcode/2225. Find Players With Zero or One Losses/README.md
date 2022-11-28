## 2225. Find Players With Zero or One Losses

#### Difficulty: Medium

You are given an integer array matches where __matches[i] = [winner<sub>i</sub>, loser<sub>i</sub>]__ indicates that the player winner<sub>i</sub> defeated player loser<sub>i</sub> in a match.

Return a list ```answer``` of size ```2``` where:

- ```answer[0]``` is a list of all players that have __not__ lost any matches.

- ```answer[1]``` is a list of all players that have lost exactly ```one``` match.

The values in the two lists should be returned in ```increasing``` order.

#### Note:

You should only consider the players that have played at least one match.
The testcases will be generated such that no two matches will have the same outcome.
