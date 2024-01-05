## [36. Valid Sudoku](https://leetcode.com/problems/valid-sudoku)

#### Difficulty: Medium

Determine if a ```9 x 9``` Sudoku board is valid. Only the filled cells need to be validated __according to the following rules__:

1. Each row must contain the digits ```1-9``` __without repetition__.
2. Each column must contain the digits ```1-9``` __without repetition__.
3. Each of the nine ```3 x 3``` __sub-boxes__ of the grid must contain the digits ```1-9``` __without repetition__.

__Note:__

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.

![image](https://user-images.githubusercontent.com/35042430/203643459-8548d2f2-384f-4894-9834-142148985e22.png)

![image](https://github.com/quananhle/Python/assets/35042430/99358afc-0bd7-49a5-8abf-ea7e0e176a88)

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

### Brute Force

```Python
"""
[["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

[["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

[[".",".","4",".",".",".","6","3","."],[".",".",".",".",".",".",".",".","."],["5",".",".",".",".",".",".","9","."],[".",".",".","5","6",".",".",".","."],["4",".","3",".",".",".",".",".","1"],[".",".",".","7",".",".",".",".","."],[".",".",".","5",".",".",".",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".",".","."]]
"""

class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        # Brute Force
        #### Time complexity: O(1), size of board is constant 9 x 9
        #### Space complexity: O(1), size of board is constant 9 x 9
        # Check if there is a duplicate number in list
        def check_duplicate(l):
            # Time complexity: O(1)
            # Space complexity: O(1)
            ans = ''.join(l).replace(".","")
            return len(ans) == len(set(ans))
        
        # Check each row in board
        def check_row():
            # Time complexity: O(1)
            # Space complexity: O(1)
            for row in board:
                if not check_duplicate(row):
                    return False
            return True
        
        # Check each column in board
        def check_column():
            # Time complexity: O(1)
            # Space complexity: O(1)        
            for col in zip(*board):
                if not check_duplicate(col):
                    return False
            return True
        
        def check_box():
            """
            # To get each sub-box, first get the top-left indices of each sub-box,
            # then go 3 steps on each row and 3 steps on each col to construct the box.    
            """
            # Time complexity: O(1)
            # Space complexity: O(1)
            sub_size = 3
            for r in range(0, len(board), 3):
                for c in range(0, len(board), 3):
                    box = [board[r+dr][c+dc] for dr in range(sub_size) for dc in range(sub_size)]
                    if not check_duplicate(box):
                        return False
            return True
        
        return check_row() and check_column() and check_box()
```

### List

```Python
class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        # List
        #### Time complexity: O(1), size of board is constant 9 x 9
        #### Space complexity: O(1), size of board is constant 9 x 9
        rows = [[0] * len(board) for _ in range(len(board))]
        cols = [[0] * len(board[0]) for _ in range(len(board[0]))]
        boxes = [[0] * 9 for _ in range(9)]
        for row in range(len(board)):
            for col in range(len(board[0])):
                val = board[row][col]
                if val != ".":
                    # Check the row
                    if val in rows[row]:
                        return False
                    else:
                        rows[row].append(val)
                    # Check the column
                    if val in cols[col]:
                        return False
                    else:
                        cols[col].append(val)
                    # Check the boxes
                    idx = row // 3 * 3 + col // 3
                    if val in boxes[idx]:
                        return False
                    else:
                        boxes[idx].append(val)
        return True
```

### Hash Set

```Python
class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        # Hash Set
        #### Time complexity: O(1), size of board is constant 9 x 9
        #### Space complexity: O(1), size of board is constant 9 x 9
        rows = defaultdict(set)
        cols = defaultdict(set)
        boxes = defaultdict(set)

        for row in range(len(board)):
            for col in range(len(board[0])):
                val = board[row][col]
                if val != ".":
                    # Check the row
                    if val in rows[row]:
                        return False
                    else:
                        rows[row].add(val)
                    # Check the column
                    if val in cols[col]:
                        return False
                    else:
                        cols[col].add(val)
                    # Check the box
                    index = row // 3 * 3 + col // 3
                    if val in boxes[index]:
                        return False
                    else:
                        boxes[index].add(val)
        return True        
```
