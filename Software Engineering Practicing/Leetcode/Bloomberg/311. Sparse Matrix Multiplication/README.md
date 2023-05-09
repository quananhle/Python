## [311. Sparse Matrix Multiplication](https://leetcode.com/problems/sparse-matrix-multiplication)

```Tag```: ```Matrix``` ```Math```

#### Difficulty: Medium

Given two sparse matrices ```mat1``` of size ```m x k``` and ```mat2``` of size ```k x n```, return _the result of ```mat1 x mat2```_. You may assume that multiplication is always possible.

![image](https://user-images.githubusercontent.com/35042430/236965437-4bdb0a86-0fcc-4470-9cb1-1bc9970e47bb.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/12/mult-grid.jpg)
```
Input: mat1 = [[1,0,0],[-1,0,3]], mat2 = [[7,0,0],[0,0,0],[0,0,1]]
Output: [[7,0,0],[-7,0,3]]
```

__Example 2:__
```
Input: mat1 = [[0]], mat2 = [[0]]
Output: [[0]]
```

__Constraints:__

- ```m == mat1.length```
- ```k == mat1[i].length == mat2.length```
- ```n == mat2[i].length```
- ```1 <= m, n, k <= 100```
- ```-100 <= mat1[i][j], mat2[i][j] <= 100```

---

