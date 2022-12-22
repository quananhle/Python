## 494. Target Sum

```Tag```: [```Depth-First Search```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Queue%20%26%20Stack/Depth-First%20Search/494.%20Target%20Sum) [```Dynamic Programming```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/494.%20Target%20Sum)

### Difficulty: Medium

You are given an integer array ```nums``` and an integer ```target```.

You want to build an __expression__ out of nums by adding one of the symbols ```'+'``` and ```'-'``` before each integer in nums and then concatenate all the integers.

- For example, if ```nums = [2, 1]```, you can add a ```'+'``` before ```2``` and a ```'-'``` before ```1``` and concatenate them to build the expression ```"+2-1"```.

Return _the number of different expressions that you can build, which evaluates to ```target```_.

![image](https://user-images.githubusercontent.com/35042430/209069887-c4436b2d-64b5-4a81-84a0-d04dc2fa3e6a.png)

---

__Example 1:__
```
Input: nums = [1,1,1,1,1], target = 3
Output: 5
Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
-1 + 1 + 1 + 1 + 1 = 3
+1 - 1 + 1 + 1 + 1 = 3
+1 + 1 - 1 + 1 + 1 = 3
+1 + 1 + 1 - 1 + 1 = 3
+1 + 1 + 1 + 1 - 1 = 3
```

__Example 2:__
```
Input: nums = [1], target = 1
Output: 1
```

__Constraints:__
```
1 <= nums.length <= 20
0 <= nums[i] <= 1000
0 <= sum(nums[i]) <= 1000
-1000 <= target <= 1000
```

---

### Bottom-Up Dynamic Programming with 2D Tabulation

```Python
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        # Bottom-Up Dynamic Programming with 2D Tabulation
        #### Time Complexity: O(N * M), nested loops
        #### Space Complexity: O(N * M), size of DP
        dp = [[0] * (2 * sum(nums) + 1) for _ in range(len(nums))]
        dp[0][nums[0] + sum(nums)] = 1
        dp[0][-nums[0] + sum(nums)] += 1
        
        for i in range(1, len(nums)):
            for total in range(-sum(nums), sum(nums)+1):
                if dp[i-1][sum(nums) + total] > 0:
                    dp[i][total + nums[i] + sum(nums)] += dp[i-1][sum(nums) + total]
                    dp[i][total - nums[i] + sum(nums)] += dp[i-1][sum(nums) + total]
        return dp[-1][target + sum(nums)] if abs(target) <= sum(nums) else 0
```

### Bottom-Up Dynamic Programming with 1D Tabulation

```Python
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:        
        # Bottom-Up Dynamic Programming with 1D Tabulation
        #### Time Complexity: O(N * M), nested loops
        #### Space Complexity: O(N), 2 DP size N
        dp = [0] * (2 * sum(nums) + 1)
        dp[nums[0] + sum(nums)] = 1
        dp[-nums[0] + sum(nums)] += 1
        
        for i in range(1, len(nums)):
            next_dp = [0] * (2 * sum(nums) + 1)
            for total in range(-sum(nums), sum(nums)+1):
                if dp[sum(nums) + total] > 0:
                    next_dp[total + nums[i] + sum(nums)] += dp[sum(nums) + total]
                    next_dp[total - nums[i] + sum(nums)] += dp[sum(nums) + total]
            dp = next_dp
        return dp[target + sum(nums)] if abs(target) <= sum(nums) else 0        
```
