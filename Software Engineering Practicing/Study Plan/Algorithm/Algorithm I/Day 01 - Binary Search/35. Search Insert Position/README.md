## [35. Search Insert Position](https://leetcode.com/problems/search-insert-position)

```Tag```: ```Binary Search```

#### Difficulty: Easy

Given a sorted array of distinct integers ```nums``` and a target value ```target```, return _the index if the ```target``` is found_. If not, return _the index where it would be if it were inserted in order_.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://user-images.githubusercontent.com/35042430/232183163-0b080f8f-e63d-4678-9614-76d3060d7551.png)

---

__Example 1:__
```
Input: nums = [1,3,5,6], target = 5
Output: 2
```

__Example 2:__
```
Input: nums = [1,3,5,6], target = 2
Output: 1
```

__Example 3:__
```
Input: nums = [1,3,5,6], target = 7
Output: 4
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>
- ```nums``` contains distinct values sorted in ascending order.
- -10<sup>4</sup> <= ```target``` <= 10<sup>4</sup>

---

### Template 1

```Python
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        lo, hi = 0, len(nums) - 1
        while lo <= hi:
            mid = lo + (hi - lo) // 2

            if target > nums[mid]:
                lo = mid + 1
            elif target < nums[mid]:
                hi = mid - 1
            else:
                return mid
                
        return lo
```

### Template 2

```Python
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        # Corner cases: target is outside of the input range
        if target < nums[lo]:
            return 0
        elif target > nums[hi]:
            return n
        # Otherwise, target is inside of the input boundary
        else:
            while lo < hi:
                mi = lo + (hi - lo) // 2
                pivot = nums[mi]

                if pivot == target:
                    return mi
                elif pivot < target:
                    lo = mi + 1
                else:
                    hi = mi
            return lo
```
