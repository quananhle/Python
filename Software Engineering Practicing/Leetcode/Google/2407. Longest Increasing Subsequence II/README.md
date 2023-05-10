## [2407. Longest Increasing Subsequence II](https://leetcode.com/problems/longest-increasing-subsequence-ii/)

```Tag```: ```Segment Tree```

#### Difficulty: Hard

You are given an integer ```array``` nums and an integer __k__.

Find the longest subsequence of ```nums``` that meets the following requirements:

- The subsequence is __strictly increasing__ and
- The difference between adjacent elements in the subsequence is __at most__ ```k```.

Return _the length of the __longest subsequence__ that meets the requirements_.

A __subsequence__ is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

![image](https://github.com/quananhle/Python/assets/35042430/fedf17b5-0442-49e8-baaa-5d28fb3626e2)

---

__Example 1:__
```
Input: nums = [4,2,1,4,3,4,5,8,15], k = 3
Output: 5
Explanation:
The longest subsequence that meets the requirements is [1,3,4,5,8].
The subsequence has a length of 5, so we return 5.
Note that the subsequence [1,3,4,5,8,15] does not meet the requirements because 15 - 8 = 7 is larger than 3.
```

__Example 2:__
```
Input: nums = [7,4,5,1,8,12,4,7], k = 5
Output: 4
Explanation:
The longest subsequence that meets the requirements is [4,5,8,12].
The subsequence has a length of 4, so we return 4.
```

__Example 3:__
```
Input: nums = [1,5], k = 1
Output: 1
Explanation:
The longest subsequence that meets the requirements is [1].
The subsequence has a length of 1, so we return 1.
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>5</sup>
- 1 <= ```nums[i]```, ```k``` <= 10<sup>5</sup>

---
