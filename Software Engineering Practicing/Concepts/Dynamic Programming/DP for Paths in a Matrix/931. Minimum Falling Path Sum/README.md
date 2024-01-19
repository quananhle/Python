## [931. Minimum Falling Path Sum](https://leetcode.com/problems/minimum-falling-path-sum)

```Tag```: ```Dynamic Programming``` ```Depth-First Search```

#### Difficulty: Medium

Given an ```n x n``` array of integers ```matrix```, return _the __minimum sum__ of any __falling path__ through ```matrix```_.

A __falling path__ starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position ```(row, col)``` will be ```(row + 1, col - 1)```, ```(row + 1, col)```, or ```(row + 1, col + 1)```.

![image](https://github.com/quananhle/Python/assets/35042430/01313021-4bd2-4ebf-b71c-2499d3d29437)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/11/03/failing1-grid.jpg)
```
Input: matrix = [[2,1,3],[6,5,4],[7,8,9]]
Output: 13
Explanation: There are two falling paths with a minimum sum as shown.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/11/03/failing2-grid.jpg)
```
Input: matrix = [[-19,57],[-40,-5]]
Output: -59
Explanation: The falling path with a minimum sum is shown.
```

__Constraints:__

- $n == matrix.length == matrix[i].length$
- $1 \le n \le 100$
- $-100 \le matrix[i][j] \le 100$

---

![image](https://leetcode.com/problems/minimum-falling-path-sum/solutions/2108185/Figures/931/931_overview.png)

### Brute Force

#### DeptH-First Search

![image](https://leetcode.com/problems/minimum-falling-path-sum/Figures/931/931_example_problem.png)

![image](https://leetcode.com/problems/minimum-falling-path-sum/Figures/931/931_example_3possibilities.png)

__Algorithm__

1. Implement a Depth First Search algorithm, by defining a recursive function, ```dfs(row, col)```, that recursively explores all the paths from the current cell (defined by parameters ```row``` and ```col```).
  - Define Base Case: In any recursive function, we must define the terminating condition i.e the base case. When the terminating condition is satisfied, we will exit the recursive search process. The base cases are as follows,
    - The ```row``` or ```col``` values are not within the matrix boundaries.
    - We have reached the last ```row```. In this case, we will return the value of the current cell and not make any other recursive calls.
  - _Recursively explore all paths_: If the base case is not satisfied, it means that we have not reached the end of our current path, and we must try all options to extend our path and find the one with the minimum sum:
    - minimumPath = Minimum(findMinFallingPathSum(row + 1, col + 1), findMinFallingPathSum(row + 1, col), findMinFallingPathSum(row + 1, col - 1))
2. Now that we have defined the recursive function, we must find the minimum falling path for all possible starting cells. A starting cell is any cell in the top row. For this, we have to iterate using a for loop and find the minimum falling path for cell in $0^{th}$ row and columns ranging from ```0``` to $\text{matrix.length} - 1$. Define a variable ```minFallingSum``` to track the minimum of all the falling paths found so far and return the result.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}({N} \cdot 3^{N})$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        ROWS, COLS = len(matrix), len(matrix[0])

        def dp(row, col):
            # Base case: check if out of the boundaries
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return math.inf
            # Check if reached the last row
            if row == ROWS - 1:
                return matrix[row][col]
            
            left = dp(row + 1, col - 1)
            mid = dp(row + 1, col)
            right = dp(row + 1, col + 1)
            return min(left, mid, right) + matrix[row][col]

        ans = math.inf
        for col in range(COLS):
            ans = min(ans, dp(0, col))
        
        return ans
```

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/minimum-falling-path-sum/solutions/2108185/Figures/931/931_recursion_tree.png)

```Python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        # Top-Down DP (Recursion)
        DIRECTIONS = [(1,-1), (1,0), (1,1)]
        ROWS, COLS = len(matrix), len(matrix[0])

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS):
                return 0
            if not (0 <= col < COLS):
                return float('inf')
            
            curr = float('inf')
            for (dx, dy) in DIRECTIONS:
                # Recurrence relation
                curr = min(curr, dp(row + dx, col + dy) + matrix[row][col])

            return curr


        ans = float('inf')
        for col in range(COLS):
            ans = min(ans, dp(0, col))
        return ans
```

```Python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        # Top-Down DP (Recursion)
        DIRECTIONS = [(1,-1), (1,0), (1,1)]
        ROWS, COLS = len(matrix), len(matrix[0])
        memo = collections.defaultdict(int)

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < ROWS):
                return 0
            if not (0 <= col < COLS):
                return float('inf')

            if (row, col) in memo:
                return memo[(row, col)]
            
            curr = float('inf')
            for (dx, dy) in DIRECTIONS:
                # Recurrence relation
                curr = min(curr, dp(row + dx, col + dy) + matrix[row][col])
                memo[(row, col)] = curr

            return memo[(row, col)]


        ans = float('inf')
        for col in range(COLS):
            ans = min(ans, dp(0, col))
        return ans
```
#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        # Bottom-Up DP (Tabulation)
        ROWS, COLS = len(matrix), len(matrix[0])
        dp = [[0] * (COLS) for _ in range(ROWS)]

        for col in range(COLS):
            dp[0][col] = matrix[0][col]
        
        for row in range(1, ROWS):
            for col in range(COLS):
                curr = dp[row - 1][col]

                # For all the middle columns, get the minimum values from all cells in previous row

                # Check if not at the first column 0
                if col - 1 >= 0:
                    curr = min(curr, dp[row - 1][col - 1])
                # Check if not at the last column (COLS - 1)
                if col + 1 < COLS:
                    curr = min(curr, dp[row - 1][col + 1])

                dp[row][col] = curr + matrix[row][col]

        return min(dp[ROWS - 1])
```

#### Optimized Space Bottom-Up Dynamic Programming (1D Array)

```Python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        ROWS, COLS = len(matrix), len(matrix[0])
        dp = [0 for _ in range(ROWS + 1)]

        for row in range(ROWS - 1, -1, -1):
            current_row = [0 for _ in range(COLS + 1)]
            for col in range(COLS):
                current_row[col] = matrix[row][col]
                # Check if currently at the first column
                if not col:
                    current_row[col] += min(dp[col], dp[col + 1])
                # Check if currently at the last column
                elif col == COLS - 1:
                    current_row[col] += min(dp[col], dp[col - 1])
                # Otherwise, handle all middle columns
                else:
                    current_row[col] += min(dp[col], min(dp[col + 1], dp[col - 1]))
            dp = current_row
        
        ans = float('inf')
        for col in range(COLS):
            ans = min(ans, dp[col])
        return ans
```

```Python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        ROWS, COLS = len(matrix), len(matrix[0])
        matrix = [[math.inf] + x + [math.inf] for x in matrix]
        
        for row in range(ROWS - 2, -1, -1):
            for col in range(1, COLS + 1):
                matrix[row][col] += min(matrix[row + 1][col-1:col+2])

        return min(matrix[0])
```
