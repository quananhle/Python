## Spiral Matrix

54. [Spiral Matrix](https://github.com/quananhle/Python/tree/743e30df8d2f1ae04539d77f6c22080a9370c828/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2001%20-%20Implementation%20%7C%20Simulation/54.%20Spiral%20Matrix)

Given an ```m x n``` matrix, return _all elements of the ```matrix``` in spiral order_.

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        ROWS, COLS = len(matrix), len(matrix[0])
        res = list()

        def dfs(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS and  matrix[row][col] != "#"):
                return
            res.append(matrix[row][col])
            matrix[row][col] = "#"  

            # Only traversing right while at possible top cell
            if row <= col + 1:
                # Traverse rightward
                dfs(row, col + 1)
                
            # Traverse downward
            dfs(row + 1, col)
            # Traverse leftward
            dfs(row, col - 1)
            # Traverse upward
            dfs(row - 1, col)

        dfs(0, 0)
        return res
```

[59. Spiral Matrix II](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/59.%20Spiral%20Matrix%20II)

Given a positive integer ```n```, generate an ```n x n``` matrix filled with elements from ```1``` to ```n```<sup>```2```</sup> in spiral order.

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
