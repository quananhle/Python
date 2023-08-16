## [63. Unique Paths II](https://leetcode.com/problems/unique-paths-ii/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given an ```m x n``` integer array ```grid```. There is a robot initially located at the top-left corner (i.e., ```grid[0][0])```. The robot tries to move to the bottom-right corner (i.e., ```grid[m - 1][n - 1]```). The robot can only move either down or right at any point in time.

An obstacle and space are marked as ```1``` or ```0``` respectively in ```grid```. A path that the robot takes cannot include any square that is an obstacle.

Return _the number of possible unique paths that the robot can take to reach the bottom-right corner_.

The testcases are generated so that the answer will be less than or equal to 2 * 10<sup>9</sup>.

![image](https://github.com/quananhle/Python/assets/35042430/6f78012a-20f5-46e5-b19b-ef34778662f7)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/04/robot1.jpg)
```
Input: obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
Output: 2
Explanation: There is one obstacle in the middle of the 3x3 grid above.
There are two ways to reach the bottom-right corner:
1. Right -> Right -> Down -> Down
2. Down -> Down -> Right -> Right
```

__Example 2:__

```
Input: obstacleGrid = [[0,1],[0,0]]
Output: 1
```

__Constraints:__

- $m == obstacleGrid.length$
- $n == obstacleGrid[i].length$
- $1 \le m, n \le 100$
- ```obstacleGrid[i][j]``` is ```0``` or ```1```.

---

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        # Top-Down DP (Recursion)
        ROWS, COLS = len(obstacleGrid), len(obstacleGrid[0])

        @lru_cache
        def dp(row, col):
            # Base cases
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 0
            # Edge case: check if the obstacle in at the bottom right corner
            if obstacleGrid[row][col]:
                return 0

            if row == ROWS - 1 and col == COLS - 1:
                return 1

            # Recurrence relation
            ans = dp(row + 1, col) + dp(row, col + 1)
            return ans

        return dp(0, 0)
```

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        ROWS, COLS = len(obstacleGrid), len(obstacleGrid[0])

        @lru_cache
        def dp(row, col):
            # Base cases
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return 0
            # Edge case: check if the obstacle in at the bottom right corner
            if obstacleGrid[row][col]:
                return 0

            if row == 0 and col == 0:
                return 1

            # Recurrence relation
            ans = dp(row - 1, col) + dp(row, col - 1)
            return ans

        return dp(ROWS - 1, COLS - 1)
```

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        ROWS, COLS = len(obstacleGrid), len(obstacleGrid[0])
        obstacles = set()
        DIRECTIONS = [(1, 0), (0, 1)]

        for row in range(ROWS):
            for col in range(COLS):
                if obstacleGrid[row][col] == 1:
                    obstacles.add((row, col))

        @lru_cache(maxsize=None)
        def dp(row, col):
            ans = 0
            # Base cases
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in obstacles):
                return 0

            if obstacleGrid[ROWS - 1][COLS - 1] == 1:
                return 0

            if (row, col) == (ROWS - 1, COLS - 1):
                return 1

            ans = sum([dp(row + dx, col + dy) for dx, dy in DIRECTIONS])
            return ans

        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        ROWS, COLS = len(obstacleGrid), len(obstacleGrid[0])
        
        dp = [[0] * COLS for _ in range(ROWS)]
        
        # Edge cases: check if the obstacles are at the starting cell or the finished cell
        if obstacleGrid[0][0] == 1 or obstacleGrid[-1][-1] == 1:
            return 0
        # Set up starting point
        dp[0][0] = 1
        
        for row in range(1, ROWS):
            dp[row][0] = 1 if obstacleGrid[row][0] == 0 and dp[row - 1][0] == 1 else 0
            
        for col in range(1, COLS):
            dp[0][col] = 1 if obstacleGrid[0][col] == 0  and dp[0][col - 1] == 1 else 0
        
        for row in range(1, ROWS):
            for col in range(1, COLS):
                if obstacleGrid[row][col] == 0:
                    dp[row][col] = dp[row - 1][col] + dp[row][col - 1]

        return dp[ROWS - 1][COLS - 1]
```

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        ROWS, COLS = len(obstacleGrid), len(obstacleGrid[0])
        a = [0 if i == 1 else 1 for i in obstacleGrid[0]]
        b = [0] * COLS

        for i in range(1, len(a)):
            if a[i-1] == 0:
                a[i] = 0

        for row in range(1, ROWS):
            for col in range(COLS):
                if col == 0:
                    b[col] = a[col] if obstacleGrid[row][col] == 0 else 0
                else:
                    b[col] = b[col -1 ] + a[col] if obstacleGrid[row][col] == 0 else 0
            a = b
            b = [0] * COLS
        return a[-1]
```

__Time Complexity:__ ```O(M * N)```, iterate through every cell in grid of M * N size

__Space Complexity:__ ```O(1)```, modified the input grid in-place

```Python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        ROWS, COLS = len(obstacleGrid), len(obstacleGrid[0])

        # Edge case: the starting cell is an obstacle
        if obstacleGrid[0][0]:
            return 0
        obstacleGrid[0][0] = 1

        for row in range(1,ROWS):
            obstacleGrid[row][0] = int(obstacleGrid[row][0] == 0 and obstacleGrid[row-1][0] == 1)
        for col in range(1, COLS):
            obstacleGrid[0][col] = int(obstacleGrid[0][col] == 0 and obstacleGrid[0][col-1] == 1)
        
        # Starting from cell(1,1) fill up the values
        # No. of ways of reaching cell[i][j] = cell[i - 1][j] + cell[i][j - 1]
        # i.e. From above and left.
        for row in range(1, ROWS):
            for col in range(1, COLS):
                if obstacleGrid[row][col] == 0:
                    obstacleGrid[row][col] = obstacleGrid[row-1][col] + obstacleGrid[row][col-1]
                else:
                    obstacleGrid[row][col] = 0

        # Return value stored in rightmost bottommost cell. That is the destination.            
        return obstacleGrid[ROWS - 1][COLS - 1]
```
