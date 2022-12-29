## 485. Max Consecutive Ones


```Tag```: ```Two Pointers```

#### Difficulty: Easy

Given a binary array ```nums```, return _the __maximum number__ of consecutive ```1```'s in the array_.

---

__Example 1:__
```
Input: nums = [1,1,0,1,1,1]
Output: 3
Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
```

__Example 2:__
```
Input: nums = [1,0,1,1,0,1]
Output: 2
```

__Constraints:__
```
1 <= nums.length <= 105
nums[i] is either 0 or 1.
```

---

![image](https://leetcode.com/problems/max-consecutive-ones/solutions/409193/Figures/485/485_Max_Consecutive_Ones_1.png)

```Python
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        # Brute Force with Nested Loop
        ### Time Limit Exceeded
        ans = 0
        for slow in range(len(nums)):
            if nums[slow] == 1:
                count = 0
                for fast in range(slow, len(nums)):
                    if nums[fast] == 1:
                        count += 1
                    else:
                        break
                ans = max(ans, count)
        return ans
```
