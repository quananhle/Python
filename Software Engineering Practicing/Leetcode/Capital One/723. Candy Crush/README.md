## [723. Candy Crush](https://leetcode.com/problems/candy-crush/)

```Tag```: 

#### Difficulty: Medium

This question is about implementing a basic elimination algorithm for Candy Crush.

Given an ```m x n``` integer array ```board``` representing the grid of candy where ```board[i][j]``` represents the type of candy. A value of ```board[i][j] == 0``` represents that the cell is empty.

The given board represents the state of the game following the player's move. Now, you need to restore the board to a stable state by crushing candies according to the following rules:

- If three or more candies of the same type are adjacent vertically or horizontally, crush them all at the same time - these positions become empty.
- After crushing all candies simultaneously, if an empty space on the board has candies on top of itself, then these candies will drop until they hit a candy or bottom at the same time. No new candies will drop outside the top boundary.
-   After the above steps, there may exist more candies that can be crushed. If so, you need to repeat the above steps.
- If there does not exist more candies that can be crushed (i.e., the board is stable), then return the current board.

You need to perform the above rules until the board becomes stable, then return the stable board.

![image](https://github.com/quananhle/Python/assets/35042430/b20eefe6-6329-4267-9cb2-8380eba796eb)

---

__Example 1:__

```
Input: board = [[110,5,112,113,114],[210,211,5,213,214],[310,311,3,313,314],[410,411,412,5,414],[5,1,512,3,3],[610,4,1,613,614],[710,1,2,713,714],[810,1,2,1,1],[1,1,2,2,2],[4,1,4,4,1014]]
Output: [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[110,0,0,0,114],[210,0,0,0,214],[310,0,0,113,314],[410,0,0,213,414],[610,211,112,313,614],[710,311,412,613,714],[810,411,512,713,1014]]
```

__Example 2:__
```
Input: board = [[1,3,5,5,2],[3,4,3,3,1],[3,2,4,5,2],[2,4,4,5,5],[1,4,4,1,1]]
Output: [[1,3,0,0,0],[3,4,0,5,2],[3,2,0,3,1],[2,4,0,5,2],[1,4,3,1,1]]
```

__Constraints:__

- $m == board.length$
- $n == board[i].length$
- $3 \le m, n \le 50$
- $1 \le board[i][j] \le 2000$

---

### Find, Crush, Drop

![image](https://leetcode.com/problems/candy-crush/Figures/723/1.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/2.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/3.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/4.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/5.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/6.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/7.png)

![image](https://leetcode.com/problems/candy-crush/Figures/723/8.png)

__Algorithm__

1. Define ```find()``` to find all crushable candies:

- Initialize an empty set ```crushed```.
- Iterate over each candy ```(row, col)```:
    - If ```board[row][col] = 0```, continue.
    - If ```board[row][col] = board[row + 1][col] = board[row - 1][col]```, add ```(row, col)```, ```(row + 1, col)``` and ```(row - 1, col)``` to the set. If ```board[row][col] = board[row][col + 1] = board[row][col - 1]```, add ```(row, col)```, ```(row, col + 1)``` and (row, col - 1)``` to the set.
    - Return ```crushed``` set.

2. Define ```crush(crushed_set)``` to mark all crushable candies:

Iterate over every candy (r, c) in crushed_set and set board[r][c] = 0.
Define drop() to rearrange the candies' new positions based on the rules:

Iterate over each column c.
For each column, set lowest_zero as -1 since there is no lowest zero yet.
Iterate candies (r, c) from bottom to top, for each candy board[r][c]. If board[r][c] is zero, update lowest_zero as lowest_zero = max(lowest_zero, r). If board[r][c] is non-zero and lowest_zero is not -1, then we swap board[r][c] with board[lowest_zero][c] and decrement lowest_zero by 1.
While find() returns an non-empty set crushed_set:

Perform crush(crushed_set).
Perform drop().
Return board when the while loop is complete.

```Python
class Solution:
    def candyCrush(self, board: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(board), len(board[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        def find():
            # Check vertically adjacent cells
            for row in range(1, ROWS - 1):
                for col in range(COLS):
                    if board[row][col] == 0:
                        continue
                    if board[row][col] == board[row - 1][col] == board[row + 1][col]:
                        crushed.add((row, col))
                        crushed.add((row - 1, col))
                        crushed.add((row + 1, col))
            # Check hozirontally adjacent cells
            for row in range(ROWS):
                for col in range(1, COLS - 1):
                    if board[row][col] == 0:
                        continue
                    if board[row][col] == board[row][col - 1] == board[row][col + 1]:
                        crushed.add((row, col))
                        crushed.add((row, col - 1))
                        crushed.add((row, col + 1))
            
            return crushed
        
        def crush():
            for (row, col) in crushed:
                board[row][col] = 0
        
        def drop():
            for col in range(COLS):
                lowest_empty = -1

                for row in range(ROWS - 1, -1, -1):
                    # Locate the lowest empty spaces or crushed cells
                    if board[row][col] == 0:
                        lowest_empty = max(lowest_empty, row)
                    # Swap current non-zero cell with the lowest empty space
                    elif lowest_empty >= 0:
                        board[row][col], board[lowest_empty][col] = board[lowest_empty][col], board[row][col]
                        lowest_empty -= 1
        
        # Continue to find -> crush -> drop until no more possible candidate to crush
        candidates = find()
        while candidates:
            crushed = set()
            crush()
            drop()
            candidates = find()

        return board
```
