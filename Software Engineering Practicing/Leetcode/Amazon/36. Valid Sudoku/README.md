## 36. Valid Sudoku

#### Difficulty: Medium

Determine if a ```9 x 9``` Sudoku board is valid. Only the filled cells need to be validated __according to the following rules__:

1. Each row must contain the digits ```1-9``` __without repetition__.
2. Each column must contain the digits ```1-9``` __without repetition__.
3. Each of the nine ```3 x 3``` __sub-boxes__ of the grid must contain the digits ```1-9``` __without repetition__.

__Note:__

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.

![image](https://user-images.githubusercontent.com/35042430/203643459-8548d2f2-384f-4894-9834-142148985e22.png)

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
