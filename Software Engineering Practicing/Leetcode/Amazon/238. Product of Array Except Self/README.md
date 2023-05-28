## [238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self)

```Tag```:

#### Difficulty: Medium

Given an integer array ```nums```, return _an array answer such that ```answer[i]``` is equal to the product of all the elements of nums except ```nums[i]```_.

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in ```O(n)``` time and without using the division operation.

![image](https://github.com/quananhle/Python/assets/35042430/3958750d-477c-48ca-853d-a2025852dfa7)

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

- ```2 <= nums.length <= 10^5```
- -30 <= nums[i] <= 30```
- The product of any prefix or suffix of ```nums``` is guaranteed to fit in a 32-bit integer.
 
__Follow up__: Can you solve the problem in ```O(1)``` extra space complexity? (The output array does not count as extra space for space complexity analysis.)

---
