### [70. Climbing Stairs](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Study%20Plan/Algorithm/Algorithm%20I/Day%2012%20-%20Dynamic%20Programming/70.%20Climbing%20Stairs)

```Python
class Solution(object):
    def climbStairs(self, n: int) -> int:
        memo = collections.defaultdict(int)
        memo[1], memo[2] = 1, 2   

        def dp(num):
            if num in memo:
                return memo[num]
            else:
                memo[num] = dp(num - 1) + dp(num - 2)
            return memo[num]

        return dp(n)
```

### [509. Fibonacci Number](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%201/Day%2010%20-%20Dynamic%20Programming/509.%20Fibonacci%20Number)

```Python
class Solution:
    def fib(self, n: int) -> int:
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2], memo[3], memo[4] = 0, 1, 1, 2, 3
        if n < 5:
            return memo[n]

        for curr in range(5, n + 1):
            memo[curr] = memo[curr - 1] + memo[curr - 2]
        
        return memo[n]
```

### [1137. N-th Tribonacci Number](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/The%20Framework/1137.%20N-th%20Tribonacci%20Number)

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2], memo[3], memo[4], memo[5], memo[25] = 0, 1, 1, 2, 4, 7, 1389537

        def dp(num):
            if not num in memo:
                memo[num] = dp(num-1) + dp(num-2) + dp(num-3)
            return memo[num]
        return dp(n)
```

### [746. Min Cost Climbing Stairs](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/The%20Framework/746.%20Min%20Cost%20Climbing%20Stairs)

```Python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        n = len(cost)

        @lru_cache(maxsize=None)
        def dp(curr):
            # Base case
            if curr >= n - 2:
                return 0
            
            # DP Transition: does start from index 0 or index 1 better? Should be taking 1 step or 2 steps?
            one = cost[curr + 1] + dp(curr + 1)
            two = cost[curr + 2] + dp(curr + 2)

            return min(one, two)
        
        return dp(-1)
```

### [198. House Robber](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/The%20Framework/198.%20House%20Robber)

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)

        @lru_cache(maxsize=None)
        def dp(curr: int) -> int:
            # Base case
            if curr >= n:
                return 0
            
            # DP Transition: take or skip this house?
            
            # Skip the current house: move on to the next house, not taking the money from the current house
            skip = dp(curr + 1)
            # Take the current house: move on to the next next house, taking the money from the current house
            take = nums[curr] + dp(curr + 2)
        
            # Get the maximum amount of money
            return max(skip, take)
        
        return dp(0)
```

### [740. Delete and Earn](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/The%20Framework/740.%20Delete%20and%20Earn)

```Python
class Solution:
    def deleteAndEarn(self, nums: List[int]) -> int:
        n = len(nums)

        points = collections.defaultdict(int)
        max_num = 0

        for num in nums:
            points[num] += num
            max_num = max(max_num, num)

        @lru_cache(maxsize=None)
        def dp(curr):
            # Base cases
            if curr == 0:
                return 0
            if curr == 1:
                return points[curr]
            
            # DP Transitions: pick or skip the current number?

            # Skip the current number
            skip = dp(curr - 1)

            # Take the current number
            take = points[curr] + dp(curr - 2)

            return max(skip, take)

        return dp(max_num)
```
