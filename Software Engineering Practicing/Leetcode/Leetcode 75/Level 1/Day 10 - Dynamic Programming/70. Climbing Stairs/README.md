## [70. Climbing Stairs](https://leetcode.com/problems/climbing-stairs)

```Tag```: ```Dynamic Programming```

#### Difficulty: Easy

You are climbing a staircase. It takes ```n``` steps to reach the top.

Each time you can either climb ```1``` or ```2``` steps. In how many distinct ways can you climb to the top?

![image](https://github.com/quananhle/Python/assets/35042430/6a1977f7-88e8-4741-b21d-5e3509a821a1)

---

__Example 1:__
```
Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
```

__Example 2:__
```
Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

__Constraints:__
```
1 <= n <= 45
```

---

```Python
class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Recursion
        ### Time Limit Exceeded at n = 38
        #### Time Complexity: O(2^N), exponentially recursively calculate every number up to n
        #### Space Complexity: O(N), keep up to the size of n recursively until reach base cases
        """
        # Base Cases
        if n == 1:
            return 1
        elif n == 2:
            return 2
        else:
            return self.climbStairs(n-1) + self.climbStairs(n-2)
        """
        # Top-Down Dynamic Programming using Memoization
        #### Time Complexity: O(N), calculate each number, starting at 3 up to and including N, is visited, computed and then stored for O(1) access later on.
        #### Space Complexity: O(N), memoization hash table is used, which occupies O(N) space
        """
        def helper(num):
            if num in memo:
                return memo[num]
            else:
                memo[num] = helper(num - 1) + helper(num - 2)
            return memo[num]
        memo = dict()
        memo[1], memo[2] = 1, 2            
        return helper(n)
        """
        # Bottom-Up Dynamic Programming using Tabulation
        #### Time Complexity: O(N), calculate each number, starting at 3 up to and including N, is visited, computed and then stored for O(1) access later on.
        #### Space Complexity: O(N), stack keep up to the size of n elements
        """
        # n is inclusive so the cache needs n + 1 index to store all value
        if n <= 2:
            return n
        dp = [1 for _ in range (n+1)] 
        # Climb or 1 or 2 steps
        dp[1], dp[2] = 1, 2
        # Start from 3 up to and including n
        for i in range(3, n + 1):
            dp[i] = dp[i-1] + dp[i-2]
        return dp[n]
        """
        # Iterative Bottom-Up Dynamic Programming
        #### Time Complexity: O(N), calculate each number, starting at 3 up to and including N, is visited, computed and then stored for O(1) access later on.
        #### Space Complexity: O(1), constant memory space for pointers
        """
        if n <= 2:
            return n
        current = 0  
        # Bases Cases
        # Staircase has 1 step
        climb1 = 1 
        # Staircase has 2 steps
        climb2 = 2
        # If staircase has more than 2 steps, start from 3 up to and including n
        for i in range(3, n + 1):
            current = climb1 + climb2
            climb1 = climb2
            climb2 = current
        return current
        """
        # Matrix Exponentiation - Binets Method
        #### Time Complexity: O(logN), halving n after every check
        #### Space Complexity: O(1), constant space is used for multiply
        def multiply(a, b):
            c = [[0] * (len(a)+1) for _ in range(len(b))]
            for i in range(len(a)):
                for j in range(len(b)):
                    c[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j]
            return c


        def matrix_power(a, n):
            b = [[1, 0], [0, 1]]
            while n > 0:
                # x & 1 is equivalent to x % 2.
                if ((n & 1) == 1):
                    b = multiply(b, a)
                # x >> 1 is equivalent to x / 2                    
                n >>= 1
                a = multiply(a, a)
            return b
        
        a = [[1,1],[1,0]]
        a = matrix_power(a, n)
        return a[0][0]
```
