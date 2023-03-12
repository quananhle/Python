## [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

```Tag```:  ```Depth-First Search``` ```Recursion```

#### Difficulty: Medium

There is an ```m x n``` rectangular island that borders both the __Pacific Ocean__ and __Atlantic Ocean__. The __Pacific Ocean__ touches the island's left and top edges, and the __Atlantic Ocean__ touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an ```m x n``` integer matrix ```heights``` where ```heights[r][c]``` represents the height above sea level of the cell at coordinate ```(r, c)```.

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is __less than or equal__ to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return _a __2D list__ of grid coordinates ```result``` where ```result[i]``` = [r<sub>i</sub>, c<sub>i>/sub>] denotes that rain water can flow from cell (r<sub>i</sub>, c<sub>i>/sub>) to __both__ the __Pacific__ and __Atlantic oceans___.

![image](https://user-images.githubusercontent.com/35042430/224526884-31420b32-4452-4843-8585-9c137763f307.png)
  
---
