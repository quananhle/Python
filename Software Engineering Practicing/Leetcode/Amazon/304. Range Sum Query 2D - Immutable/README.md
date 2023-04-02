## [304. Range Sum Query 2D - Immutable](https://leetcode.com/problems/range-sum-query-2d-immutable/)

```Tag```: ```Design``` ```Prefix Sum``` ```Dynamic Programming```

#### Difficulty: Medium

Given a 2D matrix ```matrix```, handle multiple queries of the following type:

- Calculate the sum of the elements of ```matrix``` inside the rectangle defined by its upper left corner ```(row1, col1)``` and lower right corner ```(row2, col2)```.

Implement the ```NumMatrix``` class:

- ```NumMatrix(int[][] matrix)``` Initializes the object with the integer matrix ```matrix```.
- ```int sumRegion(int row1, int col1, int row2, int col2)``` Returns the sum of the elements of ```matrix``` inside the rectangle defined by its __upper left corner__ ```(row1, col1)``` and __lower right corner__ ```(row2, col2)```.

You must design an algorithm where ```sumRegion``` works on ```O(1)``` time complexity.

![image](https://user-images.githubusercontent.com/35042430/229218572-b91adba8-0af7-40b7-afa8-cf9a5f52b818.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/14/sum-grid.jpg)

```
Input
["NumMatrix", "sumRegion", "sumRegion", "sumRegion"]
[[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [1, 1, 2, 2], [1, 2, 2, 4]]
Output
[null, 8, 11, 12]

Explanation
NumMatrix numMatrix = new NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]);
numMatrix.sumRegion(2, 1, 4, 3); // return 8 (i.e sum of the red rectangle)
numMatrix.sumRegion(1, 1, 2, 2); // return 11 (i.e sum of the green rectangle)
numMatrix.sumRegion(1, 2, 2, 4); // return 12 (i.e sum of the blue rectangle)
```

__Constraints:__

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= m, n <= 200```
- -10<sup>4</sup> <= ```matrix[i][j]``` <= 10<sup>4</sup>
- ```0 <= row1 <= row2 < m```
- ```0 <= col1 <= col2 < n```

---

### Brute Force

- __Time Complexity__: ```O(N * M)```
- __Space Complexity__: ```O(1)```

```Python
class NumMatrix:

    def __init__(self, matrix: List[List[int]]):
        self.matrix = matrix

    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:
        ans = 0
        for row in range(row1, row2 + 1):
            for col in range(col1, col2 + 1):
                ans += self.matrix[row][col]
        return ans
```

### Caching

#### Caching Row

- __Time Complexity__: ```O(M)```
- __Space Complexity__: ```O(N * M)```

```Python
class NumMatrix:

    def __init__(self, matrix: List[List[int]]):
        self.matrix = matrix

        ROWS, COLS = len(matrix), len(matrix[0])
        self.memo = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        if ROWS == 0 or COLS == 0:
            return

        for row in range(ROWS):
            for col in range(COLS):
                self.memo[row][col + 1] = self.memo[row][col] + matrix[row][col]

    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:
        ans = 0
        for row in range(row1, row2 + 1):
            ans += self.memo[row][col2 + 1] - self.memo[row][col1]
        return ans

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix(matrix)
# param_1 = obj.sumRegion(row1,col1,row2,col2)
```

#### Caching Block

![image](https://i.imgur.com/tmTpvF5.gif)

![image](https://leetcode.com/static/images/courses/sum_od.png)
Sum(OD) is the cumulative region sum with respect to the origin at (0, 0).

How do we derive Sum(ABCD) using the pre-computed cumulative region sum?

![image](https://leetcode.com/static/images/courses/sum_ob.png)
Sum(OB) is the cumulative region sum on top of the rectangle.

![image](https://leetcode.com/static/images/courses/sum_oc.png)
Sum(OC) is the cumulative region sum to the left of the rectangle.

![image](https://leetcode.com/static/images/courses/sum_oa.png)
Sum(OA) is the cumulative region sum to the top left corner of the rectangle.

```Python

```
