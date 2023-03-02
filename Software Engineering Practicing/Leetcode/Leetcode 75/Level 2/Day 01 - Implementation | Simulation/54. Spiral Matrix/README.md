## [54. Spiral Matrix](https://leetcode.com/problems/spiral-matrix/)

```Tag```: ```Matrix``` ```Depth-First Search``` ```Breadth-First Search``` ```Recursion``` ```Stack & Queue```

#### Difficulty: Medium

Given an ```m x n``` matrix, return _all elements of the ```matrix``` in spiral order_.

![image](https://user-images.githubusercontent.com/35042430/222346111-bdfc6bab-e63b-43d5-8f11-5b20b73cb052.png)

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

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= m, n <= 10```
- ```-100 <= matrix[i][j] <= 100```

---

### Recursive Depth-First Search

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Depth-First Search
        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        res = list()

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
        
        dfs(0, 0, False)
        return res
```
