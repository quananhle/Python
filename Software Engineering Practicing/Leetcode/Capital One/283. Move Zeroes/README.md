## 283. Move Zeroes

#### Difficulty: Easy

```
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.
```

#### Example 1:
```
Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]
```

### Example 2:
```
Input: nums = [0]
Output: [0]
 ```

### Constraints:
```
1 <= nums.length <= 104
-231 <= nums[i] <= 231 - 1
```

```{Python}
class Solution(object):
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
 
        slow = 0
        for fast in range(len(nums)):
            if nums[fast] != 0:
                nums[fast], nums[slow] = nums[slow], nums[fast]
                slow += 1
        # Time complexity: O(n), travel through the input array
        # Space complexity: O(1), mofications made in-place, no space needed
```
 
