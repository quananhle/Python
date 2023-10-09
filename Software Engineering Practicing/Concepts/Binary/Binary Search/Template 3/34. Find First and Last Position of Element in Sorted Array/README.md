## [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Given an array of integers ```nums``` sorted in non-decreasing order, find the starting and ending position of a given ```target``` value.

If ```target``` is not found in the array, return ```[-1, -1]```.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://user-images.githubusercontent.com/35042430/230162999-93b6d9f6-21b4-4ade-b703-685415c6f3a4.png)

---

__Example 1:__
```
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
```

__Example 2:__
```
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
```

__Example 3:__
```
Input: nums = [], target = 0
Output: [-1,-1]
```

__Constraints:__

- $0 \le nums.length \le 10^5$
- $-10^9 \le nums[i] \le 10^9$
- ```nums``` is a non-decreasing array.
- $-10^9 \le target \le 10^9$

---

### Binary Search & Linear Search

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)

        start, end = -1, -1
        if n == 0: return [start, end]

        lo, hi = 0, n - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] < target:
                lo = mi + 1
            elif nums[mi] > target:
                hi = mi - 1
            else:
                start = end = mi
                while start > 0 and nums[start - 1] == target:
                    start -= 1
                while end < n - 1 and nums[end + 1] == target: 
                    end += 1
                break
        
        return [start, end]
```

### Binary Search

#### Template 1

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        res = [-1, -1]

        if n == 0: return res

        lo, hi = 0, n - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] < target:
                lo = mi + 1
            else:
                hi = mi - 1
        
        if lo < n and nums[lo] == target: 
            res[0] = lo

        lo, hi = 0, n - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] > target:
                hi = mi - 1
            else:
                lo = mi + 1

        if nums[hi] == target: 
            res[-1] = hi

        return res
```

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        res = [-1, -1]

        if n == 0: return res

        def binary_search_lower():
            lo, hi = 0, n - 1
            while lo <= hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] >= target:
                    hi = mi - 1
                else:
                    lo = mi + 1
            
            return lo

        def binary_search_upper():
            lo, hi = 0, n - 1
            while lo <= hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] <= target:
                    lo = mi + 1
                else:
                    hi = mi - 1

            return hi
        
        start, end = binary_search_lower(), binary_search_upper()
        if start <= end:
            return [start, end]
        return res
```

#### ✅ Template 2 (Best Solution)

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        if n == 0: return [-1, -1]

        def search(x):
            lo, hi = 0, n
            while lo < hi:
                mi = lo + (hi - lo) // 2
                if nums[mi] < x:
                    lo = mi + 1
                else:
                    hi = mi
            return lo

        start = search(target)
        end = search(target + 1) - 1        # Find the starting position of the element next to target, its previous index is the ending position of target

        if start <= end:
            return [start, end]
        return [-1, -1]
```

#### Template 3

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        res = [-1, -1]

        if n == 0: return res

        def binary_search_lower():
            lo, hi = 0, n - 1
            
            while lo + 1 < hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] < target:
                    lo = mi + 1
                else:
                    hi = mi
                
            if nums[lo] == target: return lo
            if nums[hi] == target: return hi
            return -1

        def binary_search_upper():
            lo, hi = 0, n - 1
            
            while lo + 1 < hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] <= target:
                    lo = mi
                else:
                    hi = mi - 1
                
            if nums[hi] == target: return hi
            if nums[lo] == target: return lo
            return -1

        return [binary_search_lower(), binary_search_upper()]
```

#### Built-in Binary Search

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        if n == 0: return [-1, -1]

        start = bisect_left(nums, target)
        end = bisect_right(nums, target) - 1

        if start <= end:
            return [start, end]
        return [-1, -1]        
```
