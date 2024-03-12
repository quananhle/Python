## [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

```Tag```: ```Matrix``` ```Binary Search```

#### Difficulty: Medium

You are given an ```m x n``` integer matrix ```matrix``` with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.

Given an integer ```target```, return _```true``` if ```target``` is in ```matrix``` or ```false``` otherwise_.

You must write a solution in ```O(log(m * n))``` time complexity.

![image](https://github.com/quananhle/Python/assets/35042430/b54baa98-cbd4-4f08-9527-01e045492ce6)

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

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= m, n <= 100```
- ```-10^4 <= matrix[i][j], target <= 10^4```

---

### Flatten 2D -> 1D

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        # Flatten the 2D matrix into 1D array
        n, m = len(matrix), len(matrix[0])
        array = [matrix[row][col] for row in range(n) for col in range(m)]

        if len(array) == 1:
            return target == array[-1]
        
        lo, hi = 0, len(array) - 1
        
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            
            if array[mi] < target:
                lo = mi + 1
            elif array[mi] > target:
                hi = mi - 1
            else:
                return True
                
        return False
```


### Two Binary Searches

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

### One Binary Search

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        m, n = len(matrix), len(matrix[0])
        lo, hi = 0, m * n - 1
        
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            
            num = matrix[mi // n][mi % n]
            
            if num < target:
                lo = mi + 1
            elif num > target:
                hi = mi - 1
            else:
                return True
                
        return False
```
