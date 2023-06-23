## [1027. Longest Arithmetic Subsequence](https://leetcode.com/problems/longest-arithmetic-subsequence/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an array ```nums``` of integers, return _the length of the longest arithmetic subsequence in ```nums```_.

Note that:

- A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.
- A sequence ```seq``` is arithmetic if ```seq[i + 1] - seq[i]``` are all the same value (for ```0 <= i < seq.length - 1```).

![image](https://github.com/quananhle/Python/assets/35042430/91223a7e-c5f4-4266-abb3-e2e1d0f9f451)

---

__Example 1:__
```
Input: nums = [3,6,9,12]
Output: 4
Explanation:  The whole array is an arithmetic sequence with steps of length = 3.
```

__Example 2:__
```
Input: nums = [9,4,7,2,10]
Output: 3
Explanation:  The longest arithmetic subsequence is [4,7,10].
```

__Example 3:__
```
Input: nums = [20,1,15,3,10,5,8]
Output: 4
Explanation:  The longest arithmetic subsequence is [20,15,10,5].
```

__Constraints:__

- ```2 <= nums.length <= 1000```
- ```0 <= nums[i] <= 500```

---

### The Template

#### Top-Down Dynamic Programming

```Python
class Solution:
    def longestArithSeqLength(self, nums: List[int]) -> int:
        n = len(nums)

        @lru_cache(None)
        def dp(i, step):
            length = 1

            for j in range(i + 1, n):
                if step is None or step == nums[j] - nums[i]:
                    length = max(length, 1 + dp(j, nums[j] - nums[i]))
            
            return length
        

        ans = float('-inf')
        for curr in range(n):
            ans = max(ans, dp(curr, None))
        
        return ans
```
