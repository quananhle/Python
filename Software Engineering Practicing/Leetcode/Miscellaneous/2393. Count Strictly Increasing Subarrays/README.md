## [2393. Count Strictly Increasing Subarrays](https://leetcode.com/problems/count-strictly-increasing-subarrays)

```Tag```: ```Dynamic Programming``` ```Greedy```

#### Difficulty: Medium

You are given an array ```nums``` consisting of positive integers.

Return _the number of subarrays of ```nums``` that are in strictly increasing order_.

A subarray is a contiguous part of an array.

---

__Example 1:__
```
Input: nums = [1,3,5,4,4,6]
Output: 10
Explanation: The strictly increasing subarrays are the following:
- Subarrays of length 1: [1], [3], [5], [4], [4], [6].
- Subarrays of length 2: [1,3], [3,5], [4,6].
- Subarrays of length 3: [1,3,5].
The total number of subarrays is 6 + 3 + 1 = 10.
```

__Example 2:__
```
Input: nums = [1,2,3,4,5]
Output: 15
Explanation: Every subarray is strictly increasing. There are 15 possible subarrays that we can take.
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $1 \le nums[i] \le 10^{6}$

---

### Greedy

```Python
class Solution:
    def countSubarrays(self, nums: List[int]) -> int:
        n = len(nums)
        # Subarray has at least 1 element
        ans = curr = 1

        for i in range(1, n):
            # Expand the size of the window if elements are strictly increasing
            if nums[i - 1] < nums[i]:
                curr += 1
            else:
                curr = 1
            ans += curr
        
        return ans
```
