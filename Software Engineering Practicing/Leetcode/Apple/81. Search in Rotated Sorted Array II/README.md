## [81. Search in Rotated Sorted Array II](https://leetcode.com/problems/search-in-rotated-sorted-array-ii)

```Tag```: ```Binary Search```

#### Difficulty: Medium

There is an integer array ```nums``` sorted in non-decreasing order (not necessarily with distinct values).

Before being passed to your function, ```nums``` is rotated at an unknown pivot index ```k``` ```(0 <= k < nums.length)``` such that the resulting array is ```[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]``` __(0-indexed)__. For example, ```[0,1,2,4,4,4,5,6,6,7]``` might be rotated at pivot index ```5``` and become ```[4,5,6,6,7,0,1,2,4,4]```.

Given the array nums after the rotation and an integer target, return _```true``` if ```target``` is in ```nums```, or ```false``` if it is not in ```nums```_.

You must decrease the overall operation steps as much as possible.

![image](https://github.com/quananhle/Python/assets/35042430/c43d1a73-8c53-4222-bbfe-ada8b1ffc878)

---

__Example 1:__
```
Input: nums = [2,5,6,0,0,1,2], target = 0
Output: true
```

__Example 2:__
```
Input: nums = [2,5,6,0,0,1,2], target = 3
Output: false
```

__Constraints:__

- $1 \le nums.length \le 5000$
- $-10^{4} \le nums[i] \le 10^{4}$
- ```nums``` is guaranteed to be rotated at some pivot.
- $-10^{4} \le target \le 10^{4}$

---

### Binry Search

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> bool:
        n = len(nums)

        if n == 1:
            return True if nums[0] == target else False

        def traverse_if_duplicate(lo, hi):
            while lo < hi and nums[lo] == nums[lo + 1]:
                lo += 1
            while lo < hi and nums[hi - 1] == nums[hi]:
                hi -= 1
            return (lo, hi)

        lo, hi = 0, n - 1
        while lo <= hi:
            lo, hi = traverse_if_duplicate(lo, hi)
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            # Check if target is found
            if num == target:
                return mi
            # Check if current pivot index is the non-rotated part
            elif num < nums[hi]:
                # Check if target is in the boundary
                if num < target <= nums[hi]:
                    # Shrink the left boundary
                    lo = mi + 1
                # Otherwise, target is in the left part
                else:
                    hi = mi - 1
            # Otherwise, pivot index is in the rotated part
            else:
                # Check if target is in the boundary
                if nums[lo] <= target < num:
                    # Shrink the right boundary
                    hi = mi - 1
                # Otherwise, target is in the right part
                else:
                    lo = mi + 1
            
        return False
```
