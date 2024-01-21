## [198. House Robber](https://leetcode.com/problems/house-robber/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and __it will automatically contact the police if two adjacent houses were broken into on the same night.__

Given an integer array ```nums``` representing the amount of money of each house, return _the maximum amount of money you can rob tonight __without alerting the police___.

![image](https://github.com/quananhle/Python/assets/35042430/d0076b8f-b8c1-46f5-b37c-de788f956208)

---

__Example 1:__
```
Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
```

__Example 2:__
```
Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.
```

__Constraints:__

```
1 <= nums.length <= 100
0 <= nums[i] <= 400
```

---

![image](https://leetcode.com/problems/house-robber/solutions/1113644/Figures/198/img1.png)
_Figure 1. An example showing the robber making the optimal choices to obtain the most money._

![image](https://leetcode.com/problems/house-robber/solutions/1113644/Figures/198/img2.png)
_Figure 2. The same example showing the robber making sub-optimal choices._

![image](https://leetcode.com/problems/house-robber/solutions/1113644/Figures/198/img3.png)
_Figure 3. Depicting the failure of a greedy strategy on the same example._

### The Framework

![image](https://user-images.githubusercontent.com/35042430/218662640-75fcda9d-62ac-4268-9dd9-ec81d43fef96.png)

![image](https://user-images.githubusercontent.com/35042430/218662669-4d0f430f-151d-42f4-8f80-3302f5a46d0f.png)

![image](https://user-images.githubusercontent.com/35042430/218662708-29b4e063-8113-4de5-9eb0-c04db1eb0990.png)

#### Top-Down Dynamic Programming

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        # Top-Down DP (Recursion)
        #### Time Complexity: O(N)
        memo = collections.defaultdict(int)
        n = len(nums)

        def dp(i):
            # Base cases
            if i == 0:
                return nums[0]
            if i == 1:
                return max(nums[0], nums[1])
            
            if not i in memo:
                # Recurrence relation
                memo[i] = max(dp(i-1), dp(i-2) + nums[i])
            return memo[i]
        
        return dp(n - 1)
```

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        memo = collections.defaultdict(int)

        def dp(curr):
            # Base case
            if curr >= n:
                return 0
            
            if curr in memo:
                return memo[curr]
            
            # Recurrence relation: to skip or to rob the current house?
            # Skip, move on to the next house, not gaining any money from the current house
            skip = dp(curr + 1)
            # Take, mvoe on down to 2 houses over, take the money off the current house
            take = nums[curr] + dp(curr + 2)
            # What is the best decision though?
            memo[curr] = max(skip, take)
            return memo[curr]

        return dp(0)
```

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        memo = collections.defaultdict(int)
        
        def dp(i):
            # Base case
            if i >= n:
                return 0
            if i in memo:
                return memo[i]

            # Recurrence relation: 
            # Must always rob at least one house -> which house to rob at the beginning? 1 or 2?
            # If decide to rob current house, gain the money from the current house and go to 2 houses down
            # If decide to skip current house, gain no money from the current house, move to the next house
            memo[i] = max(dp(i + 1), dp(i + 2) + nums[i])
            return memo[i]

        return dp(0)
```


```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        # Bottom-Up DP (Tabulation)
        #### Time Complexity: O(N)
        if len(nums) == 1:
            return nums[0]

        memo = collections.defaultdict(int)
        memo[0], memo[1] = nums[0], max(nums[0], nums[1])

        for i in range(2, len(nums)):
            memo[i] = max(memo[i-1] , memo[i-2] + nums[i])

        return memo[len(nums)-1]
```

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)

        @lru_cache(None)
        def dp(i):
            # Base case
            if i < 0:
                return 0
            
            # Recurrence relation: to skip or to rob the current house?
            # Must always rob at least one house -> which house to rob at the beginning? 1 or 2?
            # If decide to rob current house, gain the money from the current house and go to 2 houses down
            # If decide to skip current house, gain no money from the current house, move to the next house
            return max(dp(i - 1), dp(i - 2) + nums[i])

        return dp(n - 1)
```

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

---

#### Bottom-Up Dynamic Programming with Tabulation

```Python
class Solution(object):
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # Dynamic Programming with Tabulation
        ans = 0
        if len(nums) <= 2:
            return max(nums)
        memo = [0] * len(nums)
        memo[0] = nums[0]
        memo[1] = max(nums[0], nums[1])
        for i in range(2, len(nums)):
            memo[i] = max(memo[i-1], memo[i-2] + nums[i])
        return memo[-1]
```

```Python
class Solution:
    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        dp = [0 for _ in range(n + 1)]
        
        # Base case
        '''
        dp[n - 1], dp[n - 2] = nums[n - 1], max(nums[n - 1], nums[n - 2])
        '''
        dp[n - 1] = nums[n - 1]

        # Recurrence relation
        for i in range(n - 2, -1, -1):
            dp[i] = max(dp[i + 1], dp[i + 2] + nums[i])

        return dp[0]
```

#### Iterative Bottom-Up Dynamic Programming

```Python
class Solution(object):
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # Iterative Dynamic Programming
        house1, house2 = 0, 0

        for gain in nums:
            tmp = house1
            house1 = max(house1, house2 + gain)
            house2 = tmp

        return house1
```

---

### Top-Down Recursive

```Python
class Solution(object):
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        """
        This particular problem and most of others can be approached using the following sequence:

        1. Find recursive relation
        2. Recursive (top-down)
        3. Recursive + memo (top-down)
        4. Iterative + memo (bottom-up)
        5. Iterative + N variables (bottom-up)        
        """
        # Top-Down Dynamic Programming
        def helper(houses, idx):
            if idx < 0:
                return 0
            return max(helper(houses, idx - 2) + houses[idx], helper(houses, idx - 1))
        return helper(nums, len(nums)-1)
```
