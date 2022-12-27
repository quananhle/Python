## 54. Spiral Matrix

```Tag```:

#### Difficulty: Medium

Given an ```m x n``` matrix, return _all elements of the ```matrix``` in spiral order_.

![image](https://user-images.githubusercontent.com/35042430/209489352-7ccb0e0c-7071-4883-99ca-b5c9bae6ce06.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/13/spiral1.jpg)
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,3,6,9,8,7,4,5]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/13/spiral.jpg)
```
Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
```

__Constraints:__

```
m == matrix.length
n == matrix[i].length
1 <= m, n <= 10
-100 <= matrix[i][j] <= 100
```

---

### Set Up Boundaries

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Boundaries
        res = list()
        ROWS, COLS = len(matrix), len(matrix[0])
        left, right, top, bottom = 0, len(matrix[0]) - 1, 0, len(matrix) - 1

        while len(res) < ROWS * COLS:
            # If reached left boundary and top boundary, traverse rightward
            for col in range(left, right + 1):
                res.append(matrix[top][col])
            
            # If reached right boundary and top boundary, traverse downward
            for row in range(top + 1, bottom + 1):
                res.append(matrix[row][right])

            # Make sure moved to the different row
            if top != bottom:
                # If reached right boundary and bottom boundary, traverse backward to leftward
                for col in range(right - 1, left - 1, -1):
                    res.append(matrix[bottom][col])

            # Make sure moved to the different row
            if left != right:
                # If reached left boundary and bottom boundary, traverse upward
                for row in range(bottom - 1, top, -1):
                    res.append(matrix[row][left])
            
            # Update the boundaries
            left += 1
            right -= 1
            top += 1
            bottom -= 1

        return res
```

### Depth-First Search

Must make sure dfs to go all the way up before checking other cells

![image](https://user-images.githubusercontent.com/35042430/209625162-71312a0c-a0c9-421d-b5c0-e53152ba89c5.png)
        
```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Depth-First Search
        ROWS, COLS = len(matrix), len(matrix[0])
        res = list()
        visited = set()

        left, right, up, down = False, False, False, False

        def dfs(row, col, dir):
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                return
            visited.add((row, col))
            res.append(matrix[row][col])
            # Make sure to go all the way up until visited row reached
            if dir:
                up = True
                dfs(row - 1, col, up)
            # Traverse rightward
            dfs(row, col + 1, right)
            # Traverse downward
            dfs(row + 1, col, down)
            # Traverse leftward
            dfs(row, col - 1, left)
            # Traverse upward
            dfs(row - 1, col, not down)

        dfs(0, 0, right)
        return res
```
