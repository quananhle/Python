## [Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self)

```Python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        left_prod, right_prod, res = [1] * n, [1] * n, [1] * n

        for i in range(1, n):
            left_prod[i] = left_prod[i - 1] * nums[i - 1]

        for i in range(n - 2, -1, -1):
            right_prod[i] = right_prod[i + 1] * nums[i + 1]

        return [left_prod[i] * right_prod[i] for i in range(n)]
```
