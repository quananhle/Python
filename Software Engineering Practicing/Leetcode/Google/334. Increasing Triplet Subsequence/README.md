## [334. Increasing Triplet Subsequence](https://leetcode.com/problems/increasing-triplet-subsequence)

```Tag```: ```Array & String```

#### Difficulty: Medium

Given an integer array ```nums```, return _```true``` if there exists a triple of indices ```(i, j, k)``` such that ```i < j < k``` and ```nums[i] < nums[j] < nums[k]```_. If no such indices exists, return _```false```_.

![image](https://github.com/quananhle/Python/assets/35042430/4aea916e-fc7b-41a0-9c53-39c6836f0f58)

---
 
__Example 1:__
```
Input: nums = [1,2,3,4,5]
Output: true
Explanation: Any triplet where i < j < k is valid.
```

__Example 2:__
```
Input: nums = [5,4,3,2,1]
Output: false
Explanation: No triplet exists.
```

__Example 3:__
```
Input: nums = [2,1,5,0,4,6]
Output: true
Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.
```

__Constraints:__

- ```1 <= nums.length <= 5 * 10^5```
- ```-2^31 <= nums[i] <= 2^31 - 1```

__Follow up__: Could you implement a solution that runs in ```O(n)``` time complexity and ```O(1)``` space complexity?

---




 
