## [1572. Matrix Diagonal Sum](https://leetcode.com/problems/matrix-diagonal-sum/)

```Tag```: ```Depth-First Search```

#### Difficulty: Easy

Given a square matrix ```mat```, return the sum of the matrix diagonals.

Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.

![image](https://user-images.githubusercontent.com/35042430/236927602-c2990603-5d33-4cba-9b6c-5f7e44e5d5f4.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/14/sample_1911.png)
```
Input: mat = [[1,2,3],
              [4,5,6],
              [7,8,9]]
Output: 25
Explanation: Diagonals sum: 1 + 5 + 9 + 3 + 7 = 25
Notice that element mat[1][1] = 5 is counted only once.
```

__Example 2:__
```
Input: mat = [[1,1,1,1],
              [1,1,1,1],
              [1,1,1,1],
              [1,1,1,1]]
Output: 8
```

__Example 3:__
```
Input: mat = [[5]]
Output: 5
```

__Constraints:__

- ```n == mat.length == mat[i].length```
- ```1 <= n <= 100```
- ```1 <= mat[i][j] <= 100```

---

