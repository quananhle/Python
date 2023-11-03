## [1909. Remove One Element to Make the Array Strictly Increasing](https://leetcode.com/problems/remove-one-element-to-make-the-array-strictly-increasing)

```Tag```: ```Array & String```

#### Difficulty: Easy

Given a 0-indexed integer array ```nums```, return _```True``` if it can be made strictly increasing after removing exactly one element_, or _```False``` otherwise. If the array is already strictly increasing, return ```True```_.

The array ```nums``` is strictly increasing if $nums[i - 1] \lt nums[i]$ for each index ($1 \le i \lt nums.length$).

---

__Example 1__:
```
Input: nums = [1,2,10,5,7]
Output: true
Explanation: By removing 10 at index 2 from nums, it becomes [1,2,5,7].
[1,2,5,7] is strictly increasing, so return true.
```

__Example 2__:
```
Input: nums = [2,3,1,2]
Output: false
Explanation:
[3,1,2] is the result of removing the element at index 0.
[2,1,2] is the result of removing the element at index 1.
[2,3,2] is the result of removing the element at index 2.
[2,3,1] is the result of removing the element at index 3.
No resulting array is strictly increasing, so return false.
```

__Example 3:__
```
Input: nums = [1,1,1]
Output: false
Explanation: The result of removing any element is [1,1].
[1,1] is not strictly increasing, so return false.
```
 

__Constraints:__

- $2 \le nums.length \le 1000$
- $1 \le nums[i] \le 1000$

---
