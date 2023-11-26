## [1727. Largest Submatrix With Rearrangements](https://leetcode.com/problems/largest-submatrix-with-rearrangements)

```Tag```:

#### Difficulty: Medium

You are given a binary ```matrix``` matrix of size ```m x n```, and you are allowed to rearrange the columns of the ```matrix``` in any order.

Return _the area of the largest submatrix within ```matrix``` where every element of the submatrix is ```1``` after reordering the columns optimally_.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/29/screenshot-2020-12-30-at-40536-pm.png)
```
Input: matrix = [[0,0,1],[1,1,1],[1,0,1]]
Output: 4
Explanation: You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 4.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/29/screenshot-2020-12-30-at-40852-pm.png)
```
Input: matrix = [[1,0,1,0,1]]
Output: 3
Explanation: You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 3.
```

__Example 3:__
```
Input: matrix = [[1,1,0],[1,0,1]]
Output: 2
Explanation: Notice that you must rearrange entire columns, and there is no way to make a submatrix of 1s larger than an area of 2.
```

__Constraints:__

- $m == matrix.length$
- $n == matrix[i].length$
- $1 \le m * n \le 10^5$
- ```matrix[i][j]``` is either ```0``` or ```1```.

---
