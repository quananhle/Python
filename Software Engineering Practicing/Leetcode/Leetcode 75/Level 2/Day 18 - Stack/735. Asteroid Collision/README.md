## [735. Asteroid Collision](https://leetcode.com/problems/asteroid-collision/)

```Tag```: ```Stack```

#### Difficulty: Medium

We are given an array ```asteroids``` of integers representing asteroids in a row.

For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

![image](https://user-images.githubusercontent.com/35042430/226216224-e4df5132-bef4-48fa-9673-39c2125e502f.png)

---

__Example 1:__
```
Input: asteroids = [5,10,-5]
Output: [5,10]
Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.
```

__Example 2:__
```
Input: asteroids = [8,-8]
Output: []
Explanation: The 8 and -8 collide exploding each other.
```

__Example 3:__
```
Input: asteroids = [10,2,-5]
Output: [10]
Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.
```

__Constraints:__

- ```2 <= asteroids.length <= 10^4```
- ```-1000 <= asteroids[i] <= 1000```
- ```asteroids[i] != 0```

---
