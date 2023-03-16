## [1. Two Sum](https://leetcode.com/problems/two-sum/)

```Tag```: ```Two Pointers``` ```Hash Table```

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

### Brute Force

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
        else:
            return [0,0]
        # Time complexity: O(N^2), nested loop
        # Space complexity: O(1), constant memory space
 ```
 
 ### Two Pass Hash Table

```Python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        hash_table = dict()
        for i in range(len(nums)):
            hash_table[nums[i]] = i
        for i in range(len(nums)):
            res = target - nums[i]
            if res in hash_table and hash_table[res] != i:
                return [i, hash_table[res]]
        # Time complexity: O(N), travel through the length of input
        # Space complexity: O(N), size of hash table depends on the size of input
```  
 
 ### One Pass Hash Table

```Python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        hash_table = dict()
        for i in range(len(nums)):
            res = target - nums[i]
            if res in hash_table and hash_table[res] != i:
                return [i, hash_table[res]]
            else:
                hash_table[nums[i]] = i
        # Time complexity: O(N), travel through the length of input
        # Space complexity: O(N), size of hash table depends on the size of input
``` 
