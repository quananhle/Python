## [1428. Leftmost Column with at Least a One](https://leetcode.com/problems/leftmost-column-with-at-least-a-one)

```Tag```: ```Matrix```

#### Difficulty: Medium

A row-sorted binary matrix means that all elements are ```0``` or ```1``` and each row of the matrix is sorted in non-decreasing order.

Given a row-sorted binary matrix ```binaryMatrix```, return _the index (__0-indexed__) of the leftmost column with a ```1``` in it_. If such an index does not exist, return _```-1```_.

You can't access the Binary Matrix directly. You may only access the matrix using a ```BinaryMatrix``` interface:

- ```BinaryMatrix.get(row, col)``` returns the element of the matrix at index ```(row, col)``` (__0-indexed__).
- ```BinaryMatrix.dimensions()``` returns the dimensions of the matrix as a list of 2 elements ```[rows, cols]```, which means the matrix is rows ```x``` cols.
- Submissions making more than ```1000``` calls to ```BinaryMatrix.get``` will be judged Wrong Answer. Also, any solutions that attempt to circumvent the judge will result in disqualification.

For custom testing purposes, the input will be the entire binary matrix ```mat```. You will not have access to the binary matrix directly.

![image](https://github.com/quananhle/Python/assets/35042430/58a3ad72-e682-45fc-a13b-be087015fb88)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-5.jpg)
```
Input: mat = [[0,0],[1,1]]
Output: 0
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-4.jpg)
```
Input: mat = [[0,0],[0,1]]
Output: 1
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2019/10/25/untitled-diagram-3.jpg)
```
Input: mat = [[0,0],[0,0]]
Output: -1
```

__Constraints:__

- $rows == mat.length$
- $cols == mat[i].length$
- $1 \le rows, cols \le 100$
- ```mat[i][j]``` is either ```0``` or ```1```.
- ```mat[i]``` is sorted in non-decreasing order.

---

### Linear Scan

```Python
class Solution:
    def leftMostColumnWithOne(self, binaryMatrix: 'BinaryMatrix') -> int:
        ROWS, COLS = binaryMatrix.dimensions()
        ans = COLS
        for row in range(ROWS):
            for col in range(COLS):
                if binaryMatrix.get(row, col):
                    ans = min(ans, col)
                    break

        return -1 if ans == COLS else ans
```

#### Vertical Traverse

```Python
class Solution:
    def leftMostColumnWithOne(self, binaryMatrix: 'BinaryMatrix') -> int:
        row, col = binaryMatrix.dimensions()
        for c in range(col):
            for r in range(row):
                if binaryMatrix.get(r, c):
                    return c

        return -1
```

### Binary Search

![image](https://github.com/quananhle/Python/assets/35042430/bf72f9fd-0136-4e9e-9ef1-e07d59ea479f)

__Algorithm__

```
define function binary_search(input_list):
    lo = the lowest possible index
    hi = the highest possible index
    while the search space contains 2 or more items:
        mid = the middle index in the remaining search space
        if the element at input_list[mid] is 0:
            lo = mid + 1 (the first 1 is *further right*, and can't be mid itself)
        else:
            hi = mid (the first 1 is either mid itself, *or is further left*)
    return the only index remaining in the search space
```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log M)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
# """
# This is BinaryMatrix's API interface.
# You should not implement it, or speculate about its implementation
# """
#class BinaryMatrix(object):
#    def get(self, row: int, col: int) -> int:
#    def dimensions(self) -> list[]:

class Solution:
    def leftMostColumnWithOne(self, binaryMatrix: 'BinaryMatrix') -> int:
        ROWS, COLS = binaryMatrix.dimensions()
        ans = COLS

        def binary_search(row, col):
            nonlocal ans
            lo, hi = 0, col - 1

            while lo < hi:
                mi = lo + (hi - lo) // 2
                if binaryMatrix.get(row, mi):
                    hi = mi
                else:
                    lo = mi + 1

            if binaryMatrix.get(row, lo):
                ans = min(ans, lo)

            return ans

        for row in range(ROWS):
            binary_search(row, COLS)

        return -1 if ans == COLS else ans
```

#### Binary Search Optimization

Shrink the upper boundary as we do not care about the right ones of the current best value. 

Therefore, an optimization we could have made was to keep track of the minimum index so far, and then abort the search on any rows where we have discovered a ```0``` at, or to the right of, that minimum index.

We can do even better than that; on each search, we can set ```hi = smallest_index - 1```, where ```smallest_index``` is the smallest index of a ```1``` we've seen so far. In most cases, this is a substantial improvement. It works because we're only interested in finding ```1```s at lower indexes than we previously found. 

![image](https://github.com/quananhle/Python/assets/35042430/0f64495c-bbb8-4e02-96a8-6636fcefb47e)

```Python
# """
# This is BinaryMatrix's API interface.
# You should not implement it, or speculate about its implementation
# """
#class BinaryMatrix(object):
#    def get(self, row: int, col: int) -> int:
#    def dimensions(self) -> list[]:

class Solution:
    def leftMostColumnWithOne(self, binaryMatrix: 'BinaryMatrix') -> int:
        ROWS, COLS = binaryMatrix.dimensions()
        smallest_idx = COLS

        for row in range(ROWS):
            lo, hi = 0, smallest_idx - 1

            while lo < hi:
                mi = lo + (hi - lo) // 2
                if binaryMatrix.get(row, mi):
                    hi = mi
                else:
                    lo = mi + 1

            if binaryMatrix.get(row, lo) == 1:
                smallest_idx = min(smallest_idx, lo)

        return -1 if smallest_idx == COLS else smallest_idx
```
