![image](https://i.etsystatic.com/17133251/r/il/6b458a/3329666862/il_1140xN.3329666862_dduh.jpg)

### N-Rooks Puzzle

```Python
class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        # N-Rooks puzzle
        res = list()
        empty_board = [["."] * n for _ in range(n)]


        def backtrack(row, columns, board):
            if row == n:
                res.append(["".join(r) for r in board])
                return
            
            for col in range(n):
                if col in columns:
                    continue
                
                # Place the rook into the board, update the path of the rook, and mark the cell
                columns.add(col)
                board[row][col] = "R"

                # Move on to the next row with current board state and column set
                backtrack(row + 1, columns, board)
                
                # Backtrack after exploring all paths from cell board[row][col]
                columns.remove(col)
                board[row][col] = "."


        backtrack(0, set(), empty_board)

        return res
```
```
[["R...",".R..","..R.","...R"],["R...",".R..","...R","..R."],["R...","..R.",".R..","...R"],["R...","..R.","...R",".R.."],
 ["R...","...R",".R..","..R."],["R...","...R","..R.",".R.."],[".R..","R...","..R.","...R"],[".R..","R...","...R","..R."],
 [".R..","..R.","R...","...R"],[".R..","..R.","...R","R..."],[".R..","...R","R...","..R."],[".R..","...R","..R.","R..."],
 ["..R.","R...",".R..","...R"],["..R.","R...","...R",".R.."],["..R.",".R..","R...","...R"],["..R.",".R..","...R","R..."],
 ["..R.","...R","R...",".R.."],["..R.","...R",".R..","R..."],["...R","R...",".R..","..R."],["...R","R...","..R.",".R.."],
 ["...R",".R..","R...","..R."],["...R",".R..","..R.","R..."],["...R","..R.","R...",".R.."],["...R","..R.",".R..","R..."]]
```
