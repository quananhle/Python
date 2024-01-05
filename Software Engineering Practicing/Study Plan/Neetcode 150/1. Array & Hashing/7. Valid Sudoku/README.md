## [36. Valid Sudoku](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Hash%20Table/Hash%20Set/36.%20Valid%20Sudoku)

```Python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        ROWS, COLS = len(board), len(board[0])

        def check_row():
            for row in board:
                row_set = set()
                for cell in row:
                    if cell == '.':
                        continue
                    if cell in row_set:
                        return False
                    row_set.add(cell)
            return True

        def check_col():
            for col in zip(*board):
                col_set = set()
                for cell in col:
                    if cell == '.':
                        continue
                    if cell in col_set:
                        return False
                    col_set.add(cell)
            return True

        def check_box():
            box_size = 3
            
            for row in range(0, ROWS, 3):
                for col in range(0, COLS, 3):
                    box_set = set()
                    box = [board[row + dx][col + dy] for dx in range(box_size) for dy in range(box_size)]
                    for cell in box:
                        if cell == '.':
                            continue
                        if cell in box_set:
                            return False
                        box_set.add(cell)
            
            return True

        return check_row() and check_col() and check_box()
```
