## [867. Transpose Matrix](https://leetcode.com/problems/transpose-matrix)

```Tag```: ```Matrix```

#### Difficulty: Easy

Given a 2D integer array ```matrix```, return _the transpose of ```matrix```_.

The transpose of a matrix is the matrix flipped over its main diagonal, switching the matrix's row and column indices.

![image](https://assets.leetcode.com/uploads/2021/02/10/hint_transpose.png)

![image](https://github.com/quananhle/Python/assets/35042430/70b51bce-616f-4cef-9b5b-ec913636ce3d)

---

__Example 1:__
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[1,4,7],[2,5,8],[3,6,9]]
```

__Example 2:__
```
Input: matrix = [[1,2,3],[4,5,6]]
Output: [[1,4],[2,5],[3,6]]
```

__Constraints:__

- ```m == matrix.length```
- ```n == matrix[i].length```
- $1 \le m, n \le 1000$
- $1 \le m * n \le 10^5$
- $-10^9 \le matrix[i][j] \le 10^9$

---

### Matrix

```Python
class Solution:
    def transpose(self, matrix: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(matrix), len(matrix[0])
        res = [[0] * ROWS for _ in range(COLS)]

        for row in range(ROWS):
            for col in range(COLS):
                res[col][row] = matrix[row][col]

        return res
```
