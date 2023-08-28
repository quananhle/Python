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

### [198. House Robber](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/The%20Framework/198.%20House%20Robber)

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)

        @lru_cache(None)
        def dp(curr):
            # Base case
            if curr >= n:
                return 0
            
            # Recurrence relation: to skip or to rob the current house?
            # Skip, move on to the next house, not gaining any money from the current house
            skip = dp(curr + 1)
            # Take, mvoe on down to 2 houses over, take the money off the current house
            take = nums[curr] + dp(curr + 2)
            # What is the best decision?
            return max(skip, take)
        
        return dp(0)
```
