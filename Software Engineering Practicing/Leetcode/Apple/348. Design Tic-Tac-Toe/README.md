## [348. Design Tic-Tac-Toe](https://leetcode.com/problems/design-tic-tac-toe/)

```Tag```: ```Design```

#### Difficulty: Medium

Assume the following rules are for the tic-tac-toe game on an ```n x n``` board between two players:

A move is guaranteed to be valid and is placed on an empty block.
Once a winning condition is reached, no more moves are allowed.
A player who succeeds in placing n of their marks in a horizontal, vertical, or diagonal row wins the game.
Implement the ```TicTacToe``` class:

- ```TicTacToe(int n)``` Initializes the object the size of the board ```n```.
- ```int move(int row, int col, int player)``` Indicates that the player with id ```player``` plays at the cell ```(row, col)``` of the board. The move is guaranteed to be a valid move, and the two players alternate in making moves. Return
  - ```0``` if there is __no winner__ after the move,
  - ```1``` if __player 1__ is the winner after the move, or
  - ```2``` if __player 2__ is the winner after the move.

![image](https://github.com/quananhle/Python/assets/35042430/bc1eb686-1380-4d33-a768-1c07438f23ea)

---

__Example 1:__
```
Input
["TicTacToe", "move", "move", "move", "move", "move", "move", "move"]
[[3], [0, 0, 1], [0, 2, 2], [2, 2, 1], [1, 1, 2], [2, 0, 1], [1, 0, 2], [2, 1, 1]]
Output
[null, 0, 0, 0, 0, 0, 0, 1]

Explanation
TicTacToe ticTacToe = new TicTacToe(3);
Assume that player 1 is "X" and player 2 is "O" in the board.
ticTacToe.move(0, 0, 1); // return 0 (no one wins)
|X| | |
| | | |    // Player 1 makes a move at (0, 0).
| | | |

ticTacToe.move(0, 2, 2); // return 0 (no one wins)
|X| |O|
| | | |    // Player 2 makes a move at (0, 2).
| | | |

ticTacToe.move(2, 2, 1); // return 0 (no one wins)
|X| |O|
| | | |    // Player 1 makes a move at (2, 2).
| | |X|

ticTacToe.move(1, 1, 2); // return 0 (no one wins)
|X| |O|
| |O| |    // Player 2 makes a move at (1, 1).
| | |X|

ticTacToe.move(2, 0, 1); // return 0 (no one wins)
|X| |O|
| |O| |    // Player 1 makes a move at (2, 0).
|X| |X|

ticTacToe.move(1, 0, 2); // return 0 (no one wins)
|X| |O|
|O|O| |    // Player 2 makes a move at (1, 0).
|X| |X|

ticTacToe.move(2, 1, 1); // return 1 (player 1 wins)
|X| |O|
|O|O| |    // Player 1 makes a move at (2, 1).
|X|X|X|
```

__Constraints:__

- ```2 <= n <= 100```
- ```player``` is ```1``` or ```2```.
- ```0 <= row, col < n```
- ```(row, col)``` are unique for each different call to ```move```.
- At most ```n^2``` calls will be made to ```move```.
 
__Follow-up__: Could you do better than ```O(n^2)``` per ```move()``` operation?

---

![image](https://leetcode.com/problems/design-tic-tac-toe/Figures/348/basicIdea.png)

![image](https://leetcode.com/problems/design-tic-tac-toe/Figures/348/identifyDiag.png)

### Brute Force

```Python
class TicTacToe:

    def __init__(self, n: int):
        self.board = [[None] * n for _ in range(n)]
        self.ROWS, self.COLS = n, n


    def move(self, row: int, col: int, player: int) -> int:
        if player == 1:
            self.board[row][col] = 'O'
        else:
            self.board[row][col] = 'X'

        def check_row(row, col):
            for c in range(self.COLS):
                if self.board[row][c] != self.board[row][col]:
                    return False
            return True 

        def check_col(row, col):
            for r in range(self.ROWS):
                if self.board[r][col] != self.board[row][col]:
                    return False
            return True

        def check_diagonal(row, col):
            for r in range(self.ROWS):
                if self.board[r][r] != self.board[row][col]:
                    return False
            return True

        def check_anti_diagonal(row, col):
            for r in range(self.ROWS):
                if self.board[r][self.ROWS - r - 1] != self.board[row][col]:
                    return False
            return True

        if check_row(row, col) or check_col(row, col) or check_diagonal(row, col) or check_anti_diagonal(row, col):
            return player

        return 0
        
        


# Your TicTacToe object will be instantiated and called as such:
# obj = TicTacToe(n)
# param_1 = obj.move(row,col,player)
```
