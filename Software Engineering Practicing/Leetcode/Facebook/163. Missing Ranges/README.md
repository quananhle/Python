## [163. Missing Ranges](https://leetcode.com/problems/missing-ranges)

```Tag```: ```Array & String```

#### Difficulty: Easy

You are given an inclusive range ```[lower, upper]``` and a __sorted unique__ integer array ```nums```, where all elements are within the inclusive range.

A number ```x``` is considered missing if ```x``` is in the range ```[lower, upper]``` and ```x``` is not in ```nums```.

Return _the shortest sorted list of ranges that exactly covers all the missing numbers_. That is, no element of ```nums``` is included in any of the ranges, and each missing number is covered by one of the ranges.

![image](https://github.com/quananhle/Python/assets/35042430/18828dad-fba7-4db6-8064-b82caddbefb5)

---

__Example 1:__
```
Input: nums = [0,1,3,50,75], lower = 0, upper = 99
Output: [[2,2],[4,49],[51,74],[76,99]]
Explanation: The ranges are:
[2,2]
[4,49]
[51,74]
[76,99]
```

__Example 2:__
```
Input: nums = [-1], lower = -1, upper = -1
Output: []
Explanation: There are no missing ranges since there are no missing numbers.
```

__Constraints:__

- ```-10^9 <= lower <= upper <= 10^9```
- ```0 <= nums.length <= 100```
- ```lower <= nums[i] <= upper```
- All the values of ```nums``` are unique.

---
