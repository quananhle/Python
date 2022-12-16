## 198. House Robber

#### Difficulty: Medium

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and __it will automatically contact the police if two adjacent houses were broken into on the same night.__

Given an integer array ```nums``` representing the amount of money of each house, return _the maximum amount of money you can rob tonight __without alerting the police___.

![image](https://user-images.githubusercontent.com/35042430/207699709-9884864b-7665-4dd1-b858-09ce130f98af.png)

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
class Solution(object):
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # Iterative Dynamic Programming
        house1, house2 = 0, 0
        for num in nums:
            tmp = house1
            house1 = max(house2 + num, house1)
            house2 = tmp
        return house1
```
