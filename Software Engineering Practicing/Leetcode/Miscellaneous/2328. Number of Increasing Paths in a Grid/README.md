## [2328. Number of Increasing Paths in a Grid](https://leetcode.com/problems/number-of-increasing-paths-in-a-grid/)

```Tag```: ```Dynamic Programming``` ```Topological Sort``` ```Depth-First Search```

#### Difficulty: Hard

You are given an ```m x n``` integer matrix ```grid```, where you can move from a cell to any adjacent cell in all ```4``` directions.

Return _the number of strictly increasing paths in the grid such that you can start from any cell and end at any cell_. Since the answer may be very large, return it modulo $10^9 + 7$.

Two paths are considered different if they do not have exactly the same sequence of visited cells.

![image](https://github.com/quananhle/Python/assets/35042430/b8d5e0b5-47ef-4c6e-a0fa-742ecd70915a)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/05/10/griddrawio-4.png)
```
Input: grid = [[1,1],[3,4]]
Output: 8
Explanation: The strictly increasing paths are:
- Paths with length 1: [1], [1], [3], [4].
- Paths with length 2: [1 -> 3], [1 -> 4], [3 -> 4].
- Paths with length 3: [1 -> 3 -> 4].
The total number of paths is 4 + 3 + 1 = 8.
```

__Example 2:__
```
Input: grid = [[1],[2]]
Output: 3
Explanation: The strictly increasing paths are:
- Paths with length 1: [1], [2].
- Paths with length 2: [1 -> 2].
The total number of paths is 2 + 1 = 3.
```

__Constraints:__

- ```m == grid.length```
- ```n == grid[i].length```
- ```1 <= m, n <= 1000```
- ```1 <= m * n <= 10^5```
- ```1 <= grid[i][j] <= 10^5```

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/number-of-increasing-paths-in-a-grid/Figures/2328/3.png)

![image](https://leetcode.com/problems/number-of-increasing-paths-in-a-grid/Figures/2328/4.png)

- __Time Complexity__: $O(m\cdot n)$
- __Space Complexity__: $O(m\cdot n)$

```Python
class Solution:
    def countPaths(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        MOD = 10**9 + 7
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        
        memo = [[0] * COLS for _ in range(ROWS)]

        def dfs(row, col):
            # Base case
            if memo[row][col]:
                return memo[row][col]

            ans = 1
            
            for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and grid[next_row][next_col] < grid[row][col]):
                    continue
                ans += dfs(next_row, next_col) % MOD

            memo[row][col] = ans
            return ans
        
        return sum(dfs(row, col) for row in range(ROWS) for col in range(COLS)) % MOD
```

```Python
class Solution:
    def countPaths(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        MOD = 10**9 + 7
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        
        memo = collections.defaultdict(int)

        def dfs(row, col):
            # Base case
            if (row, col) in memo:
                return memo[(row, col)]

            ans = 1
            
            for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and grid[next_row][next_col] < grid[row][col]):
                    continue
                ans += dfs(next_row, next_col) % MOD
            
            memo[(row, col)] = ans
            return ans
        
        return sum(dfs(row, col) for row in range(ROWS) for col in range(COLS)) % MOD
```

```Python
class Solution:
    def countPaths(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        MOD = 10**9 + 7
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        
        @lru_cache(None)
        def dfs(row, col):
            ans = 1
            
            for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and grid[next_row][next_col] < grid[row][col]):
                    continue
                ans += dfs(next_row, next_col) % MOD

            return ans
        
        return sum(dfs(row, col) for row in range(ROWS) for col in range(COLS)) % MOD
```
