## [64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given a ```m x n``` ```grid``` filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

![image](https://user-images.githubusercontent.com/35042430/227823689-30b21db7-4c0a-400b-a78a-474b907fc5bd.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/05/minpath.jpg)
```
Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
Output: 7
Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
```

__Example 2:__
```
Input: grid = [[1,2,3],[4,5,6]]
Output: 12
```

__Constraints:__

- ```m == grid.length```
- ```n == grid[i].length```
- ```1 <= m, n <= 200```
- ```0 <= grid[i][j] <= 100```

---

