## [Two Sum](https://leetcode.com/problems/two-sum)

```Python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        memo = collections.defaultdict(int)

        for i, num in enumerate(nums):
            if num in memo:
                return [i, memo[num]]
            memo[target - num] = i
```
