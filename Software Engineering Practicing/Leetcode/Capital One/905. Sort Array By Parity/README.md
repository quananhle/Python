## Sort Array By Parity

#### Difficulty: Easy

```
Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.

Return any array that satisfies this condition.
```

__Example 1:__
```
Input: nums = [3,1,2,4]
Output: [2,4,3,1]
Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
```
__Example 2:__
```
Input: nums = [0]
Output: [0]
 ```
__Constraints:__
```
1 <= nums.length <= 5000
0 <= nums[i] <= 5000
```

### In-Place Sorting

```{Python}
class Solution(object):
    def sortArrayByParity(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        i, j = 0, len(nums)-1
        while i < j:
            # n % 2 == 0 => even
            # n % 2 == 1 => odd
            """
            if nums[i] % 2 == 0 and nums[j] % 2 == 1 => pass. Move i and j
            if nums[i] % 2 == 1 and nums[j] % 2 == 0 => swap A[i] and A[j]. Move i and j
            if nums[i] % 2 == 0 and nums[j] % 2 == 0 => move i
            if nums[i] % 2 == 1 and nums[j] % 2 == 1 => move j
            """
            if nums[i] % 2 > nums[j] % 2:
                nums[i], nums[j] = nums[j], nums[i]
            if nums[i] % 2 == 0:
                i += 1
            if nums[j] % 2 == 1:
                j -= 1
        return nums
        # Time complexity: O(N), pass through list once
        # Space complexity: O(1), fixed memory space
 ```
