## [1063. Number of Valid Subarrays](https://leetcode.com/problems/number-of-valid-subarrays)

```Tag```: ```Stack``` ```Monotonic Stack```

#### Difficulty: Hard

Given an integer array ```nums```, return _the number of non-empty subarrays with the leftmost element of the subarray not larger than other elements in the subarray_.

A subarray is a contiguous part of an array.

---

__Example 1:__
```
Input: nums = [1,4,2,5,3]
Output: 11
Explanation: There are 11 valid subarrays: [1],[4],[2],[5],[3],[1,4],[2,5],[1,4,2],[2,5,3],[1,4,2,5],[1,4,2,5,3].
```

__Example 2:__
```
Input: nums = [3,2,1]
Output: 3
Explanation: The 3 valid subarrays are: [3],[2],[1].
```

__Example 3:__
```
Input: nums = [2,2,2]
Output: 6
Explanation: There are 6 valid subarrays: [2],[2],[2],[2,2],[2,2],[2,2,2].
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^{4}$
- $0 \le nums[i] \le 10^{5}$

---