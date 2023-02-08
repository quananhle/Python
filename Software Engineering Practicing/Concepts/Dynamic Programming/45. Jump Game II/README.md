## 45. Jump Game II

```Tag```: ```Dynamic Programming``` ```Greedy Algorithm```

#### Difficulty: Medium

You are given a __0-indexed__ array of integers ```nums``` of length ```n```. You are initially positioned at ```nums[0]```.

Each element ```nums[i]``` represents the maximum length of a forward jump from index ```i```. In other words, if you are at ```nums[i]```, you can jump to any ```nums[i + j]``` where:

- ```0 <= j <= nums[i]``` and
- ```i + j < n```

Return _the __minimum number__ of jumps to reach ```nums[n - 1]```_. The test cases are generated such that you can reach ```nums[n - 1]```.

![image](https://user-images.githubusercontent.com/35042430/217458978-65ad5247-2d73-4f55-823d-aa5a790887f0.png)

---

__Example 1__:
```
Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

__Example 2:__
```
Input: nums = [2,3,0,1,4]
Output: 2
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- ```0 <= nums[i] <= 1000```

---
