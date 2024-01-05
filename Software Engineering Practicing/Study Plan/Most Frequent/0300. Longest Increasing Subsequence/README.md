## [300. Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence)

```Tag```: ```Dynamic Programming``` ```Two-Pointer Technique``` ```Binary Search``` ```Monotonic Stack```

#### Difficulty: Medium

Given an integer array ```nums```, return _the length of the longest __strictly increasing subsequence___.

![image](https://github.com/quananhle/Python/assets/35042430/989542c4-68ec-47b6-93bd-43a32a3b90ee)

--- 

__Example 1:__
```
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
```

__Example 2:__
```
Input: nums = [0,1,0,3,2,3]
Output: 4
```

__Example 3:__
```
Input: nums = [7,7,7,7,7,7,7]
Output: 1
```

__Constraints:__

- $1 \le nums.length \le 2500$
- $-10^4 \le nums[i] \le 10^4$

---

### Build Longest Increasing Subsequence

#### Two-Pointer Technique + Linear Search

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        longest_increasing_subsequence = [nums[0]]

        for num in nums[1:]:
            idx = 0

            if longest_increasing_subsequence[-1] < num:
                longest_increasing_subsequence.append(num)
            else:
                while longest_increasing_subsequence[idx] < num:
                    idx += 1
                longest_increasing_subsequence[idx] = num

        return len(longest_increasing_subsequence)
```

#### Optimization Using Binary Search

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        longest_increasing_subsequence = [nums[0]]

        for num in nums[1:]:
            idx = 0

            if num <= longest_increasing_subsequence[-1]:
                pos = bisect.bisect_left(longest_increasing_subsequence, num)
                longest_increasing_subsequence[pos] = num
            else:
                longest_increasing_subsequence.append(num)
            
        return len(longest_increasing_subsequence)
```

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        longest_increasing_subsequence = [nums[0]]

        for num in nums[1:]:
            idx = 0

            if num <= longest_increasing_subsequence[-1]:
                lo, hi = 0, len(longest_increasing_subsequence) - 1
                while lo < hi:
                    mi = lo + (hi - lo) // 2
                    pivot = longest_increasing_subsequence[mi]
                    if num <= pivot:
                        hi = mi
                    else:
                        lo = mi + 1
                longest_increasing_subsequence[hi] = num
            else:
                longest_increasing_subsequence.append(num)
            
        return len(longest_increasing_subsequence)
```

---

### Dynamic Programming

#### Top-Down Dynamic Programming (Memory Limit Exceeded)

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        memo = collections.defaultdict(int)

        def dp(i, prev):
            # Base case
            if i == n:
                return 0

            if (i, prev) in memo:
                return memo[(i, prev)]
            
            skip = take = 0
            skip = dp(i + 1, prev)

            if not prev or prev < nums[i]:
                take = 1 + dp(i + 1, nums[i])

            memo[(i, prev)] = max(take, skip)
            return memo[(i, prev)]
        
        return dp(0, None)
```

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        @functools.lru_cache(maxsize=None)
        def dp(i, prev):
            # Base case
            if i == n:
                return 0
            
            skip = take = 0
            skip = dp(i + 1, prev)

            if not prev or prev < nums[i]:
                take = 1 + dp(i + 1, nums[i])

            return max(take, skip)
        
        return dp(0, None)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        n = len(nums)
        dp = [1] * (n)

        for i in range(n - 2, -1, -1):
            for j in range(i, n):
                if nums[i] < nums[j]:
                    dp[i] = max(dp[i], dp[j] + 1)

        return max(dp)
```
