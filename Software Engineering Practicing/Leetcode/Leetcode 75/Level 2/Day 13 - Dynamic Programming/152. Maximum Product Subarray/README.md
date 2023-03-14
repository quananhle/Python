## [152. Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```nums```, find a subarray that has the largest product, and return _the product_.

The test cases are generated so that the answer will fit in a __32-bit__ integer.

![image](https://user-images.githubusercontent.com/35042430/225079877-f31a8e76-defe-4239-9cb6-f6ea003b6bbe.png)

---

__Example 1:__
```
Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
```

__Example 2:__
```
Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
```

__Constraints:__

- 1 <= ```nums.length``` <= 2 * 10<sup>4</sup>
- ```10 <= nums[i] <= 10```
- The product of any prefix or suffix of nums is guaranteed to fit in a __32-bit__ integer.

---

### Brute Force

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        # Brute Force
        n = len(nums)

        ans = -float('inf')

        for i in range(n):
            curr = 1
            for j in range(i, n):
                curr *= nums[j]
                ans = max(ans, curr)
        
        return ans
```

```Python
import numpy 
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        # Brute Force
        n = len(nums)
        ans = -float('inf')
        for start in range(n):
            for end in range(start + 1, n + 1):
                ans = max(ans, numpy.prod(nums[start:end]))
        
        return ans
```


```Python


```
