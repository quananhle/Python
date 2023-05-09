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

![image](https://leetcode.com/problems/sparse-matrix-multiplication/Figures/311/Slide1.PNG)

### Matrix

```Python
class Solution:
    def multiply(self, mat1: List[List[int]], mat2: List[List[int]]) -> List[List[int]]:
        res = [[0] * len(mat2[0]) for _ in range(len(mat1))]

        for row, row_nums in enumerate(mat1):
            for col_idx, mat1_num in enumerate(row_nums):
                for col, mat2_num in enumerate(mat2[col_idx]):
                    if mat1_num and mat2_num:
                        res[row][col] += mat1_num * mat2_num

        return res
```

```Python
class Solution:
    def multiply(self, mat1: List[List[int]], mat2: List[List[int]]) -> List[List[int]]:
        def compress_matrix(matrix: List[List[int]]) -> List[List[int]]:
            rows, cols = len(matrix), len(matrix[0])
            compressed_matrix = [[] for _ in range(rows)]
            for row in range(rows):
                for col in range(cols):
                    if matrix[row][col]:
                        compressed_matrix[row].append([matrix[row][col], col])
            return compressed_matrix
        
        m, k, n = len(mat1), len(mat1[0]), len(mat2[0])

        A = compress_matrix(mat1)
        B = compress_matrix(mat2)

        res = [[0] * n for _ in range(m)]

        for row in range(m):
            for mat1_num, mat1_col in A[row]:
                for mat2_num, col in B[mat1_col]:
                    res[row][col] += mat1_num * mat2_num
        
        return res
```
