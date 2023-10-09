## [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Given an array of integers ```nums``` sorted in non-decreasing order, find the starting and ending position of a given ```target``` value.

If ```target``` is not found in the array, return ```[-1, -1]```.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://github.com/quananhle/Python/assets/35042430/867c2e15-04d2-4bbb-85d1-d96ae81fc9f0)

---

__Example 1:__
```
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
```

__Example 2:__
```
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
```

__Example 3:__
```
Input: nums = [], target = 0
Output: [-1,-1]
```

__Constraints:__

- $0 \le nums.length \le 10^5$
- $-10^9 \le nums[i] \le 10^9$
- ```nums``` is a non-decreasing array.
- $-10^9 \le target \le 10^9$

---
