## [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Given an array of integers nums containing ```n + 1``` integers where each integer is in the range ```[1, n]``` inclusive.

There is only one repeated number in ```nums```, return _this repeated number_.

You must solve the problem without modifying the array nums and uses only constant extra space.

![image](https://user-images.githubusercontent.com/35042430/234982483-9d1d458a-9716-4473-8fea-a3b3e3ce7442.png)

---

__Example 1:__
```
Input: nums = [1,3,4,2,2]
Output: 2
```

__Example 2:__
```
Input: nums = [3,1,3,4,2]
Output: 3
```

__Constraints:__

- 1 <= ```n``` <= 10<sup>5</sup>
- ```nums.length == n + 1```
- ```1 <= nums[i] <= n```
- All the integers in ```nums``` appear only once except for precisely one integer which appears two or more times.

---

__Follow up:__

- How can we prove that at least one duplicate number must exist in nums?
- Can you solve the problem in linear runtime complexity?
