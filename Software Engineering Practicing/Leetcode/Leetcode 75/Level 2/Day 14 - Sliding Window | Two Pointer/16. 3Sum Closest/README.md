## [16. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Medium

Given an integer array ```nums``` of length ```n``` and an integer ```target```, find three integers in ```nums``` such that the sum is closest to ```target```.

Return _the sum of the three integers_.

You may assume that each input would have exactly one solution.

![image](https://user-images.githubusercontent.com/35042430/225415842-e4952b9e-76b2-46f9-88a8-ee3dd27253da.png)

---

__Example 1__:
```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

__Example 2__:
```
Input: nums = [0,0,0], target = 1
Output: 0
Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
```

__Constraints__:

- ```3 <= nums.length <= 500```
- ```-1000 <= nums[i] <= 1000```
- -10<sup>4</sup> <= ```target``` <= 10<sup>4</sup>

---

