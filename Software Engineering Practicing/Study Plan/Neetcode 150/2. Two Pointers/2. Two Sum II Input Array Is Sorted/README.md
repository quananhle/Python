## [167. Two Sum II - Input Array Is Sorted](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/167.%20Two%20Sum%20II%20-%20Input%20Array%20Is%20Sorted)

```Python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        n = len(numbers)
        lo, hi = 0, n - 1
        while lo < hi:
            num = numbers[lo] + numbers[hi]
            if num < target:
                lo += 1
            elif num > target:
                hi -= 1
            elif num == target:
                return [lo + 1, hi + 1]
```
