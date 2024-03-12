## [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

```Tag```: ```Binary Search``` ```Matrix```

#### Difficulty: Medium

You are given an ```m x n``` integer matrix ```matrix``` with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.

Given an integer ```target```, return _```true``` if ```target``` is in ```matrix``` or ```false``` otherwise_.

You must write a solution in $\mathcal{O}(\log(m \cdot n))$ time complexity.

![image](https://github.com/quananhle/Python/assets/35042430/5d4caff1-a7d6-4985-bfa3-fec361c8abf5)

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

#### Flatten 2D-Matrix to 1D-Array

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        ROWS, COLS = len(matrix), len(matrix[0])
        if not ROWS:
            return False
        array = [matrix[row][col] for row in range(ROWS) for col in range(COLS)]

        n = len(array)
        lo, hi = 0, n - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            num = array[mi]
            if num < target:
                lo = mi + 1
            elif num > target:
                hi = mi - 1
            else:
                return True

        return False
```

#### Two Binary Searches

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        ROWS = len(matrix)
        lo_row, hi_row = 0, ROWS - 1

        while lo_row <= hi_row:                         # O(log m)
            mi_row = hi_row - (hi_row - lo_row) // 2

            row = matrix[mi_row]
            lo, hi = 0, len(row) - 1
            while lo <= hi:                             # O(log n)
                mi = hi - (hi - lo) // 2
                curr = row[mi]
                if target == curr:
                    return True
                elif target < curr:
                    hi = mi - 1
                else:
                    lo = mi + 1

            if target < row[-1]:                        # O(1)
                hi_row = mi_row - 1
            else:                                       # O(1)
                lo_row = mi_row + 1 
            
        return False
```

#### Traverse the 2D-Matrix

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
