## [64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)

```Tag```: ```Dynamic Programming``` ```Graph``` ```Depth-First Search``` ```Breadth-First Search``` 

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

### Brute Force

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ### Time Limit Exceeded
        m, n = len(grid), len(grid[0])

        def dfs(row, col):
            if row == m or col == n:
                return float('inf')
            if row == m - 1 and col == n - 1:
                return grid[row][col]
            
            return grid[row][col] + min(dfs(row + 1, col), dfs(row, col + 1))
        
        return dfs(0, 0)
```

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1,0), (0,1)]
        ROWS, COLS = len(grid), len(grid[0])

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return math.inf

            if row == ROWS - 1 and col == COLS - 1:
                return grid[row][col]
            
            return grid[row][col] + min([dp(row + dx, col + dy) for dx, dy in DIRECTIONS])

        return dp(0, 0)
```

```Python

```

```Python

```

#### Bottom-Up Dynamic Programming
