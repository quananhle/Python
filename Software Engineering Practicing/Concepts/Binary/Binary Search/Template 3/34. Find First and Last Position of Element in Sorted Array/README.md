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

__Algorithm__

1. Define a function called ```binary_search``` which takes one argument: a boolean value ```is_first``` which indicates if we are trying to find the first or the last occurrence of target.
We use 2 variables to keep track of the subarray that we are scanning. Let's call them begin and end. Initially, begin is set to 0 and end is set to the last index of the array.
We iterate until begin is greater than to end.
At each step, we calculate the middle element mid = (begin + end) / 2. We use the value of the middle element to decide which half of the array we need to search.
nums[mid] == target
isFirst is true ~ This implies that we are trying to find the first occurrence of the element. If mid == begin or nums[mid - 1] != target, then we return mid as the first occurrence of the target. Otherwise, we update end = mid - 1
isFirst is false ~ This implies we are trying to find the last occurrence of the element. If mid == end or nums[mid + 1] != target, then we return mid as the last occurrence of the target. Otherwise, we update begin = mid + 1
nums[mid] > target ~ We update end = mid - 1 since we must discard the right side of the array as the middle element is greater than target.
nums[mid] < target ~ We update begin = mid + 1 since we must discard the left side of the array as the middle element is less than target.
We return a value of -1 at the end of our function which indicates that target was not found in the array.
In the main searchRange function, we first call findBound with isFirst set to true. If this value is -1, we can simply return [-1, -1]. Otherwise, we call findBound with isFirst set to false to get the last occurrence and then return the result.

```Python
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        def binary_search(is_first):
            n = len(nums)
            lo, hi = 0, n - 1
            while lo <= hi:
                mi = lo + (hi - lo) // 2
                
                if nums[mi] == target:
                    
                    if is_first:
                        # This means we found our lower bound.
                        if mi == lo or nums[mi - 1] < target:
                            return mi

                        # Search on the left side for the bound.
                        hi = mi - 1
                    else:
                        
                        # This means we found our upper bound.
                        if mi == hi or nums[mi + 1] > target:
                            return mi
                        
                        # Search on the right side for the bound.
                        lo = mi + 1
                
                elif nums[mi] > target:
                    hi = mi - 1
                else:
                    lo = mi + 1
            
            return -1

        lower_boundary = binary_search(is_first=True)
        if lower_boundary == -1:
            return [-1, -1]
        upper_boundary = binary_search(is_first=False)

        return [lower_boundary, upper_boundary]
```

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
