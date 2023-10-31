## [217. Contains Duplicate](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/217.%20Contains%20Duplicate)

```Python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        seen = set()
        for num in nums:
            if not num in seen: seen.add(num)
            else: return True
        return False
```
