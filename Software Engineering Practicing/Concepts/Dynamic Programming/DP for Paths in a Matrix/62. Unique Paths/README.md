## 62. Unique Paths

```Tag```: ```Dynamic Programming``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

There is a robot on an ```m x n``` grid. The robot is initially located at the top-left corner (i.e., ```grid[0][0]```). The robot tries to move to the __bottom-right corner__ (i.e., ```grid[m - 1][n - 1]```). The robot can only move either down or right at any point in time.

Given the two integers ```m``` and ```n```, return _the number of possible unique paths that the robot can take to reach the bottom-right corner_.

The test cases are generated so that the answer will be less than or equal to 2 * 10<sup>9</sup>.

![image](https://user-images.githubusercontent.com/35042430/220459483-c70c9e13-d1dd-4add-99d8-ee4a22f0272b.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/10/22/robot_maze.png)
```
Input: m = 3, n = 7
Output: 28
```

__Example 2:__
```
Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down
```

__Constraints:__

- ```1 <= m, n <= 100```

---

![image](https://leetcode.com/problems/unique-paths/solutions/504514/Figures/62/first_row2.png)

![image](https://leetcode.com/problems/unique-paths/solutions/504514/Figures/62/first_col2.png)

![image](https://leetcode.com/problems/unique-paths/solutions/504514/Figures/62/inner_cell2.png)

![image](https://leetcode.com/problems/unique-paths/solutions/504514/Figures/62/bin4.png)

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        # Depth-First Search
        ROWS, COLS = m, n
        memo = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        DIRECTIONS = [(1,0), (0,1)]

        def dfs(row, col):
            # Base cases
            if row == ROWS - 1 or col == COLS - 1:
                return 1
            if not (0 <= row < ROWS or 0 <= col < COLS):
                return
             
            if (row, col) in memo:
                return memo[row][col]

            memo[row][col] = sum([dfs(row + x, col + y) for (x, y) in DIRECTIONS])
            '''
            memo[row][col] = dfs(row + 1, col) + dfs(row, col + 1)
            '''
            return memo[row][col]

        return dfs(0, 0)
```

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        # Depth-First Search
        @lru_cache(None)
        def dfs(row, col):
            # Base cases
            if row == 1 or col == 1:
                return 1

            ans = dfs(row - 1, col) + dfs(row, col - 1)
            return ans

        return dfs(m, n)
```

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        # Depth-First Search
        @lru_cache(None)
        def dfs(row, col):
            # Base cases
            if row == m - 1 or col == n - 1:
                return 1
            if not (0 <= row < m or 0 <= col < n):
                return

            ans = dfs(row + 1, col) + dfs(row, col + 1)
            return ans

        return dfs(0, 0)
```

```Python
class Solution:
    @lru_cache(None)
    def uniquePaths(self, m: int, n: int) -> int:
        if m == 1 or n == 1:
            return 1

        return self.uniquePaths(m - 1, n) + self.uniquePaths(m, n - 1)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        ROWS, COLS = m, n
        dp = [[1] * (COLS + 1) for _ in range(ROWS + 1)]
        for r in range(1, ROWS):
            for c in range(1, COLS):
                dp[r][c] = dp[r - 1][c] + dp[r][c - 1]
        return dp[m - 1][n - 1] 
```

#### Optimized Space Bottom-Up Dynamic Programming (1D Array)

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        ROWS, COLS = m, n
        dp = [1] * (COLS + 1)
        for _ in range(1, ROWS):
            for c in range(1, COLS):
                dp[c] += dp[c - 1]
        return dp[n - 1]
```
