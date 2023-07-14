## [1218. Longest Arithmetic Subsequence of Given Difference](https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```arr``` and an integer ```difference```, return _the length of the longest subsequence in ```arr``` which is an arithmetic sequence such that the difference between adjacent elements in the subsequence equals ```difference```_.

A __subsequence__ is a sequence that can be derived from ```arr``` by deleting some or no elements without changing the order of the remaining elements.

![image](https://github.com/quananhle/Python/assets/35042430/f087ee92-1946-4b83-a9ae-a025cb3c75db)

---

__Example 1:__
```
Input: arr = [1,2,3,4], difference = 1
Output: 4
Explanation: The longest arithmetic subsequence is [1,2,3,4].
```

__Example 2:__
```
Input: arr = [1,3,5,7], difference = 1
Output: 1
Explanation: The longest arithmetic subsequence is any single element.
```

__Example 3:__
```
Input: arr = [1,5,7,8,5,3,4,2,1], difference = -2
Output: 4
Explanation: The longest arithmetic subsequence is [7,5,3,1].
```

__Constraints:__

- $1 <= arr.length <= 10^{5}$
- $-10^{4} <= arr[i], difference <= 10^{4}$

---

### The Framework

#### Top-Down Dynamic Programming (Recursive)

```Python
class Solution:
    def longestSubsequence(self, arr: List[int], difference: int) -> int:
        n = len(arr)

        @lru_cache(None)
        def dp(curr, prev):
            # Base case
            if curr >= n:
                return 0

            take = skip = 0
            skip = dp(curr + 1, prev)

            if prev == float('-inf'):
                take = 1 + dp(curr + 1, arr[curr])
            else:
                if arr[curr] - prev == difference:
                    take = 1 + dp(curr + 1, arr[curr])
            
            return max(skip, take)

        return dp(0, float('-inf'))
```

#### Bottom-Up Dynamic Programming (Iterative)

```Python
class Solution:
    def longestSubsequence(self, arr: List[int], difference: int) -> int:
        n = len(arr)
        dp = collections.defaultdict(int)
        ans = 1

        for curr in range(n):
            num = arr[curr]
            if num - difference in dp:
                dp[num] = dp[num - difference] + 1
            else:
                dp[num] = 1
            
            ans = max(ans, dp[num])
        
        return ans
```
