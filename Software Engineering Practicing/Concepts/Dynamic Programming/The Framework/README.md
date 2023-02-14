## Framework for DP Problems

### The Framework

To solve a DP problem, we need to combine 3 things:

#### 1. A function or data structure that will compute/contain the answer to the problem for every given state.
#### 2. A recurrence relation to transition between states.
#### 3. Base cases, so that our recurrence relation doesn't go on infinitely.

Problem [Climbing Stairs](https://leetcode.com/problems/climbing-stairs/) as an example, with a top-down (recursive) implementation

#### Top-down Implementation

```Python
class Solution:
    def climbStairs(self, n: int) -> int:
        #### Time complexity: O(n)
        def dp(i):
            if i <= 2: 
                return i
            if i not in memo:
                # Instead of just returning dp(i - 1) + dp(i - 2), calculate it once and then
                # store the result inside a hashmap to refer to in the future.
                memo[i] = dp(i - 1) + dp(i - 2)
            
            return memo[i]
        
        memo = {}
        return dp(n)
```

```
You may notice that a hashmap is overkill for caching here, and an array can be used instead. This is true, 
but using a hashmap isn't necessarily bad practice as some DP problems will require one, and they're hassle-free 
to use as you don't need to worry about sizing an array correctly. Furthermore, when using top-down DP, some 
problems do not require us to solve every single subproblem, in which case an array may use more memory than a hashmap.
```

#### Bottom-Up Implementation

```Python
    def climbStairs(self, n: int) -> int:
        if n == 1:
            return 1
            
        # An array that represents the answer to the problem for a given state
        dp = [0] * (n + 1)
        dp[1] = 1 # Base cases
        dp[2] = 2 # Base cases
        
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2] # Recurrence relation

        return dp[n]
```

---

### Multidimensional DP

