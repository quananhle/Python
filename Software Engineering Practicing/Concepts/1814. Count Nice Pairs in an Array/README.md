## [1814. Count Nice Pairs in an Array](https://leetcode.com/problems/count-nice-pairs-in-an-array)

```Tag```:

#### Difficulty: Medium

You are given an array ```nums``` that consists of non-negative integers. Let us define ```rev(x)``` as the reverse of the non-negative integer ```x```. For example, ```rev(123) = 321```, and ```rev(120) = 21```. A pair of indices ```(i, j)``` is nice if it satisfies all of the following conditions:

- $0 <= i \lt j \lt nums.length$
- $nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])$

Return _the number of nice pairs of indices_. Since that number can be too large, return it modulo $10^9 + 7$.

---

__Example 1:__
```
Input: nums = [42,11,1,97]
Output: 2
Explanation: The two pairs are:
 - (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
 - (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.
```

__Example 2:__
```
Input: nums = [13,10,35,24,76]
Output: 4
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $0 \le nums[i] \le 10^9$

---
