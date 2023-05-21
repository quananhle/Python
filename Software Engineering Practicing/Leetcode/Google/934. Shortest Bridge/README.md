## [934. Shortest Bridge](https://leetcode.com/problems/shortest-bridge/)

```Tag```:

#### Difficulty: Medium

You are given an ```n x n``` binary matrix grid where ```1``` represents land and ```0``` represents water.

An __island__ is a 4-directionally connected group of ```1```'s not connected to any other ```1```'s. There are exactly two islands in grid.

You may change ```0```'s to ```1```'s to connect the two islands to form one island.

Return _the smallest number of ```0```'s you must flip to connect the two islands_.

![image](https://github.com/quananhle/Python/assets/35042430/5604500c-fac8-4030-aec7-d8c82931dc20)

---

__Example 1:__
```
Input: grid = [[0,1],[1,0]]
Output: 1
```

__Example 2:__
```
Input: grid = [[0,1,0],[0,0,0],[0,0,1]]
Output: 2
```

__Example 3:__
```
Input: grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
Output: 1
```

__Constraints:__

- ```n == grid.length == grid[i].length```
- ```2 <= n <= 100```
- ```grid[i][j]``` is either ```0``` or ```1```.
- There are exactly two islands in grid.

---
