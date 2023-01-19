## 974. Subarray Sums Divisible by K

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```nums``` and an integer ```k```, return _the number of non-empty __subarrays__ that have a sum divisible by ```k```_.

A __subarray__ is a __contiguous__ part of an array.

![image](https://user-images.githubusercontent.com/35042430/213331466-39537e58-e6bc-441c-b675-55be47155d21.png)

---

__Example 1:__
```
Input: nums = [4,5,0,-2,-3,1], k = 5
Output: 7
Explanation: There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
```

__Example 2:__
```
Input: nums = [5], k = 9
Output: 0
```

__Constraints:__
```
1 <= nums.length <= 3 * 104
-104 <= nums[i] <= 104
2 <= k <= 104
```

---

