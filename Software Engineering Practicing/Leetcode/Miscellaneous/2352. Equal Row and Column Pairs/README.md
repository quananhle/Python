## [2352. Equal Row and Column Pairs](https://leetcode.com/problems/equal-row-and-column-pairs)

```Tag```: ```Stack```

#### Difficulty: Medium

Given a __0-indexed__ ```n x n``` integer matrix ```grid```, return _the number of pairs (r<sub>i</sub>, c<sub>j</sub>) such that row r<sub>i</sub> and column c<sub>j</sub> are equal_.

A row and column pair is considered equal if they contain the same elements in the same order (i.e., an equal array).

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/06/01/ex1.jpg)
```
Input: grid = [[3,2,1],[1,7,6],[2,7,7]]
Output: 1
Explanation: There is 1 equal row and column pair:
- (Row 2, Column 1): [2,7,7]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/06/01/ex2.jpg)
```
Input: grid = [[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]
Output: 3
Explanation: There are 3 equal row and column pairs:
- (Row 0, Column 0): [3,1,2,2]
- (Row 2, Column 2): [2,4,2,2]
- (Row 3, Column 2): [2,4,2,2]
```

__Constraints:__

- ```n == grid.length == grid[i].length```
- ```1 <= n <= 200```
- ```1 <= grid[i][j] <= 10^5```

---


