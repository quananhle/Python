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
        row, col = binaryMatrix.dimensions()
        for c in range(col):
            for r in range(row):
                if binaryMatrix.get(r, c):
                    return c

        return -1
```
