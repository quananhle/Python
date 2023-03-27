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

- __Time complexity__: O(2<sup>m+n</sup>), for every move, we have at most 2 options.
- __Space complexity__: ```O(m+n)```, recursive stack of depth m + n

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
        memo = [[math.inf] * (COLS + 1) for _ in range(ROWS + 1)]
        
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS) or memo[row][col] != float('inf'):
                return memo[row][col]
            elif row == ROWS - 1 and col == COLS - 1:
                memo[row][col] = grid[row][col]
            else:
                memo[row][col] = grid[row][col] + min([dp(row + dx, col + dy) for dx, dy in DIRECTIONS])
            return memo[row][col]

        return dp(0, 0)
```

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
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1,0), (0,1)]
        ROWS, COLS = len(grid), len(grid[0])
        memo = collections.defaultdict(int)

        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS) or (row, col) in memo:
                return memo[(row, col)]

            if row == ROWS - 1:
                memo[(row, col)] = grid[row][col] + dp(row, col + 1)
            elif col == COLS - 1:
                memo[(row, col)] = grid[row][col] + dp(row + 1, col)
            else:
                memo[(row, col)] = grid[row][col] + min([dp(row + dx, col + dy) for dx, dy in DIRECTIONS])

            return memo[(row, col)]

        return dp(0, 0)
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1,0), (0,1)]
        ROWS, COLS = len(grid), len(grid[0])

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 0

            if row == ROWS - 1:
                return grid[row][col] + dp(row, col + 1)
            
            if col == COLS - 1:
                return grid[row][col] + dp(row + 1, col)

            return grid[row][col] + min([dp(row + dx, col + dy) for dx, dy in DIRECTIONS])

        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [[0] * (COLS + 1) for _ in range(ROWS + 1)]

        for row in range(ROWS - 1, -1, -1):
            for col in range(COLS - 1, -1 , -1):
                if row == ROWS - 1 and col != COLS - 1:
                    dp[row][col] = grid[row][col] + dp[row][col + 1]
                elif row != ROWS - 1 and col == COLS - 1:
                    dp[row][col] = grid[row][col] + dp[row + 1][col]
                elif row == ROWS - 1 and col == COLS - 1:
                    dp[row][col] = grid[row][col]
                else:
                    dp[row][col] = grid[row][col] + min(dp[row + 1][col], dp[row][col + 1])
        
        return dp[0][0]
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [[math.inf] * (COLS + 1) for _ in range(ROWS + 1)]

        for row in range(ROWS - 1, -1, -1):
            for col in range(COLS - 1, -1 , -1):
                if row == ROWS - 1 and col == COLS - 1:
                    dp[row][col] = grid[row][col]
                else:
                    dp[row][col] = grid[row][col] + min(dp[row + 1][col], dp[row][col + 1])
        
        return dp[0][0]
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        
        for row in range(1, ROWS + 1):
            dp[row][1] = grid[row - 1][0] + dp[row - 1][1]
        for col in range(1, COLS + 1):
            dp[1][col] = grid[0][col - 1] + dp[1][col - 1]

        for row in range(2, ROWS + 1):
            for col in range(2, COLS + 1): 
                dp[row][col] = grid[row - 1][col - 1] + min(dp[row - 1][col], dp[row][col - 1])

        return dp[-1][-1]
```

#### Optimized Bottom-Up Dynamic Programming (1D Array)

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [math.inf for _ in range(ROWS + 1)]

        for col in range(COLS - 1, -1 , -1):
            for row in range(ROWS - 1, -1, -1):
                if row == ROWS - 1 and col == COLS - 1:
                    dp[row] = grid[row][col]
                else:
                    dp[row] = grid[row][col] + min(dp[row + 1], dp[row])
        
        return dp[0]
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [0 for _ in range(ROWS + 1)]

        for col in range(COLS - 1, -1 , -1):
            for row in range(ROWS - 1, -1, -1):
                if row == ROWS - 1 and col != COLS - 1:
                    dp[row] = grid[row][col] + dp[row]
                elif row != ROWS - 1 and col == COLS - 1:
                    dp[row] = grid[row][col] + dp[row + 1]
                elif row == ROWS - 1 and col == COLS - 1:
                    dp[row] = grid[row][col]
                else:
                    dp[row] = grid[row][col] + min(dp[row + 1], dp[row])
        
        return dp[0]
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [math.inf] * (ROWS + 1)
        dp[1] = 0

        for col in range(COLS):
            for row in range(ROWS):
                dp[row + 1] = grid[row][col] + min(dp[row], dp[row + 1])
        
        return dp[-1]
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        dp = [math.inf] * (COLS + 1)
        dp[1] = 0

        for row in range(ROWS):
            for col in range(COLS):
                dp[col + 1] = grid[row][col] + min(dp[col], dp[col + 1])
        
        return dp[-1]
```
