## [59. Spiral Matrix II](https://leetcode.com/problems/spiral-matrix-ii/)

```Tag```: ```Depth-First Search```

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
