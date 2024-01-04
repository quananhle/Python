## [36. Valid Sudoku](https://leetcode.com/problems/valid-sudoku)

```Tag```: ```Array & String``` ```Hash Set``` ```Bitwise Manipulation```

#### Difficulty: Medium

Determine if a ```9 x 9``` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

- Each row must contain the digits ```1-9``` without repetition.
- Each column must contain the digits ```1-9``` without repetition.
- Each of the nine ```3 x 3``` sub-boxes of the grid must contain the digits ```1-9``` without repetition.

__Note__:

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

![image](https://github.com/quananhle/Python/assets/35042430/c4e01be1-1e04-479f-9191-576db90fab2d)

---

__Example 1:__

![image](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)
```
Input: board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: true
```

__Example 2:__
```
Input: board = 
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
```

__Constraints:__

- $board.length == 9$
- $board[i].length == 9$
- ```board[i][j]``` is a digit ```1-9``` or ```'.'```.


---

The index of the current box is ```(curr_row / 3) * 3 + (curr_col / 3)``` where ```/``` represents floor division

### Hash Set

```Python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        N = 9
        ROWS, COLS = len(board), len(board[0])

        row_set = [set() for _ in range(N)]
        col_set = [set() for _ in range(N)]
        box_set = [set() for _ in range(N)]

        for row in range(ROWS):
            for col in range(COLS):
                val = board[row][col]
                if val == '.':
                    continue
                
                if val in row_set[row]:
                    return False
                row_set[row].add(val)

                if val in col_set[col]:
                    return False
                col_set[col].add(val)

                # Group cells in a board into 3*3 sub-board: (row / 3) * 3 + (col / 3)
                box = (row // 3) * 3 + (col // 3)
                if val in box_set[box]:
                    return False
                box_set[box].add(val)
                
        return True
```

### Array & String

```Python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        N = 9
        ROWS, COLS = len(board), len(board[0])

        row_set = [[None] * N for _ in range(N)]
        col_set = [[None] * N for _ in range(N)]
        box_set = [[None] * N for _ in range(N)]

        for row in range(ROWS):
            for col in range(COLS):
                val = board[row][col]
                if val == '.':
                    continue
                pos = int(val) - 1

                if row_set[row][pos]:
                    return False
                row_set[row][pos] = val

                if col_set[col][pos]:
                    return False
                col_set[col][pos] = val

                # Group cells in a board into 3*3 sub-board: (row / 3) * 3 + (col / 3)
                box = (row // 3) * 3 + (col // 3)
                if box_set[box][pos]:
                    return False
                box_set[box][pos] = val

        return True
```

### Bitmasking

```Python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        N = 9
        ROWS, COLS = len(board), len(board[0])

        row_set = [0] * N
        col_set = [0] * N
        box_set = [0] * N

        for row in range(ROWS):
            for col in range(COLS):
                val = board[row][col]
                if val == '.':
                    continue
                pos = int(val) - 1

                if row_set[row] & (1 << pos):
                    return False
                row_set[row] = row_set[row] | (1 << pos)

                if col_set[col] & (1 << pos):
                    return False
                col_set[col] = col_set[col] | (1 << pos)

                # Group cells in a board into 3*3 sub-board: (row / 3) * 3 + (col / 3)
                box = (row // 3) * 3 + (col // 3)
                if box_set[box] & (1 << pos):
                    return False
                box_set[box] = box_set[box] | (1 << pos)

        return True
```

---




