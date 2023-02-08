## 37. Sudoku Solver

```Tag```: ```Backtracking```

#### Difficulty: Hard

Write a program to solve a Sudoku puzzle by filling the empty cells.

A sudoku solution must satisfy __all of the following rules__:

- Each of the digits ```1-9``` must occur exactly once in each row.
- Each of the digits ```1-9``` must occur exactly once in each column.
- Each of the digits ```1-9``` must occur exactly once in each of the 9 ```3x3``` sub-boxes of the grid.

The ```'.'``` character indicates empty cells.

![image](https://user-images.githubusercontent.com/35042430/217388710-99305cf4-42bf-493f-ab04-a21c4f649f30.png)

---

Example 1:

![image](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)
```
Input: board = [["5","3",".",".","7",".",".",".","."],
                ["6",".",".","1","9","5",".",".","."],
                [".","9","8",".",".",".",".","6","."],
                ["8",".",".",".","6",".",".",".","3"],
                ["4",".",".","8",".","3",".",".","1"],
                ["7",".",".",".","2",".",".",".","6"],
                [".","6",".",".",".",".","2","8","."],
                [".",".",".","4","1","9",".",".","5"],
                [".",".",".",".","8",".",".","7","9"]]
                
       Output: [["5","3","4","6","7","8","9","1","2"],
                ["6","7","2","1","9","5","3","4","8"],
                ["1","9","8","3","4","2","5","6","7"],
                ["8","5","9","7","6","1","4","2","3"],
                ["4","2","6","8","5","3","7","9","1"],
                ["7","1","3","9","2","4","8","5","6"],
                ["9","6","1","5","3","7","2","8","4"],
                ["2","8","7","4","1","9","6","3","5"],
                ["3","4","5","2","8","6","1","7","9"]]
Explanation: The input board is shown above and the only valid solution is shown below:
```
![image](https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

__Constraints__:

- ```board.length == 9```
- ```board[i].length == 9```
- ```board[i][j] is a digit or '.'.```
- It is __guaranteed__ that the input board has only one solution.

---

### Backtracking

There are two programming conceptions here which could help.

    The first one is called constrained programming.

That basically means to put restrictions after each number placement. One puts a number on the board and that immediately excludes this number from further usage in the current row, column and sub-box. That propagates constraints and helps to reduce the number of combinations to consider.

![image](https://leetcode.com/problems/sudoku-solver/solutions/259057/Figures/37/37_const3.png)

    The second one called backtracking.

Let's imagine that one has already managed to put several numbers on the board. But the combination chosen is not the optimal one and there is no way to place the further numbers. What to do? To backtrack. That means to come back, to change the previously placed number and try to proceed again. If that would not work either, backtrack again.

![image](https://leetcode.com/problems/sudoku-solver/solutions/259057/Figures/37/37_backtrack2.png)

One tip to enumerate sub-boxes: let's use ```box_index = (row / 3) * 3 + column / 3``` where ```/``` is an integer division.

![image](https://leetcode.com/problems/sudoku-solver/solutions/259057/Figures/36/36_boxes_2.png)

```Python
class Solution:
    def solveSudoku(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        ROWS, COLS = len(board), len(board[0])
        BOXES = ROWS // 3 * COLS // 3

        rows = [collections.defaultdict(int) for _ in range(ROWS)]
        cols = [collections.defaultdict(int) for _ in range(COLS)]
        boxes = [collections.defaultdict(int) for _ in range(BOXES)]

        self.solved = False


        def get_box_index(row, col):
            # Enumerate sub-boxes
            return row // 3 * 3 + col // 3 


        def could_fill(num, r, c):
            # Return true if number could be place in the cell board[row][col], and false otherwise
            return not (num in rows[r] or num in cols[c] or num in boxes[get_box_index(r,c)])


        def fill_number(num, r, c):
            # Update the caches of rows, cols, and sub-boxes
            rows[r][num] += 1
            cols[c][num] += 1
            boxes[get_box_index(r,c)][num] += 1
            # Fill number into cell
            board[r][c] = str(num)


        # Fill every cell which has only a number to fill and no backtracking needed
        def easy_fill(row, col):
            count = list()
            for num in range(1, 10):
                if could_fill(num, row, col):
                    count.append(num)
            if len(count) == 1:
                fill_number(count[-1], row, col)
                return True
            return False


        # Scan the board to find any cell that clearly has only 1 number to fill
        def quick_scan():
            while True:
                flag = False
                for row in range(ROWS):
                    for col in range(COLS):
                        if board[row][col] == "." and easy_fill(row, col):
                            flag = True
                if not flag:
                    break
        

        def backtracking(num, r, c):
            # Remove the record of the number num in caches rows, cols, and sub-boxes
            del rows[r][num]
            del cols[c][num]
            del boxes[get_box_index(r,c)][num]
            # Remove number from cell
            board[r][c] = "."
        

        def backtrack(row, col):
            if board[row][col] == ".":
                for num in range(1, 10):
                    if could_fill(num, row, col):
                        fill_number(num, row, col)
                        check_next_candidates(row, col)
                        # Backtracking
                        if not self.solved:
                            backtracking(num, row, col)
            else:
                check_next_candidates(row, col)


            
        def check_next_candidates(row, col):
            # Base cases
            # Check if at the last cell
            if row == ROWS - 1 and col == COLS - 1:
                self.solved = True
            else:
                # Check if at the end of the row, move to next row and first column
                if col == COLS - 1:
                    backtrack(row + 1, 0)
                # Otherwise, move to the next column in the same row
                else:
                    backtrack(row, col + 1)


        for row in range(ROWS):
            for col in range(COLS):
                if board[row][col] != ".":
                    num = int(board[row][col])
                    fill_number(num, row, col)


        quick_scan()
        backtrack(0, 0)
```

```Python
class Solution:
    def solveSudoku(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        ROWS, COLS = len(board), len(board[0])

        rows, cols, boxes = collections.defaultdict(set), collections.defaultdict(set), collections.defaultdict(set)

        for row in range(ROWS):
            for col in range(COLS):
                if board[row][col] != ".":
                    rows[row].add(int(board[row][col]))
                    cols[col].add(int(board[row][col]))
                    boxes[(row//3, col//3)].add(int(board[row][col]))

        def backtrack(row, col):
            # Check if at the last cell
            if row == ROWS - 1 and col == COLS:
                return True
            
            # Check if already at the last column, move down to the next row and first column
            if col == COLS:
                row += 1
                col = 0
            
            if board[row][col] != ".":
                return backtrack(row, col + 1)

            for num in range(1, 10):
                if num in rows[row] or num in cols[col] or num in boxes[(row//3, col//3)]:
                    continue
                
                # Fill the cell and add to the caches of rows, columns, and sub-boxes
                rows[row].add(num)
                cols[col].add(num)
                boxes[(row//3, col//3)].add(num)
                board[row][col] = str(num)


                if backtrack(row, col + 1):
                    return True
                
                # Backtracking
                rows[row].remove(num)
                cols[col].remove(num)
                boxes[(row//3, col//3)].remove(num)
                board[row][col] = "."

            return False


        backtrack(0, 0)
```
