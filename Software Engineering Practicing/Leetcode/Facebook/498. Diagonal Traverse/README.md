## [498. Diagonal Traverse](https://leetcode.com/problems/diagonal-traverse)

```Tag```: ```Matrix``` ```Hash Map``` ```Depth-First Search``` ```Simulations```

#### Difficulty: Medium

Given an ```m x n``` matrix ```mat```, return _an array of all the elements of the array in a diagonal order_.

![image](https://github.com/quananhle/Python/assets/35042430/5bcaa21a-c794-4a71-90ef-6ddedba64d9e)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/10/diag1-grid.jpg)
```
Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,4,7,5,3,6,8,9]
```

__Example 2:__
```
Input: mat = [[1,2],[3,4]]
Output: [1,2,3,4]
```

__Constraints:__

- $m == mat.length$
- $n == mat[i].length$
- $1 \le m, n \le 104$
- $1 \le m * n \le 104$
- $-10^5 \le mat[i][j] \le 10^5$

---

###  Diagonal Iteration and Reversal

__Key facts:__
- All cells are grouped by the sum of its row and column indices
- Diagonals are defined by the sum of indicies in a 2 dimensional array
- The snake phenomena can be achieved by reversing every other diagonal level, therefore check if divisible by 2

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \cdot M)$
- __Space Complexity__: $\mathcal{O}(min(N, M))$

```Python
class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])
        res = list()

        memo = collections.defaultdict(list)

        for row in range(ROWS):
            for col in range(COLS):
                if not row + col in memo:
                    memo[row + col] = [mat[row][col]]
                else:
                    memo[row + col].append(mat[row][col])
        
        for key, val in memo.items():
            if key % 2:
                for num in val:
                    res.append(num)
            else:
                for num in val[::-1]:
                    res.append(num)
        
        return res
```
