## Two Sum

#### Difficult: Easy

```
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.
```

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

### Nested Loop

```{Python}
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if target - nums[i] == nums[j]:
                    return [i,j]
                j += 1
            i += 1
        else:
            return [0,0]
        # Time complexity: O(N^2), nested loop
        # Space complexity: O(1), fixed memory space
 ```       
        
