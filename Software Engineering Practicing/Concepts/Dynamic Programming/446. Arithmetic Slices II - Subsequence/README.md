## [446. Arithmetic Slices II - Subsequence](https://leetcode.com/problems/arithmetic-slices-ii-subsequence)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given an integer array ```nums```, return _the number of all the __arithmetic subsequences__ of ```nums```_.

A sequence of numbers is called arithmetic if it consists of __at least three elements__ and if the difference between any two consecutive elements is the same.

- For example, ```[1, 3, 5, 7, 9]```, ```[7, 7, 7, 7]```, and ```[3, -1, -5, -9]``` are arithmetic sequences.
- For example, ```[1, 1, 2, 5, 7]``` is not an arithmetic sequence.

A subsequence of an array is a sequence that can be formed by removing some elements (possibly none) of the array.

- For example, ```[2,5,10]``` is a subsequence of ```[1,2,1,2,4,1,5,10]```.

The test cases are generated so that the answer fits in __32-bit__ integer.

![image](https://github.com/quananhle/Python/assets/35042430/5fa51195-59d3-45ba-83e8-d8fb3256470e)

---

__Example 1:__
```
Input: nums = [2,4,6,8,10]
Output: 7
Explanation: All arithmetic subsequence slices are:
[2,4,6]
[4,6,8]
[6,8,10]
[2,4,6,8]
[4,6,8,10]
[2,4,6,8,10]
[2,6,10]
```

__Example 2:__
```
Input: nums = [7,7,7,7,7]
Output: 16
Explanation: Any subsequence of this array is arithmetic.
```

__Constraints:__

- $1 \le nums.length \le 1000$
- $-2^{31} \le nums[i] \le 2^{31} - 1$

---
