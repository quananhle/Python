## 62. Unique Paths

#### Difficulty: Medium

There is a robot on an ```m x n``` grid. The robot is initially located at the __top-left corner__ (i.e., ```grid[0][0]```). The robot tries to move to the __bottom-right corner__ (i.e., ```grid[m - 1][n - 1]```). The robot can only move either down or right at any point in time.

Given the two integers ```m``` and ```n```, return _the number of possible unique paths that the robot can take to reach the bottom-right corner_.

The test cases are generated so that the answer will be less than or equal to ```2 * 109```

![image](https://user-images.githubusercontent.com/35042430/206839303-ffdd2f90-1b37-471d-abb2-166b0ab23e12.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/10/22/robot_maze.png)
```
Input: m = 3, n = 7
Output: 28
```

![image](https://user-images.githubusercontent.com/35042430/206839417-1eaef390-98d9-43ed-bb76-5ddeb479b81c.png)

![image](https://user-images.githubusercontent.com/35042430/206839432-7f0f191e-2ef8-485d-9133-5f05ffe95720.png)

![image](https://user-images.githubusercontent.com/35042430/206839436-c4e3cf14-d50b-4867-b1e0-56292e0b199f.png)

![image](https://user-images.githubusercontent.com/35042430/206839442-e94b79c5-ebf7-40a6-9592-ee25566482ba.png)

![image](https://user-images.githubusercontent.com/35042430/206839446-2f00bd18-ada8-4d79-a994-73b05843412b.png)

__Example 2:__
```
Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down
```

__Constraints:__
```
1 <= m, n <= 100
```

---

### Bottom-Up Dynamic Programming using 2D Tabulation

```Python
class Solution(object):
    def uniquePaths(self, m, n):
        """
        :type m: int
        :type n: int
        :rtype: int
        """
        '''
        m = 1, n = 1 => 1
        m = 2, n = 2 => 2
        m = 3, n = 2 => 3
        m = 2, n = 3 => 3
        m = 3, n = 3 => 6
        '''
        """
        if m == 1 or n == 1:
            return 1
        return self.uniquePaths(m - 1, n) + self.uniquePaths(m, n - 1)
        """
        # Bottom-Up Dynamic Programming using 2D Tabulation
        #### Time Complexity: O(N * M)
        #### Space Complexity: O(N * M)
        """
        dp = [[1] * n for _ in range(m)]
        for col in range(1, m):
            for row in range(1, n):
                dp[col][row] = dp[col-1][row] + dp[col][row-1]
        return dp[m-1][n-1]
        """
        dp = [[1] * m for _ in range(n)]
        for row in range(1, n):
            for col in range(1, m):
                dp[row][col] = dp[row-1][col] + dp[row][col-1]
        return dp[n-1][m-1]
```

### Bottom-Up Dynamic Programming using Tabulation

```Python
class Solution(object):
    def uniquePaths(self, m, n):
        """
        :type m: int
        :type n: int
        :rtype: int
        """
        # Bottom-Up Dynamic Programming using Tabulation
        #### Time Complexity: O(N)
        #### Space Complexity: O(N)
        """
        dp = [1] * n
        for col in range(1, m):
            for row in range(1, n):
                dp[row] += dp[row-1]
        return dp[-1]
        """
        dp = [1] * m
        for row in range(1, n):
            for col in range(1, m):
                dp[col] += dp[col-1]
        return dp[-1]
```
