## [912. Sort an Array](https://leetcode.com/problems/sort-an-array/)

```Tag```: ```Sorting```

#### Difficulty: Medium

Given an array of integers ```nums```, sort the array in ascending order and return it.

You must solve the problem without using any built-in functions in ```O(nlog(n))``` time complexity and with the smallest space complexity possible.

![image](https://user-images.githubusercontent.com/35042430/222025743-9585838e-c077-4f7f-9ea9-e0897f7b3e0f.png)

---

__Example 1:__
```
Input: nums = [5,2,3,1]
Output: [1,2,3,5]
Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
```

__Example 2:__
```
Input: nums = [5,1,1,2,0,0]
Output: [0,0,1,1,2,5]
Explanation: Note that the values of nums are not necessairly unique.
```

__Constraints:__

- 1 <= ```nums.length``` <= 5 * 10<sup>4</sup>
- -5 * 10<sup>4</sup> <= ```nums[i]``` <= 5 * 10<sup>4</sup>

---
