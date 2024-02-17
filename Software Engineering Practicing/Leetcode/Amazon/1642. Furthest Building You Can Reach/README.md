## [1642. Furthest Building You Can Reach](https://leetcode.com/problems/furthest-building-you-can-reach)

```Tag```:

#### Difficulty: Medium

You are given an integer array heights representing the heights of buildings, some bricks, and some ladders.

You start your journey from building 0 and move to the next building by possibly using bricks or ladders.

While moving from building i to building i+1 (0-indexed),

If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.
If the current building's height is less than the next building's height, you can either use one ladder or (h[i+1] - h[i]) bricks.
Return the furthest building index (0-indexed) you can reach if you use the given ladders and bricks optimally.

![image](https://github.com/quananhle/Python/assets/35042430/0a184ef2-5ff5-4f53-9678-c587eb7ae955)

---


---

The best strategy is to use the ladders for the longest climbs and the bricks for the shortest climbs. This shouldn’t seem too surprising; a ladder is most valuable in the cases where we would have to use a lot of bricks.
