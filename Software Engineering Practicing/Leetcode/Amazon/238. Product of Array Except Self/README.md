## [238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self)

```Tag```: ```Array & String``` ```Prefix Sum``` ```Two Pointers```

#### Difficulty: Medium

Given an integer array ```nums```, return _an array answer such that ```answer[i]``` is equal to the product of all the elements of nums except ```nums[i]```_.

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in ```O(n)``` time and without using the division operation.

![image](https://github.com/quananhle/Python/assets/35042430/3275f60a-7429-4d7f-9a4a-5a3ab832b6fa)

---

__Example 1:__
```
Input: nums = [1,2,3,4]
Output: [24,12,8,6]
```

__Example 2:__
```
Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]
```

__Constraints:__

- $2 <= nums.length <= 10^5$
- $-30 \le nums[i] \le 30$
- The product of any prefix or suffix of ```nums``` is guaranteed to fit in a 32-bit integer.
 
__Follow up__: Can you solve the problem in ```O(1)``` extra space complexity? (The output array does not count as extra space for space complexity analysis.)

---

### Brute Force

- __Time complexity__: $O(N^2)$
- __Space complexity__: $O(N)$

```Python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        res = [0] * n

        for i, num in enumerate(nums):
            res[i] = math.prod([e for j, e in enumerate(nums) if i != j])
        
        return res
```

### Left & Right Product Lists

![image](https://leetcode.com/problems/product-of-array-except-self/Figures/238/diag-1.png)

![image](https://leetcode.com/problems/product-of-array-except-self/Figures/238/products.png)

- __Time complexity__: ```O(N)```
- __Space complexity__: ```O(N)```

```Python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        left, right, res = [0] * n, [0] * n, [0] * n
        
        # For the element at index '0', there are no elements to the left, so the left[0] = 1
        left[0] = 1
        for i in range(1, n):
            left[i] = left[i - 1] * nums[i - 1]

        # For the element at last index, there are no elements to the right, so the right[n - 1] = 1
        right[n - 1] = 1
        for i in range(n - 2, -1, -1):
            right[i] = right[i + 1] * nums[i + 1]

        for i in range(n):
            res[i] = left[i] * right[i]
        
        return res
```

### Optimized Space Left and Right

- __Time complexity__: ```O(N)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        res = [0] * n
        
        # For the element at index '0', there are no elements to the left, so the res[0] = 1
        res[0] = 1
        for i in range(1, n):
            res[i] = res[i - 1] * nums[i - 1]

        right = 1
        for i in range(n - 1, -1, -1):
            res[i] = right * res[i]
            right = right * nums[i]

        return res
```
