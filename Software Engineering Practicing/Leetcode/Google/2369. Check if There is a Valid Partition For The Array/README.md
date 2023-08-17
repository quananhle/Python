## [2369. Check if There is a Valid Partition For The Array](https://leetcode.com/problems/check-if-there-is-a-valid-partition-for-the-array/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```nums```. You have to partition the array into one or more __contiguous__ subarrays.

We call a partition of the array valid if each of the obtained subarrays satisfies one of the following conditions:

1. The subarray consists of exactly ```2``` equal elements. For example, the subarray ```[2,2]``` is good.
2. The subarray consists of exactly ```3``` equal elements. For example, the subarray ```[4,4,4]``` is good.
3. The subarray consists of exactly ```3``` consecutive increasing elements, that is, the difference between adjacent elements is ```1```. For example, the subarray ```[3,4,5]``` is good, but the subarray ```[1,3,5]``` is not.

Return _```true``` if the array has at least one valid partition_. Otherwise, return ```false```.

![image](https://github.com/quananhle/Python/assets/35042430/b23bd353-71a9-4510-b98a-f3f69644b792)

---

__Example 1:__
```
Input: nums = [4,4,4,5,6]
Output: true
Explanation: The array can be partitioned into the subarrays [4,4] and [4,5,6].
This partition is valid, so we return true.
```

__Example 2:__
```
Input: nums = [1,1,1,2]
Output: false
Explanation: There is no valid partition for this array.
```

__Constraints:__

- $2 \le nums.length \le 10^{5}$
- $1 \le nums[i] \le 10^{6}$

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        memo = collections.defaultdict(int)

        def dp(curr):
            # Base case
            if curr == n:
                return True
            
            if curr in memo:
                return memo[curr]

            # Condition 1: subarray consists of exactly 2 equal elements
            if curr < n - 1:
                if nums[curr] == nums[curr + 1]:
                    if dp(curr + 2):
                        memo[curr] = True
                        return memo[curr]

            # Condition 2 & 3: subarray consists of exactly 3 elements
            if curr < n - 2:
                # Equal elements
                if nums[curr] == nums[curr + 1] == nums[curr + 2]:
                    if dp(curr + 3):
                        memo[curr] = True
                        return memo[curr]


                # Consecutive increasing elements
                if nums[curr] == nums[curr + 1] - 1 == nums[curr + 2] - 2:
                    if dp(curr + 3):
                        memo[curr] = True
                        return memo[curr]

            memo[curr] = False
            return memo[curr]

        return dp(0)
```

```Python
class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        # If reached the last elements in num, partition is valid
        memo = {-1: True}

        def dp(curr):
            ans = False

            if curr in memo:
                return memo[curr]

            # Condition 1: subarray consists of exactly 2 equal elements
            if curr > 0:
                if nums[curr] == nums[curr - 1]:
                    ans |= dp(curr - 2)

            # Condition 2 & 3: subarray consists of exactly 3 elements
            if curr > 1:
                # Equal elements
                if nums[curr] == nums[curr - 1] == nums[curr - 2]:
                    ans |= dp(curr - 3)

                # Consecutive increasing elements
                if nums[curr] == nums[curr - 1] + 1 == nums[curr - 2] + 2:
                    ans |= dp(curr - 3)

            memo[curr] = ans
            return ans

        return dp(n - 1)
```

```Python
class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)

        @lru_cache(maxsize=None)
        def dp(curr):
            # Base case
            if curr == n:
                return True
            
            # Condition 1: subarray consists of exactly 2 equal elements
            if curr < n - 1:
                if nums[curr] == nums[curr + 1]:
                    if dp(curr + 2):
                        return True 

            # Condition 2 & 3: subarray consists of exactly 3 elements
            if curr < n - 2:
                # Equal elements
                if nums[curr] == nums[curr + 1] == nums[curr + 2]:
                    if dp(curr + 3):
                        return True

                # Consecutive increasing elements
                if nums[curr] == nums[curr + 1] - 1 == nums[curr + 2] - 2:
                    if dp(curr + 3):
                        return True
                    
            return False

        return dp(0)
```

#### Bottom-Up Dynamic Programming

```Python
        n = len(nums)
        dp = [False] * n + [True]

        for curr in range(n - 1, -1, -1):
            if curr < n - 1 and nums[curr] == nums[curr + 1]:
                if dp[curr + 2]:
                    dp[curr] = True
            if curr < n - 2 and nums[curr] == nums[curr + 1] == nums[curr + 2]:
                if dp[curr + 3]:
                    dp[curr] = True
            if curr < n - 2 and nums[curr] == nums[curr + 1] - 1 == nums[curr + 2] - 2:
                if dp[curr + 3]:
                    dp[curr] = True

        return dp[0]
```

```Python
class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        dp = [False] * n + [True]

        for curr in range(n - 1, -1, -1):
            if curr < n - 1 and nums[curr] == nums[curr + 1]:
                dp[curr] |= dp[curr + 2]
            if curr < n - 2 and nums[curr] == nums[curr + 1] == nums[curr + 2]:
                dp[curr] |= dp[curr + 3]
            if curr < n - 2 and nums[curr] == nums[curr + 1] - 1 == nums[curr + 2] - 2:
                dp[curr] |= dp[curr + 3]

        return dp[0]
```

```Python
class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        dp = [True] + [False] * n

        for curr in range(n):
            if curr > 0 and nums[curr] == nums[curr - 1]:
                dp[curr + 1] |= dp[curr - 1]
            if curr > 1 and nums[curr] == nums[curr - 1] == nums[curr - 2]:
                dp[curr + 1] |= dp[curr - 2]
            if curr > 1 and nums[curr] == nums[curr - 1] + 1 == nums[curr - 2] + 2:
                dp[curr + 1] |= dp[curr - 2]

        return dp[n]
```

#### Space Optimized Bottom-Up Dynamic Programming

```Python
class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        dp = [True] + [False] * 2

        for curr in range(n):
            i = curr + 1
            ans = False
            if curr > 0 and nums[curr] == nums[curr - 1]:
                ans |= dp[(i - 2) % 3]
            if curr > 1 and nums[curr] == nums[curr - 1] == nums[curr - 2]:
                ans |= dp[(i - 3) % 3]
            if curr > 1 and nums[curr] == nums[curr - 1] + 1 == nums[curr - 2] + 2:
                ans |= dp[(i - 3) % 3]

            dp[i % 3] = ans
        return dp[n % 3]
```
