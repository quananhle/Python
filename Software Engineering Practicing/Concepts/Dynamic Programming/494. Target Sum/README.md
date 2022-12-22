## 494. Target Sum

```Tag```: ```Depth-First Search``` ```Dynamic Programming```

### Difficulty: Medium

You are given an integer array ```nums``` and an integer ```target```.

You want to build an __expression__ out of nums by adding one of the symbols ```'+'``` and ```'-'``` before each integer in nums and then concatenate all the integers.

- For example, if ```nums = [2, 1]```, you can add a ```'+'``` before ```2``` and a ```'-'``` before ```1``` and concatenate them to build the expression ```"+2-1"```.

Return _the number of different expressions that you can build, which evaluates to ```target```_.

![image](https://user-images.githubusercontent.com/35042430/209069887-c4436b2d-64b5-4a81-84a0-d04dc2fa3e6a.png)

---

__Example 1:__
```
Input: nums = [1,1,1,1,1], target = 3
Output: 5
Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
-1 + 1 + 1 + 1 + 1 = 3
+1 - 1 + 1 + 1 + 1 = 3
+1 + 1 - 1 + 1 + 1 = 3
+1 + 1 + 1 - 1 + 1 = 3
+1 + 1 + 1 + 1 - 1 = 3
```

__Example 2:__
```
Input: nums = [1], target = 1
Output: 1
```

__Constraints:__
```
1 <= nums.length <= 20
0 <= nums[i] <= 1000
0 <= sum(nums[i]) <= 1000
-1000 <= target <= 1000
```

---
