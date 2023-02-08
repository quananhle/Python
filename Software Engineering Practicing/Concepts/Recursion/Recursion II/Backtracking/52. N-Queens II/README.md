## 52. N-Queens II

```Tag```: ```Backtracking```

#### Difficulty: Hard

The __n-queens__ puzzle is the problem of placing ```n``` queens on an ```n x n``` chessboard such that no two queens attack each other.

Given an integer ```n```, return _the number of distinct solutions to the __n-queens puzzle___.

![image](https://user-images.githubusercontent.com/35042430/217379318-fe1bf23e-e07b-44a3-88fd-e19e1285614a.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2020/11/13/queens.jpg)
```
Input: n = 4
Output: 2
Explanation: There are two distinct solutions to the 4-queens puzzle as shown.
```

__Example 2:__
```
Input: n = 1
Output: 1
```

__Constraints:__

- ```1 <= n <= 9```

---

### Backtracking

A queen can be attacked if another queen is on the same row, column, diagonal, or anti-diagonal.

![image](https://leetcode.com/problems/n-queens/solutions/1198087/Figures/51/diagonals.png)

![image](https://leetcode.com/problems/n-queens/solutions/1198087/Figures/51/antidiagonals.png)

Every time we place a queen, we should calculate the diagonal and the anti-diagonal value it belongs to. In the same way we use a set to keep track of which columns have been used, we should also have a set to keep track of which diagonals and anti-diagonals have been used. Then, we can add the values for this queen to the corresponding sets.

```Python
class Solution:
    def totalNQueens(self, n: int) -> int:

        self.ans = 0

        def backtrack(row, diagonals, anti_diagonals, columns):
            if row == n:
                self.ans += 1
                return 1

            ans = 0

            for col in range(n):
                # Move diagonally left - right
                curr_diagonal = row - col
                # Move anti-diagonally right - left
                curr_anti_diagonal = row + col

                # Check if the current cell is in the path of another queen in column or diagonal or anti-diagonal
                if col in columns or curr_diagonal in diagonals or curr_anti_diagonal in anti_diagonals:
                    # The cell is not placeable
                    continue

                # Otherwise, place the queen on the cell and add its paths to the set
                columns.add(col)
                diagonals.add(curr_diagonal)
                anti_diagonals.add(curr_anti_diagonal)

                # Move on to the next row with the current board state
                ans += backtrack(row + 1, diagonals, anti_diagonals, columns)

                # After exploring all valid paths, backtracking and remove the queen
                columns.remove(col)
                diagonals.remove(curr_diagonal)
                anti_diagonals.remove(curr_anti_diagonal)
            
            return ans

        backtrack(0, set(), set(), set())

        return self.ans
```

