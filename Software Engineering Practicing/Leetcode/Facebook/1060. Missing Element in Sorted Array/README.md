## [1060. Missing Element in Sorted Array](https://leetcode.com/problems/missing-element-in-sorted-array/)

```Tag```:

#### Difficulty: Medium

Given an integer array nums which is sorted in ascending order and all of its elements are unique and given also an integer k, return the kth missing number starting from the leftmost number of the array.

![image](https://github.com/quananhle/Python/assets/35042430/43e2a7dc-3321-4c3b-b028-e1ae32b4b13f)

---

__Example 1:__
```
Input: nums = [4,7,9,10], k = 1
Output: 5
Explanation: The first missing number is 5.
```

__Example 2:__
```
Input: nums = [4,7,9,10], k = 3
Output: 8
Explanation: The missing numbers are [5,6,8,...], hence the third missing number is 8.
```

__Example 3:__
```
Input: nums = [1,2,4], k = 3
Output: 6
Explanation: The missing numbers are [3,5,6,7,...], hence the third missing number is 6.
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^{4}
- $1 \le nums[i] \le 10^{7}$
nums is sorted in ascending order, and all the elements are unique.
1 <= k <= 108
 

__Follow up__: Can you find a logarithmic time complexity (i.e., ```O(log(n))```) solution?

---
