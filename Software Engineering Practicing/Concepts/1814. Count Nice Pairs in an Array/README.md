## [1814. Count Nice Pairs in an Array](https://leetcode.com/problems/count-nice-pairs-in-an-array)

```Tag```:

#### Difficulty: Medium

You are given an array ```nums``` that consists of non-negative integers. Let us define ```rev(x)``` as the reverse of the non-negative integer ```x```. For example, ```rev(123) = 321```, and ```rev(120) = 21```. A pair of indices ```(i, j)``` is nice if it satisfies all of the following conditions:

- $0 <= i \lt j \lt nums.length$
- $nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])$

Return _the number of nice pairs of indices_. Since that number can be too large, return it modulo $10^9 + 7$.

---
