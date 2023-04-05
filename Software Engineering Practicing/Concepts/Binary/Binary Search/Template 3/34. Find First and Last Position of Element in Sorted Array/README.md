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

- ```0 <= nums.length <= 10^5```
- ```-10^9 <= nums[i] <= 10^9```
- ```nums``` is a non-decreasing array.
- ```-10^9 <= target <= 10^9```

---

### Binary Search


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

                if nums[mi] < target:
                    lo = mi + 1
                else:
                    hi = mi - 1
            
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
        if start < n and start <= end:
            return [start, end]

        return res
```




