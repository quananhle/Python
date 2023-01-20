## 36. Valid Sudoku

```Tag```: ```Hash Set```

#### Difficulty: Medium

Determine if a ```9 x 9``` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

- Each row must contain the digits ```1-9``` without repetition.
- Each column must contain the digits ```1-9``` without repetition.
- Each of the nine ```3 x 3``` sub-boxes of the grid must contain the digits ```1-9``` without repetition.

__Note__:

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

![image](https://user-images.githubusercontent.com/35042430/213787919-1975b293-c89b-4393-af07-511c9e5c8a18.png)

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
```
board.length == 9
board[i].length == 9
board[i][j] is a digit 1-9 or '.'.
```

---

### Hash Set

```Python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        N = 9
        ROWS, COLS = len(board), len(board[0])
        # Hash Set
        row_set = [set() for _ in range(N)]
        col_set = [set() for _ in range(N)]
        box_set = [set() for _ in range(N)]

        for row in range(ROWS):
            for col in range(COLS):
                val = board[row][col]
                # Check if val is empty
                if val == ".":
                    continue
                # Check row
                if val in row_set[row]:
                    return False
                row_set[row].add(val)          
                 # Check col
                if val in col_set[col]:
                    return False
                col_set[col].add(val)
                # Check boxes
                idx = (row // 3) * 3 + (col // 3)
                if val in box_set[idx]:
                    return False
                box_set[idx].add(val)
        return True
```


