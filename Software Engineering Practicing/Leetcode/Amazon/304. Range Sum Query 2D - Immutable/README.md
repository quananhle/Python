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

```
Sum(ABCD) = Sum(OD) − Sum(OB) − Sum(OC) + Sum(OA)
```

For this, we first need to calculate the prefix sum array for the matrix.

Something like this :

Prefix Sum of matrix with each cell=1
![image](https://assets.leetcode.com/users/images/14109f49-e7ae-4e53-bc53-148e5f60877c_1654215908.2260733.png)

Now, let's say we want to find the sum of following region:

Region(Answer)
![image](https://assets.leetcode.com/users/images/0aea4bfa-0ffc-4f39-9343-c940e2ae1036_1654216134.4848273.png)

So we first need the sum from each of the following regions:

1. Region(A)
![image](https://assets.leetcode.com/users/images/06bd526d-17e1-4474-886f-cc9b3e6a5eb6_1654216261.9611187.png)

2. Region(B)
![image](https://assets.leetcode.com/users/images/dd31bd1a-c130-4e17-a5a5-d3e9148c3477_1654216305.3489735.png)

3. Region(C)
![image](https://assets.leetcode.com/users/images/6dc28313-648f-48fe-a4b7-b73f7d843b80_1654216353.8426402.png)

4. Region(D)
![image](https://assets.leetcode.com/users/images/9395743f-ab67-4e31-acbf-b153094d3fb4_1654216433.38144.png)

Then we calculate the following for required answer:

```
Region(Answer) = Region(A) - Region(B).- Region(C) + Region(D)
```

```Python
class NumMatrix:

    def __init__(self, matrix: List[List[int]]):
        ROWS, COLS = len(matrix), len(matrix[0])

        self.dp = [[0] * (COLS + 1) for _ in range(ROWS + 1)]

        n, m = len(self.dp), len(self.dp[0])
        for row in range(n - 1):
            for col in range(m - 1):
                self.dp[row + 1][col + 1] = matrix[row][col] + self.dp[row][col + 1] + self.dp[row + 1][col] - self.dp[row][col]



    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:
        return self.dp[row2 + 1][col2 + 1] - self.dp[row1][col2 + 1] - self.dp[row2 + 1][col1] + self.dp[row1][col1]

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix(matrix)
# param_1 = obj.sumRegion(row1,col1,row2,col2)
```

```Python
class NumMatrix:

    def __init__(self, matrix: List[List[int]]):
        ROWS, COLS = len(matrix), len(matrix[0])

        self.dp = [[0] * (COLS + 1) for _ in range(ROWS + 1)]

        n, m = len(self.dp), len(self.dp[0])
        for row in range(n - 1):
            for col in range(m - 1):
                self.dp[row][col] = matrix[row][col] + self.dp[row][col - 1] + self.dp[row - 1][col] - self.dp[row - 1][col - 1]

    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:
        return self.dp[row2][col2] - self.dp[row1 - 1][col2] - self.dp[row2][col1 - 1] + self.dp[row1 - 1][col1 - 1]
```
