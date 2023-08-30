## [2366. Minimum Replacements to Sort the Array](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/)

```Tag```: ``````

#### Difficulty: Hard

You are given a __0-indexed__ integer array ```nums```. In one operation you can replace any element of the array with any two elements that sum to it.

- For example, consider ```nums = [5,6,7]```. In one operation, we can replace ```nums[1]``` with ```2``` and ```4``` and convert ```nums``` to ```[5,2,4,7]```.

Return _the minimum number of operations to make an array that is sorted in non-decreasing order_.
 
![image](https://github.com/quananhle/Python/assets/35042430/eae5dce1-3661-4520-98d7-d719f524c18b)

---

__Example 1:__
```
Input: nums = [3,9,3]
Output: 2
Explanation: Here are the steps to sort the array in non-decreasing order:
- From [3,9,3], replace the 9 with 3 and 6 so the array becomes [3,3,6,3]
- From [3,3,6,3], replace the 6 with 3 and 3 so the array becomes [3,3,3,3,3]
There are 2 steps to sort the array in non-decreasing order. Therefore, we return 2.
```

__Example 2:__
```
Input: nums = [1,2,3,4,5]
Output: 0
Explanation: The array is already in non-decreasing order. Therefore, we return 0. 
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $1 \le nums[i] \le 10^{9}$

---
