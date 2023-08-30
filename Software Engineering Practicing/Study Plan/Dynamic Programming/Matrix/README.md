## Matrix

### [62. Unique Paths](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%201/Day%2011%20-%20Dynamic%20Programming/62.%20Unique%20Paths)

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        DIRECTIONS = [(1, 0), (0, 1)]

        @lru_cache(maxsize=None)
        def dp(row, col):
            # Base case
            if not (0 <= row < m and 0 <= col < n):
                return 0

            if row == m - 1 and col == n - 1:
                return 1
            
            ans = dp(row + 1, col) + dp(row, col + 1)
            return ans
        
        return dp(0, 0)
```

### [64. Minimum Path Sum](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Goldman%20Sachs/64.%20Minimum%20Path%20Sum)

```Python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])

        @lru_cache(maxsize=None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return math.inf
            
            if row == ROWS - 1 and col == COLS - 1:
                return grid[row][col]

            ans = min(dp(row + 1, col), dp(row, col + 1)) + grid[row][col]
            return ans
        
        return dp(0, 0)
```

### [63. Unique Paths II](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/DP%20for%20Paths%20in%20a%20Matrix/63.%20Unique%20Paths%20II)

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        m, n = len(obstacleGrid), len(obstacleGrid[0])
        DIRECTIONS = [(1, 0), (0, 1)]

        # Corner case: if the finish cell is an obstacle itself
        if obstacleGrid[m - 1][n - 1] == 1:
            return 0

        @lru_cache(maxsize=None)
        def dp(row, col):
            # Base case
            if not (0 <= row < m and 0 <= col < n and obstacleGrid[row][col] != 1):
                return 0
            
            if row == m - 1 and col == n - 1:
                return 1

            ans = sum([dp(row + dx, col + dy) for dx, dy in DIRECTIONS])

            return ans
        
        return dp(0, 0)
```

### [120. Triangle](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Study%20Plan/Algorithm/Algorithm%20I/Day%2012%20-%20Dynamic%20Programming/120.%20Triangle)

```Python
class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        m = len(triangle)

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < m):
                return 0
            
            # Recurrence relation: find the minimum number in the next row to add to the final output
            path = triangle[row][col]
            path += min(dp(row + 1, col), dp(row + 1, col + 1))
            return path

        return dp(0, 0)
```

### 931. Minimum Falling Path Sum

```Python

```

### 221. Maximal Square

```Python

```
