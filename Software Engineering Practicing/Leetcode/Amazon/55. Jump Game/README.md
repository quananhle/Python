## 55. Jump Game

```Tag```: ```Greedy``` ```Dynamic Programming```

#### Difficulty: Medium

You are given an integer array ```nums```. You are initially positioned at the array's __first index__, and each element in the array represents your maximum jump length at that position.

Return _```true``` if you can reach the last index, or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/211135305-27252afc-a081-4625-aabe-c71f79020907.png)

---

__Example 1:__
```
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

__Example 2:__
```
Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
```

__Constraints:__
```
1 <= nums.length <= 104
0 <= nums[i] <= 105
```

---
