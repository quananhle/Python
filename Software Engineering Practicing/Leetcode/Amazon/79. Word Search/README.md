## 79. Word Search

#### Difficulty: Medium

Given an ```m x n``` grid of characters ```board``` and a string ```word```, return ```true``` if ```word``` _exists in the grid_.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

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
