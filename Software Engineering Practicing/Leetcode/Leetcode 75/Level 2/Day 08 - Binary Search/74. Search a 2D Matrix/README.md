## [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

```Tag```: ```Matrix``` ```Binary Search```

#### Difficulty: Medium

You are given an ```m x n``` integer matrix ```matrix``` with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.

Given an integer ```target```, return _```true``` if ```target``` is in ```matrix``` or ```false``` otherwise_.

You must write a solution in ```O(log(m * n))``` time complexity.

![image](https://user-images.githubusercontent.com/35042430/223943764-75063ad1-503c-49cb-a6fe-d688df8f8b29.png)

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
