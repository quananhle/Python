## [15. 3Sum](https://leetcode.com/problems/3sum/)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given an integer array ```nums```, return _all the triplets ```[nums[i], nums[j], nums[k]]``` such that ```i != j```, ```i != k```, and ```j != k```, and ```nums[i] + nums[j] + nums[k] == 0```_.

Notice that the solution set must not contain duplicate triplets.

![image](https://user-images.githubusercontent.com/35042430/225450520-fcfd5fbf-5dc2-4903-84f1-099f9c050f45.png)

---

__Example 1:__
```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
```

__Example 2:__
```
Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
```

__Example 3:__
```
Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.
```

__Constraints:__

- ```3 <= nums.length <= 3000```
- -10<sup>5</sup> <= ```nums[i]``` <= 10<sup>5</sup>

---

### 
