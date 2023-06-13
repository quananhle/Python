## [673. Number of Longest Increasing Subsequence](https://leetcode.com/problems/number-of-longest-increasing-subsequence)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```nums```, return _the number of longest increasing subsequences_.

Notice that the sequence has to be __strictly__ increasing.

![image](https://github.com/quananhle/Python/assets/35042430/4410d0d9-46f5-43df-a6da-3e34c0506b32)

---

__Example 1:__
```
Input: nums = [1,3,5,4,7]
Output: 2
Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].
```

__Example 2:__
```
Input: nums = [2,2,2,2,2]
Output: 5
Explanation: The length of the longest increasing subsequence is 1, and there are 5 increasing subsequences of length 1, so output 5.
```

__Constraints:__

- ```1 <= nums.length <= 2000```
- ```-10^6 <= nums[i] <= 10^6```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def findNumberOfLIS(self, nums: List[int]) -> int:
        # Top-Down DP
        n = len(nums)
        memo = collections.defaultdict()

        def dp(curr, prev):
            # Base case:
            if curr == n:
                return 0, 1

            if (curr, prev) in memo:
                return memo[(curr, prev)]
            
            # Recurrence relations: to include or to not include the current number
            skip_length, skip_count = dp(curr + 1, prev)

            take_length = take_count = 0
            if prev is None or prev < nums[curr]:
                take_length, take_count = dp(curr + 1, nums[curr])
                take_length += 1

            # Get all the possible subsequences if their length are equal, e.g.: [1,3,5,4,7] -> [1, 3, 4, 7] and [1, 3, 5, 7]
            if take_length == skip_length:
                memo[(curr, prev)] = (take_length, take_count + skip_count)
            # Otherwise, get the number of longest increasing subsequences
            elif take_length > skip_length:
                memo[(curr, prev)] = (take_length, take_count)
            else:
                memo[(curr, prev)] = (skip_length, skip_count)
                
            return memo[(curr, prev)]

        _, ans = dp(0, None)
        return ans
```

```Python
class Solution:
    def findNumberOfLIS(self, nums: List[int]) -> int:
        # Top-Down DP
        n = len(nums)

        @functools.lru_cache(None)
        def dp(curr, prev):
            # Base case:
            if curr == n:
                return 0, 1
            
            # Recurrence relations: to include or to not include the current number
            skip_length, skip_count = dp(curr + 1, prev)

            take_length = take_count = 0
            if prev is None or prev < nums[curr]:
                take_length, take_count = dp(curr + 1, nums[curr])
                take_length += 1

            # Get all the possible subsequences if their length are equal, e.g.: [1,3,5,4,7] -> [1, 3, 4, 7] and [1, 3, 5, 7]
            if take_length == skip_length:
                return take_length, take_count + skip_count
            # Otherwise, get the number of longest increasing subsequences
            elif take_length > skip_length:
                return take_length, take_count
            else:
                return skip_length, skip_count

        _, ans = dp(0, None)
        return ans
```

#### Bottom-up Dynamic Programming (Memorization)

```Python
class Solution:
    def findNumberOfLIS(self, nums: List[int]) -> int:
        n = len(nums)
        ans = 0
        dp = [[1, 1] for _ in range(n)]

        for curr in range(n):
            for prev in range(curr):
                if nums[prev] < nums[curr]:
                    if dp[curr][0] < dp[prev][0] + 1:
                        dp[curr][0], dp[curr][1] = dp[prev][0] + 1, dp[prev][1]
                    elif dp[curr][0] == dp[prev][0] + 1:
                        dp[curr][1] += dp[prev][1]
            ans = max(ans, dp[curr][0])

        return sum(count for length, count in dp if length == ans)
```

```Python
class Solution:
    def findNumberOfLIS(self, nums: List[int]) -> int:
        n = len(nums)
        ans = 0
        dp = [[1, 1] for _ in range(n)]

        for curr, num in enumerate(nums):
            length, count = 1, 0
            for prev in range(curr):
                if nums[prev] < num:
                    length = max(length, dp[prev][0] + 1)
            for prev in range(curr):
                if dp[prev][0] == length - 1 and nums[prev] < num:
                    count += dp[prev][1]
            dp[curr] = [length, max(count, dp[curr][1])]
            ans = max(ans, length)
        
        return sum(count for length, count in dp if length == ans)
```
