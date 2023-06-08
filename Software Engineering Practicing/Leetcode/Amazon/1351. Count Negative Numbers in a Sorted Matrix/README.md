## [1351. Count Negative Numbers in a Sorted Matrix](https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/)

```Tag```: ```Binary Search``` ```Linear Search```

#### Difficulty: Easy

Given a ```m x n``` matrix ```grid``` which is sorted in non-increasing order both row-wise and column-wise, return _the number of negative numbers in ```grid```_.

![image](https://github.com/quananhle/Python/assets/35042430/dc098db5-4059-4187-9f4e-0e52fe80c8e4)

---

__Example 1:__
```
Input: grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
Output: 8
Explanation: There are 8 negatives number in the matrix.
```

__Example 2:__
```
Input: grid = [[3,2],[1,0]]
Output: 0
```

__Constraints:__

- ```m == grid.length```
- ```n == grid[i].length```
- ```1 <= m, n <= 100```
- ```-100 <= grid[i][j] <= 100```
 
---

### Brute Force

__Complexity Analysis__

Here, $m×n$ is the size of the input matrix.

- __Time complexity__: $O(m⋅n)$, we iterate on each element of the matrix once, and the total number of the elements in the matrix is $m⋅n$.
- __Space complexity__: $O(1)$

```Python
class Solution:
    def countNegatives(self, grid: List[List[int]]) -> int:
        ans = 0

        for row in grid:
            for num in row:
                if num < 0:
                    ans += 1
                
        return ans
```

```Python
class Solution:
    def countNegatives(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        ans = 0

        for row in range(ROWS):
            total = sum(grid[row])
            for num in grid[row]:
                curr = total
                total -= num
                if curr < total:
                    ans += 1
                
        return ans
```

### Binary Search

__Complexity Analysis__

Here, $m×n$ is the size of the input matrix.

- __Time complexity__: $O(mlogn)$.
- __Space complexity__: $O(1)$

```Python
class Solution:
    def countNegatives(self, grid: List[List[int]]) -> int:
        ans = 0
        n = len(grid[0])

        for row in grid:
            lo, hi = 0, n - 1
            while lo <= hi:
                mi = lo + (hi - lo) // 2
                if row[mi] < 0:
                    hi = mi - 1
                else:
                    lo = mi + 1
                
            ans += (n - lo)
        
        return ans
```

__Follow up__: Could you find an ```O(n + m)``` solution?

### Linear Traversal

![image](https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/Figures/1351/Slide2.PNG)
