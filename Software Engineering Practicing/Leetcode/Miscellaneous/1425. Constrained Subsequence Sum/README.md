## [1425. Constrained Subsequence Sum](https://leetcode.com/problems/constrained-subsequence-sum)

```Tag```:

#### Difficulty: Hard

Given an integer array ```nums``` and an integer ```k```, return _the maximum sum of a non-empty subsequence of that array such that for every two consecutive integers in the subsequence, ```nums[i]``` and ```nums[j]```, where ```i < j```, the condition ```j - i <= k``` is satisfied_.

A subsequence of an array is obtained by deleting some number of elements (can be zero) from the array, leaving the remaining elements in their original order.

---

__Example 1:__
```
Input: nums = [10,2,-10,5,20], k = 2
Output: 37
Explanation: The subsequence is [10, 2, 5, 20].
```

__Example 2:__
```
Input: nums = [-1,-2,-3], k = 1
Output: -1
Explanation: The subsequence must be non-empty, so we choose the largest number.
```

__Example 3:__
```
Input: nums = [10,-2,-10,-5,20], k = 2
Output: 23
Explanation: The subsequence is [10, -2, -5, 20].
```

__Constraints:__

- $1 \le k \le nums.length \le 10^5$
- $-10^4 \le nums[i] \le 10^4$

---
