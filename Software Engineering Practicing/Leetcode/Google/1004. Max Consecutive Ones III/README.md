## [1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii)

```Tag```: ```Sliding Window```

#### Difficulty: Medium

Given a binary array ```nums``` and an integer ```k```, return _the maximum number of consecutive ```1```'s in the array if you can flip at most ```k``` ```0```'s_.

![image](https://github.com/quananhle/Python/assets/35042430/2d4f8ad2-7882-4360-8b73-b3c66fa2ce22)

---

__Example 1:__
```
Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
Output: 6
Explanation: [1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
```

__Example 2:__
```
Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
Output: 10
Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
```

__Constraints:__

- ```1 <= nums.length <= 10^5```
- ```nums[i]``` is either ```0``` or ```1```.
- ```0 <= k <= nums.length```

---
 
