## 1. Two Sum

#### Difficulty: Easy

Given an array of integers ```nums``` and an integer ```target```, return _indices of the two numbers such that they add up to ```target```_.

You may assume that each input would have __exactly one solution__, and you may not use the same element twice.

You can return the answer in any order.

![image](https://user-images.githubusercontent.com/35042430/206969512-33916e55-9011-4318-962f-2930a8bff7ad.png)

---

__Example 1:__
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
```

__Example 2:__
```
Input: nums = [3,2,4], target = 6
Output: [1,2]
```

__Example 3:__
```
Input: nums = [3,3], target = 6
Output: [0,1]
```

__Constraints:__
```
2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.
```

---

```Python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        # Brute Force
        ### Time Limit Exceeded
        res = list()
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i,j]
```

__Follow-up:__ Can you come up with an algorithm that is less than ```O(n^2)``` time complexity?

```Python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        # Hash Table
        ### Two Pass
        #### Time Complexity: O(N), traverse through the size N of input nums
        #### Space Complexity: O(N), stack keep up to the size of N
        memo = dict()
        for i in range(len(nums)):
            memo[nums[i]] = i
        for i in range(len(nums)):
            complement = target - nums[i]
            if complement in memo and memo[complement] != i:
                return [i, memo[complement]]
```
        # Hash Table
        ### One Pass
        memo = dict()
        for i in range(len(nums)):
            complement = target - nums[i]
            if complement in memo:
                return [i, memo[complement]]
            else:
                memo[nums[i]] = i


```
