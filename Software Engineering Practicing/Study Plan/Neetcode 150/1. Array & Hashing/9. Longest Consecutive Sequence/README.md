## [128. Longest Consecutive Sequence](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Study%20Plan/Most%20Frequent/0128.%20Longest%20Consecutive%20Sequence)

```Python
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        num_set = set(nums)
        ans = 0

        for num in num_set:
            # Check if this is the new sequence
            if not (num - 1) in num_set:
                # Start incrementing the current consecutive sequence
                curr_num = num
                curr_len = 1
                while curr_num + 1 in num_set:
                    curr_num += 1
                    curr_len += 1
            
                ans = max(ans, curr_len)
        
        return ans
```
