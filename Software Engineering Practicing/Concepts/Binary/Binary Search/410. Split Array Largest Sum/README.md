## [410. Split Array Largest Sum](https://leetcode.com/problems/split-array-largest-sum)

```Tag```: ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Hard

Given an integer array ```nums``` and an integer ```k```, split ```nums``` into ```k``` non-empty subarrays such that the largest sum of any subarray is __minimized__.

Return _the minimized largest sum of the split_.

A __subarray__ is a contiguous part of the array.

![image](https://user-images.githubusercontent.com/35042430/235842765-f101076e-9396-4bb8-b4c8-0afe419864f6.png)

---

__Example 1:__
```
Input: nums = [7,2,5,10,8], k = 2
Output: 18
Explanation: There are four ways to split nums into two subarrays.
The best way is to split it into [7,2,5] and [10,8], where the largest sum among the two subarrays is only 18.
```

__Example 2:__
```
Input: nums = [1,2,3,4,5], k = 2
Output: 9
Explanation: There are four ways to split nums into two subarrays.
The best way is to split it into [1,2,3] and [4,5], where the largest sum among the two subarrays is only 9.
```

__Constraints:__

- ```1 <= nums.length <= 1000```
- 0 <= ```nums[i]``` <= 10<sup>6</sup>
- ```1 <= k <= min(50, nums.length)```

---
