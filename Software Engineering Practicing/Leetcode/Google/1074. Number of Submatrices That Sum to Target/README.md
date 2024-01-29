## [1074. Number of Submatrices That Sum to Target](https://leetcode.com/problems/number-of-submatrices-that-sum-to-target)

```Tag```: ```Prefix Sum``` ```Matrix```

#### Difficulty: Hard

Given a ```matrix``` and a ```target```, return _the number of non-empty submatrices that sum to ```target```_.

A submatrix ```x1```, ```y1```, ```x2```, ```y2``` is the set of all cells ```matrix[x][y]``` with $x_1 \le x \le x_2$ and $y_1 \le y \le y_2$.

Two submatrices ```(x1, y1, x2, y2)``` and ```(x1', y1', x2', y2')``` are different if they have some coordinate that is different: for example, if $x_1 \neq x_1'$.

![image](https://github.com/quananhle/Python/assets/35042430/bd0897ca-2a04-43f1-a8b9-1192c1aae50a)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/02/mate1.jpg)
```
Input: matrix = [[0,1,0],[1,1,1],[0,1,0]], target = 0
Output: 4
Explanation: The four 1x1 submatrices that only contain 0.
```

__Example 2:__
```
Input: matrix = [[1,-1],[-1,1]], target = 0
Output: 5
Explanation: The two 1x2 submatrices, plus the two 2x1 submatrices, plus the 2x2 submatrix.
```

__Example 3:__
```
Input: matrix = [[904]], target = 0
Output: 0
```

__Constraints:__

- $1 \le matrix.length \le 100$
- $1 \le matrix[0].length \le 100$
- $-1000 \le matrix[i] \le 1000$
- $-10^8 \le target \le 10^8$

---
