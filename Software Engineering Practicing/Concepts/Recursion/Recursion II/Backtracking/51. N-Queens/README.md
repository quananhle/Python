## 51. N-Queens

```Tag```: ```Backtracking```

#### Difficulty: Hard

The n-queens puzzle is the problem of placing ```n``` queens on an ```n x n``` chessboard such that no two queens attack each other.

Given an integer ```n```, return _all distinct solutions to the __n-queens puzzle___. You may return the answer in any order.

Each solution contains a distinct board configuration of the n-queens' placement, where ```'Q'``` and ```'.'``` both indicate a queen and an empty space, respectively.

![image](https://user-images.githubusercontent.com/35042430/217368633-12ca9140-5f1e-4dff-aaee-398906d1add0.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/13/queens.jpg)
```
Input: n = 4
Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
```

__Example 2:__
```
Input: n = 1
Output: [["Q"]]
```

__Constraints:__

- ```1 <= n <= 9```

---

A queen can be attacked if another queen is on the same row, column, diagonal, or anti-diagonal.

![image](https://leetcode.com/problems/n-queens/solutions/1198087/Figures/51/diagonals.png)

![image](https://leetcode.com/problems/n-queens/solutions/1198087/Figures/51/antidiagonals.png)

Every time we place a queen, we should calculate the diagonal and the anti-diagonal value it belongs to. In the same way we use a set to keep track of which columns have been used, we should also have a set to keep track of which diagonals and anti-diagonals have been used. Then, we can add the values for this queen to the corresponding sets.

#### Algorithm

We'll create a recursive function ```backtrack``` that takes a few arguments to maintain the board state. The first parameter is the row we're going to place a queen on next, and then we will have 3 sets that track which columns, diagonals, and anti-diagonals have already had queens placed on them. Additionally, we will store the actual board so that when we find a valid solution, we can include it in our answer. The function will work as follows:

1. If the current row we are considering is equal to ```n```, then we have a solution. Add the current board state to a list of solutions, and return. We'll make use of a small helper function to get our board into the correct output format.

2. Iterate through the columns of the current row. At each column, we will attempt to place a queen at the square ```(row, col)``` - remember we are considering the current row through the function arguments.

  - Calculate the diagonal and anti-diagonal that the square belongs to. If a queen has not been placed in the column, diagonal, or anti-diagonal, then we can place a queen in this column, in the current ```row```.
  - If we can't place the queen, skip this column (move on and try the next column).

3. If we were able to place a queen, then add the queen to the board and update our 3 sets ```(cols, diagonals, and antiDiagonals)```, and call the function again, but with ```row + 1```.

4. The function call made in step 3 explores all valid board states with the queen we placed in step 2. Since we're done exploring that path, backtrack by removing the queen from the square - this includes removing the values we added to our sets on top of removing the ```"Q"``` from the board.

```Python
class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        res = list()
        empty_board = [["."] * n for _ in range(n)]

        def create_board(state):
            board = list()
            for row in state:
                board.append("".join(row))
            return board
        
        def backtrack(row, diagonals, anti_diagonals, cols, state):
            # Base case, all queens have been placed correctly
            if row == n:
                res.append(create_board(state))
                '''
                res.append(["".join(row) for row in board])
                '''
                return
            
            for col in range(n):
                curr_diagonal = row - col
                curr_anti_diagonal = row + col
                # Check if the current cell is placeable by checking col, diagonal, and anti diagonal
                if col in cols or curr_diagonal in diagonals or curr_anti_diagonal in anti_diagonals:
                    continue
                # Otherwise, the current cell is a candidate to place the queen
                cols.add(col)
                diagonals.add(curr_diagonal)
                anti_diagonals.add(curr_anti_diagonal)
                # Mark the cell
                state[row][col] = "Q"

                # Move on to the next row with updated board state
                backtrack(row + 1, diagonals, anti_diagonals, cols, state)
                
                # Backtrack after completing exploring all the possible path from current cell
                cols.remove(col)
                diagonals.remove(curr_diagonal)
                anti_diagonals.remove(curr_anti_diagonal)
                # Remove the queen
                state[row][col] = "."

        backtrack(0, set(), set(), set(), empty_board)
        
        return res
```
