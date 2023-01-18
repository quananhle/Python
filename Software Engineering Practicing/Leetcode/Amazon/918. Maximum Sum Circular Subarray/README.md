## 918. Maximum Sum Circular Subarray

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a __circular integer array__ ```nums``` of length ```n```, return _the maximum possible sum of a non-empty __subarray__ of ```nums```_.

A __circular array__ means the end of the array connects to the beginning of the array. Formally, the next element of ```nums[i]``` is ```nums[(i + 1) % n]``` and the previous element of ```nums[i]``` is ```nums[(i - 1 + n) % n]```.

A subarray may only include each element of the fixed buffer ```nums``` at most once. Formally, for a subarray ```nums[i], nums[i + 1], ..., nums[j]```, there does not exist ```i <= k1```, ```k2 <= j``` with ```k1 % n == k2 % n```.

![image](https://user-images.githubusercontent.com/35042430/213271032-6eff7480-2ce8-4c9b-9342-171a81dfa7d7.png)

---

__Example 1:__
```
Input: nums = [1,-2,3,-2]
Output: 3
Explanation: Subarray [3] has maximum sum 3.
```

__Example 2:__
```
Input: nums = [5,-3,5]
Output: 10
Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10.
```

__Example 3:__
```
Input: nums = [-3,-2,-3]
Output: -2
Explanation: Subarray [-2] has maximum sum -2.
```

__Constraints:__
```
n == nums.length
1 <= n <= 3 * 104
-3 * 104 <= nums[i] <= 3 * 104
```

---
