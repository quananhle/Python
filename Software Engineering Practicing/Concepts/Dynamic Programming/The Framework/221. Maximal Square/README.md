## [221. Maximal Square](https://leetcode.com/problems/maximal-square)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an ```m x n``` binary ```matrix``` filled with ```0```'s and ```1```'s, _find the largest __square__ containing only ```1```'s and return its area_.

![image](https://github.com/quananhle/Python/assets/35042430/dc6b76d2-4356-4150-848c-12bd5afe4a32)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/26/max1grid.jpg)
```
Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
Output: 4
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/26/max2grid.jpg)
```
Input: matrix = [["0","1"],["1","0"]]
Output: 1
```

__Example 3:__
```
Input: matrix = [["0"]]
Output: 0
```

__Constraints:__

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= m, n <= 300```
- ```matrix[i][j]``` is ```'0'``` or ```'1'```.

---

![image](https://assets.leetcode.com/users/arkaung/image_1587997244.png)

![image](https://leetcode.com/media/original_images/221_Maximal_Square.PNG?raw=true)

### The Framework

You can never figure out a bottom-up Dynamic Programming solution without first figuring out a top-down recursive approach. If during the recursion you find you're solving the same sub-problem repeatedly ("overlapping sub-problems") - that's the first hint that its Dynamic Programming. Next, if you find that the optimal answer for the current sub-problem is formed from the optimal answer for the overlapping sub-problems, you now have found the optimal sub-structure. Its Dynamic Programming for sure. Typically problems involving finding the "longest/shortest/largest/smallest/maximal" of something have the optimal-substructure.

#### Top-Down Dynamic Programming (Recursion)

![image](https://assets.leetcode.com/users/arkaung/image_1588005144.png)

```Python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)
        ROWS, COLS = len(matrix), len(matrix[0])
        ans = 0
        visited = set()

        def dp(row, col):
            # Base cases
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                return 0
            if matrix[row][col] == "0":
                visited.add((row, col))
                # Using defaultdict of int value has 0 as default value
                '''
                # If memo is dict() instead of defaultdict(int)
                memo[(row, col)] = 0
                '''
            else:
                # Recurrence relation
                memo[(row, col)] = 1 + min(dp(row + 1, col + 1), dp(row + 1, col), dp(row, col + 1))
            return memo[(row, col)]


        for row in range(ROWS):
            for col in range(COLS):
                ans = max(ans, dp(row, col))
        return ans ** 2
```

#### Bottom-Up Dynamic Programming (Tabulation)

![image](https://assets.leetcode.com/users/arkaung/image_1587997873.png)

```Python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        # Bottom-Up DP (Tabulation)
        dp = collections.defaultdict(int)
        # Using dictionary instead of list saves up memory space usage as only "1" matters
        '''
        dp = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        '''
        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        ans = 0

        for row in range(ROWS):
            for col in range(COLS):
                # Base cases
                if (row, col) in visited:
                    continue
                if matrix[row][col] == "0":
                    visited.add((row, col))
                else:
                    # Recurrence relation
                    dp[(row + 1, col + 1)] = 1 + min(dp[(row, col)], dp[(row + 1, col)], dp[(row, col + 1)])
                    ans = max(ans, dp[(row + 1, col + 1)])
        return ans**2
```

```Python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        # Bottom-Up DP (Tabulation)
        dp = collections.defaultdict(int)
        ROWS, COLS = len(matrix), len(matrix[0])
        ans = 0

        for row in range(ROWS):
            for col in range(COLS):
                if matrix[row][col] == "1":
                    # Recurrence relation
                    dp[(row + 1, col + 1)] = 1 + min(dp[(row, col)], dp[(row + 1, col)], dp[(row, col + 1)])
                    ans = max(ans, dp[(row + 1, col + 1)])
        return ans**2
```

#### Space Optimized Bottom-Up Dynamic Programming

![image](https://user-images.githubusercontent.com/35042430/219166329-e05ed4ba-096d-4b07-ad18-13fc5017b402.png)

![image](https://leetcode.com/media/original_images/221_Maximal_Square1.png?raw=true)

```Python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        # Bottom-Up DP (Tabulation)
        dp = collections.defaultdict(int)
        ROWS, COLS = len(matrix), len(matrix[0])
        ans = prev = 0

        for row in range(1, ROWS + 1):
            for col in range(1, COLS + 1):
                tmp = dp[col]
                if matrix[row - 1][col - 1] == "1":        
                    dp[col] = 1 + min(min(dp[col - 1], prev), dp[col])
                    ans = max(ans, dp[col])
                else:
                    dp[col] = 0
                prev = tmp
        return ans**2
```

```Python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        # Bottom-Up DP (Tabulation)
        dp = collections.defaultdict(int)
        ROWS, COLS = len(matrix), len(matrix[0])
        ans = prev = 0

        for row in range(ROWS):
            for col in range(COLS):
                tmp = dp[col + 1]
                if matrix[row][col] == "1":        
                    dp[col + 1] = 1 + min(min(dp[col], prev), dp[col + 1])
                    ans = max(ans, dp[col + 1])
                else:
                    dp[col + 1] = 0
                prev = tmp
        return ans**2
```
