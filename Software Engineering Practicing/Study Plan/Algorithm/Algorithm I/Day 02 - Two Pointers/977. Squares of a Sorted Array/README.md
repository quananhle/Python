## [977. Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array)

```Tag```: ```Two Pointers```

#### Difficulty: Easy

Given an integer array ```nums``` sorted in non-decreasing order, return _an array of the squares of each number sorted in non-decreasing order_.

![image](https://user-images.githubusercontent.com/35042430/232183382-e5b5962c-8246-44f8-9375-4196910ff874.png)

---

__Example 1:__
```
Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].
```

__Example 2:__
```
Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>
- ```nums``` is sorted in non-decreasing order.

__Follow up:__ Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?

---
