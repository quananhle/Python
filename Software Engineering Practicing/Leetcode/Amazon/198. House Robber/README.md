## 198. House Robber

#### Difficulty: Medium

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and __it will automatically contact the police if two adjacent houses were broken into on the same night.__

Given an integer array ```nums``` representing the amount of money of each house, return _the maximum amount of money you can rob tonight __without alerting the police___.

![image](https://user-images.githubusercontent.com/35042430/207699709-9884864b-7665-4dd1-b858-09ce130f98af.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
```

__Example 2:__
```
Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.
```

__Constraints:__
```
1 <= nums.length <= 100
0 <= nums[i] <= 400
```

---
