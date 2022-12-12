## 1. Two Sum

#### Difficulty: Easy

Given an array of integers ```nums``` and an integer ```target```, return _indices of the two numbers such that they add up to ```target```_.

You may assume that each input would have __exactly one solution__, and you may not use the same element twice.

You can return the answer in any order.

![image](https://user-images.githubusercontent.com/35042430/206969512-33916e55-9011-4318-962f-2930a8bff7ad.png)

---

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
 

Constraints:

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.
