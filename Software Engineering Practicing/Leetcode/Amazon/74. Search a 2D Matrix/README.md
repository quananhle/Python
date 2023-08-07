## [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

```Tag```: ```Binary Search``` ```Matrix```

#### Difficulty: Medium

You are given an ```m x n``` integer matrix ```matrix``` with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.

Given an integer ```target```, return _```true``` if ```target``` is in ```matrix``` or ```false``` otherwise_.

You must write a solution in $\mathcal{O}(\log(m \cdot n))$ time complexity.

![image](https://github.com/quananhle/Python/assets/35042430/d8393bba-bcd0-4328-abbc-a91005908fd6)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/05/mat.jpg)
```
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/05/mat2.jpg)
```
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false
```

__Constraints:__

- $m == matrix.length$
- $n == matrix[i].length$
- $1 \le m, n \le 100$
- $-10^{4} \le matrix[i][j], target \le 10^{4}$

---

### Brute Force

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        ROWS, COLS = len(matrix), len(matrix[0])
        for row in range(ROWS):
            for col in range(COLS):
                if matrix[row][col] == target:
                    return True
        return False
```

### Binary Search

#### Template 1

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        ROWS, COLS = len(matrix), len(matrix[0])
        if not ROWS:
            return False
        
        lo, hi = 0, ROWS * COLS - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            num = matrix[mi // COLS][mi % COLS]
            if num == target:
                return True
            else:
                if num < target:
                    lo = mi + 1
                else:
                    hi = mi - 1
        
        return False
```
