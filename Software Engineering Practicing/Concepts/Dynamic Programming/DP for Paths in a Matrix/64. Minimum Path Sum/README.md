## 64. Minimum Path Sum

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a ```m x n``` ```grid``` filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

__Note__: You can only move either down or right at any point in time.

![image](https://user-images.githubusercontent.com/35042430/220721224-c87c5f11-aa81-43c6-ad27-e229891e23e3.png)

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

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        memo = collections.defaultdict(int)
        ROWS, COLS = len(grid), len(grid[0])

        memo[(0, 0)] = grid[0][0]

        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 0

            if (row, col) in memo or (not row and not col):
                return memo[(row, col)]

            current = grid[row][col]
            if not row:
                return dp(row, col - 1) + current
            if not col:
                return dp(row - 1, col) + current


            memo[(row, col)] = current + min(dp(row, col - 1), dp(row - 1, col))
            return memo[(row, col)]

        return dp(ROWS - 1, COLS - 1)
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        # Top-Down DP (Recursion)
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1)]
        memo = collections.defaultdict(int)

        # Base case
        memo[(ROWS-1, COLS-1)] = grid[ROWS-1][COLS-1]
           
        def dp(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 101

            if row == ROWS - 1 and col == COLS - 1 or (row, col) in memo:
                return memo[(row, col)]

            return min(dp(row + 1, col), dp(row, col + 1)) + grid[row][col]

        return dp(0, 0)
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 0

            if row == 0 and col == 0:
                return grid[0][0]
            if row == 0:
                return grid[row][col] + dp(row, col - 1)
            if col == 0:
                return grid[row][col] + dp(row - 1, col)
                
            return grid[row][col] + min(dp(row - 1, col), dp(row, col - 1))

        return dp(ROWS - 1, COLS - 1)
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        # Top-Down DP (Recursion)
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1)]

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 0
            if row == ROWS - 1 and col == COLS - 1:
                return grid[row][col]

            right = down = grid[row][col]
            if row == ROWS - 1:
                right += dp(row, col + 1)
                return right
            if col == COLS - 1:
                down += dp(row + 1, col)
                return down
    
            return grid[row][col] + min([dp(row + x, col + y) for x, y in DIRECTIONS])

        return dp(0, 0)
```

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        # Top-Down DP (Recursion)
        ROWS, COLS = len(grid), len(grid[0])

        @lru_cache(None)
        def dp(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return float('inf')

            if row == col == 0:
                return grid[row][col]

            return min(dp(row - 1, col), dp(row, col - 1)) + grid[row][col]

        return dp(ROWS - 1, COLS - 1)
```
        
#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])

        dp = grid[:]

        for row in range(1, ROWS):
            dp[row][0] += dp[row - 1][0]
        for col in range(1, COLS):
            dp[0][col] += dp[0][col - 1]
        
        for row in range(1, ROWS):
            for col in range(1, COLS):
                dp[row][col] += min(dp[row - 1][col], dp[row][col - 1])
        return dp[ROWS - 1][COLS - 1]
```

#### Space Optimized Bottom-Up Dynamic Programming (1D Array)

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])

        dp = grid[0][:]

        for col in range(1, COLS):
            dp[col] += dp[col - 1]
        
        for row in range(1, ROWS):
            dp[0] += grid[row][0]
            for col in range(1, COLS):
                dp[col] = grid[row][col] + min(dp[col], dp[col - 1])
        return dp[COLS - 1]
```
