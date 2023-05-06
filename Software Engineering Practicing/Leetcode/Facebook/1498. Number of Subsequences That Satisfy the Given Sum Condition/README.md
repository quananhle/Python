## [1498. Number of Subsequences That Satisfy the Given Sum Condition](https://leetcode.com/problems/number-of-subsequences-that-satisfy-the-given-sum-condition/)

```Tag```:

#### Difficulty: Medium

You are given an array of integers ```nums``` and an integer ```target```.

Return _the number of __non-empty__ subsequences of ```nums``` such that the sum of the minimum and maximum element on it is less or equal to ```target```_. Since the answer may be too large, return it __modulo__ 10<sup>9</sup> + 7.

![image](https://user-images.githubusercontent.com/35042430/236602592-388c6ba1-1830-49ae-bea3-cc58e2e6e949.png)

---

__Example 1:__
```
Input: nums = [3,5,6,7], target = 9
Output: 4
Explanation: There are 4 subsequences that satisfy the condition.
[3] -> Min value + max value <= target (3 + 3 <= 9)
[3,5] -> (3 + 5 <= 9)
[3,5,6] -> (3 + 6 <= 9)
[3,6] -> (3 + 6 <= 9)
```

__Example 2:__
```
Input: nums = [3,3,6,8], target = 10
Output: 6
Explanation: There are 6 subsequences that satisfy the condition. (nums can have repeated numbers).
[3] , [3] , [3,3], [3,6] , [3,6] , [3,3,6]
```

__Example 3:__
```
Input: nums = [2,3,3,4,6,7], target = 12
Output: 61
Explanation: There are 63 non-empty subsequences, two of them do not satisfy the condition ([6,7], [7]).
Number of valid subsequences (63 - 2 = 61).
```

__Constraints:__

- ```1 <= nums.length <= 10^5```
- ```1 <= nums[i] <= 10^6```
- ```1 <= target <= 10^6```

---

