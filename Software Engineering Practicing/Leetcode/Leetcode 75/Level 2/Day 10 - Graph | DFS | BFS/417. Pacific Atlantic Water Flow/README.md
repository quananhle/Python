## [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

```Tag```:  ```Depth-First Search``` ```Recursion```

#### Difficulty: Medium

There is an ```m x n``` rectangular island that borders both the __Pacific Ocean__ and __Atlantic Ocean__. The __Pacific Ocean__ touches the island's left and top edges, and the __Atlantic Ocean__ touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an ```m x n``` integer matrix ```heights``` where ```heights[r][c]``` represents the height above sea level of the cell at coordinate ```(r, c)```.

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is __less than or equal__ to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return _a __2D list__ of grid coordinates ```result``` where ```result[i]``` = [r<sub>i</sub>, c<sub>i>/sub>] denotes that rain water can flow from cell (r<sub>i</sub>, c<sub>i>/sub>) to __both__ the __Pacific__ and __Atlantic oceans___.

![image](https://user-images.githubusercontent.com/35042430/224526884-31420b32-4452-4843-8585-9c137763f307.png)
  
---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/06/08/waterflow-grid.jpg)
```
Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
Explanation: The following cells can flow to the Pacific and Atlantic oceans, as shown below:
[0,4]: [0,4] -> Pacific Ocean 
       [0,4] -> Atlantic Ocean
[1,3]: [1,3] -> [0,3] -> Pacific Ocean 
       [1,3] -> [1,4] -> Atlantic Ocean
[1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean 
       [1,4] -> Atlantic Ocean
[2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean 
       [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
[3,0]: [3,0] -> Pacific Ocean 
       [3,0] -> [4,0] -> Atlantic Ocean
[3,1]: [3,1] -> [3,0] -> Pacific Ocean 
       [3,1] -> [4,1] -> Atlantic Ocean
[4,0]: [4,0] -> Pacific Ocean 
       [4,0] -> Atlantic Ocean
Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.
```

__Example 2:__
```
Input: heights = [[1]]
Output: [[0,0]]
Explanation: The water can flow from the only cell to the Pacific and Atlantic oceans.
```

__Constraints:__

- ```m == heights.length```
- ```n == heights[r].length```
- ```1 <= m, n <= 200```
- 0 <= ```heights[r][c]``` <= 10<sup>5</sup>
  
---
