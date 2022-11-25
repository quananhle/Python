## 79. Word Search

#### Difficulty: Medium

Given an ```m x n``` grid of characters ```board``` and a string ```word```, return ```true``` if ```word``` _exists in the grid_.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

<img width="814" alt="image" src="https://user-images.githubusercontent.com/35042430/203913679-73e0ca58-836b-45a4-9dd1-006d85b07ddf.png">

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/04/word2.jpg)

```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/04/word-1.jpg)
```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/10/15/word3.jpg)
```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false
```

__Constraints:__
```
    m == board.length
    n = board[i].length
    1 <= m, n <= 6
    1 <= word.length <= 15
    board and word consists of only lowercase and uppercase English letters.
```
