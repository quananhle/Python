## [59. Spiral Matrix II](https://leetcode.com/problems/spiral-matrix-ii/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Matrix```

#### Difficulty: Medium

Given a positive integer ```n```, generate an ```n x n``` matrix filled with elements from ```1``` to ```n```<sup>2</sup> in spiral order.

![image](https://github.com/quananhle/Python/assets/35042430/a6861dba-98ef-481f-a4b3-2403383aa526)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2020/11/13/spiraln.jpg)
```
Input: n = 3
Output: [[1,2,3],[8,9,4],[7,6,5]]
```

__Example 2:__
```
Input: n = 1
Output: [[1]]
```

__Constraints:__

- ```1 <= n <= 20```

---

### Depth-First Search

```Python
class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        matrix = [[None] * n for _ in range(n)]
        ROWS, COLS = n, n

        def dfs(row, col, curr):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS and not matrix[row][col]):
                return

            matrix[row][col] = curr

            # Ensure to traverse rightward whenever possible
            if row <= col + 1:
                dfs(row, col + 1, curr + 1)
            
            # Traverse downward
            dfs(row + 1, col, curr + 1)
            # Traverse leftward
            dfs(row, col - 1, curr + 1)
            # Traverse upward
            dfs(row - 1, col, curr + 1)
        
        dfs(0, 0, 1)

        return matrix
```

### Breadth-First Search

```Python
class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        matrix = [[0] * n for _ in range(n)]
        # Leftward, Downward, Rightward, Upward
        directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        row, col, dir, val = 0, 0, 0, 1

        for _ in range(n * n):
            matrix[row][col] = val
            val += 1
            dx, dy = directions[dir]
            next_row, next_col = row + dx, col + dy

            if (next_row < 0 or next_row >= n or next_col < 0 or next_col >= n or matrix[next_row][next_col] != 0):
                dir = (dir + 1) % 4
                dx, dy = directions[dir]
                next_row, next_col = row + dx, col + dy

            row, col = next_row, next_col

        return matrix
```

### Matrix

```Python
class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        matrix = [[0] * n for _ in range(n)]  # Initialize the matrix with zeros
        num = 1  # Starting number
        
        # Define boundaries
        top = 0
        bottom = n - 1
        left = 0
        right = n - 1
        
        while top <= bottom and left <= right:
            # Traverse from left to right
            for col in range(left, right + 1):
                matrix[top][col] = num
                num += 1
            top += 1
            
            # Traverse from top to bottom
            for row in range(top, bottom + 1):
                matrix[row][right] = num
                num += 1
            right -= 1
            
            # Traverse from right to left
            if top <= bottom:
                for col in range(right, left - 1, -1):
                    matrix[bottom][col] = num
                    num += 1
                bottom -= 1
            
            # Traverse from bottom to top
            if left <= right:
                for row in range(bottom, top - 1, -1):
                    matrix[row][left] = num
                    num += 1
                left += 1
        
        return matrix
```


