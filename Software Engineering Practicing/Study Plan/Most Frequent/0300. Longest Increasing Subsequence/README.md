## [300. Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence)

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        n = len(nums)
        longest_increasing_subsequence = [nums[0]]

        for num in nums[1:]:
            i = 0
            if longest_increasing_subsequence[-1] < num:
                longest_increasing_subsequence.append(num)
            else:
                while longest_increasing_subsequence[i] < num:
                    i += 1
                longest_increasing_subsequence[i] = num

        return len(longest_increasing_subsequence)
```
