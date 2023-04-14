## [704. Binary Search](https://leetcode.com/problems/binary-search/?envType=study-plan&id=algorithm-i)

```Tag```: ```Binary Search```

#### Difficulty: Easy

Given an array of integers ```nums``` which is sorted in ascending order, and an integer ```target```, write a function to search ```target``` in ```nums```. If ```target``` exists, then return its index. Otherwise, return ```-1```.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://user-images.githubusercontent.com/35042430/205961787-159abdbf-e4df-4a69-849c-7f5e3b6c9ea8.png)

---

__Example 1:__
```
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4
```

__Example 2:__
```
Input: nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1
```

__Constraints:__
```
1 <= nums.length <= 104
-104 < nums[i], target < 104
All the integers in nums are unique.
nums is sorted in ascending order.
```

---

### Binary Search

#### Template 1

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo <= hi:
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if num < target:
                lo = mi + 1
            elif num > target:
                hi = mi - 1
            else:
                return mi
        
        return -1
```

#### Template 2

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo < hi:
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if num < target:
                lo = mi + 1
            else:
                hi = mi

        return lo if nums[lo] == target else -1
```

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        n = len(nums)
        lo, hi = 0, n

        while lo < hi:
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if num < target:
                lo = mi + 1
            elif num > target:
                hi = mi
            else:
                return mi
        
        return -1
        
'''
Edge cases: nums = [5], target = 5; nums = [2,5], target = 5
```

---

#### Recursive Approach

```Python
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        lo, hi = 0, len(nums) - 1
        def binary_search(lo, hi):
            # Base case
            if lo > hi:
                return lo

            mid = lo + (hi - lo) // 2

            if target == nums[mid]:
                return mid
            elif target < nums[mid]:
                return binary_search(lo, mid - 1)
            else:
                return binary_search(mid + 1, hi)

        return binary_search(lo, hi)
```

#### Iterative Approach

```Python
class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        # Binary Search
        #### Time Complexity: O(logN)
        #### Space Complexity: O(1)
        lo, hi = 0, len(nums)-1
        while lo < hi:
            mid = lo + (hi-lo+1)//2
            if nums[mid] <= target:
                lo = mid
            elif nums[mid] > target:
                hi = mid - 1
        return lo if nums[lo]==target else -1
```

```Python
class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        left, right = 0, len(nums)-1
        while left <= right:
            mid = left + (right-left)//2
            if target > nums[mid]:
                left = mid + 1
            elif target < nums[mid]:
                right = mid - 1
            else:
                return mid
        return -1
```

```Python
class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        left, right = 0, len(nums)-1
        while left <= right:
            mid = (left+right) // 2
            if nums[mid] == target:
                return mid
            elif nums[mid] < target:
                left = mid + 1
            else:
                right = mid - 1
        return -1
```
