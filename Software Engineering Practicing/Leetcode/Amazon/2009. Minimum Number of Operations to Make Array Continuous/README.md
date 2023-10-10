## [2009. Minimum Number of Operations to Make Array Continuous](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous)

```Tag```:

#### Difficulty: Hard

You are given an integer array ```nums```. In one operation, you can replace any element in ```nums``` with any integer.

```nums``` is considered continuous if both of the following conditions are fulfilled:

- All elements in ```nums``` are unique.
- The difference between the maximum element and the minimum element in ```nums``` equals ```nums.length - 1```.

For example, ```nums = [4, 2, 5, 3]``` is continuous, but ```nums = [1, 2, 3, 5, 6]``` is not continuous.

Return _the minimum number of operations to make ```nums``` continuous_.

![image](https://github.com/quananhle/Python/assets/35042430/5d0232bf-0ac3-4fed-a014-0c237db0e16d)

---

__Example 1:__
```
Input: nums = [4,2,5,3]
Output: 0
Explanation: nums is already continuous.
```

__Example 2:__
```
Input: nums = [1,2,3,5,6]
Output: 1
Explanation: One possible solution is to change the last element to 4.
The resulting array is [1,2,3,5,4], which is continuous.
```

__Example 3:__
```
Input: nums = [1,10,100,1000]
Output: 3
Explanation: One possible solution is to:
- Change the second element to 2.
- Change the third element to 3.
- Change the fourth element to 4.
The resulting array is [1,2,3,4], which is continuous.
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $1 \le nums[i] \le 10^9$

---
