## [1254. Number of Closed Islands](https://leetcode.com/problems/number-of-closed-islands)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Graph``` ```Union-Find```

#### Difficulty: Medium

Given a 2D ```grid``` consists of ```0```s (land) and ```1```s (water).  An island is a maximal 4-directionally connected group of ```0```s and a closed island is an island totally (all left, top, right, bottom) surrounded by ```1```s.

Return _the number of closed islands_.

![image](https://user-images.githubusercontent.com/35042430/230480118-7b905f6f-9b15-45b7-9758-6d31a0718c29.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/10/31/sample_3_1610.png)
```
Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
Output: 2
Explanation: 
Islands in gray are closed because they are completely surrounded by water (group of 1s).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/10/31/sample_4_1610.png)
```
Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
Output: 1
```

__Example 3:__
```
Input: grid = [[1,1,1,1,1,1,1],
               [1,0,0,0,0,0,1],
               [1,0,1,1,1,0,1],
               [1,0,1,0,1,0,1],
               [1,0,1,1,1,0,1],
               [1,0,0,0,0,0,1],
               [1,1,1,1,1,1,1]]
Output: 2
```

__Constraints:__

- ```1 <= grid.length, grid[0].length <= 100```
- ```0 <= grid[i][j] <=1```
 
 ---
