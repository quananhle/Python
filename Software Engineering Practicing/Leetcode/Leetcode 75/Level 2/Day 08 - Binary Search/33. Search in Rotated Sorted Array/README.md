## [33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

There is an integer array ```nums``` sorted in ascending order (with __distinct__ values).

Prior to being passed to your function, ```nums``` is possibly rotated at an unknown pivot index ```k (1 <= k < nums.length)``` such that the resulting array is ```[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]``` (__0-indexed__). For example, ```[0,1,2,4,5,6,7]``` might be rotated at pivot index ```3``` and become ```[4,5,6,7,0,1,2]```.

Given the array ```nums``` after the possible rotation and an integer ```target```, return _the index of ```target``` if it is in ```nums```, or ```-1``` if it is not in ```nums```_.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://user-images.githubusercontent.com/35042430/224099024-cc87fd38-fc5e-48df-954f-cc50c030266a.png)

---

__Example 1__:
```
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```

__Example 2__:
```
Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

__Example 3__:
```
Input: nums = [1], target = 0
Output: -1
```

__Constraints__:

- $1 \le nums.length \le 5000$
- $-10^{4} \le nums[i] \le 10^{4}$
- All values of ```nums``` are __unique__.
- ```nums``` is an ascending array that is possibly rotated.
- $-10^{4} \le target \le 10^{4}

---

### Brute Force

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        try:
            ans = nums.index(target)
            return ans
        except ValueError as error:
            return -1
```

### Two Binary Searches

- __Time complexity__: ```O(log⁡N)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        def find_rotate_index(lo, hi):
            if nums[lo] < nums[hi]:
                return 0
            
            while lo <= hi:
                mi = lo + (hi - lo) // 2
                if nums[mi] > nums[mi + 1]:
                    return mi + 1
                else:
                    if nums[mi] < nums[lo]:
                        hi = mi - 1
                    else:
                        lo = mi + 1
        
        def binary_search(lo, hi):
            while lo <= hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] < target:
                    lo = mi + 1
                elif nums[mi] > target:
                    hi = mi - 1
                else:
                    return mi

            return -1
        
        n = len(nums)
        if n == 1:
            return 0 if nums[0] == target else -1
        
        rotate_index = find_rotate_index(0, n - 1)

        # Check if the input is rotated, if not rotated, binary search the entire array
        if rotate_index == 0:
            return binary_search(0, n - 1)
        # Check if the target is the rotate index
        if nums[rotate_index] == target:
            return rotate_index
        # Check if the target belongs to the rotation subarray
        if target < nums[0]:
            return binary_search(rotate_index + 1, n - 1)
        # Otherwise, the target belongs to the non-rotated subarray
        return binary_search(0, rotate_index - 1)
```

### One Pass Binary Search

Instead of going through the input array in two passes, we could achieve the goal in one pass with a revised binary search.

    The idea is that we add some additional condition checks in the normal binary search in order to better narrow down the scope of the search.

There could be two situations:

Pivot element is larger than the first element in the array, i.e. the subarray from the first element to the pivot is non-rotated, as shown in the following graph.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array/Figures/33/33_small_mid.png)

```
  - If the target is located in the non-rotated subarray:
  go left: `end = mid - 1`.

  - Otherwise: go right: `start = mid + 1`.
```

Pivot element is smaller than the first element of the array, i.e. the rotation index is somewhere between ```0``` and ```mid```. It implies that the sub-array from the pivot element to the last one is non-rotated, as shown in the following graph.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array/Figures/33/33_big_mid.png)

```
  - If the target is located in the non-rotated subarray:
  go right: `start = mid + 1`.

  - Otherwise: go left: `end = mid - 1`.
```

__Algorithm__

1. Initialize the boundaries of the searching space as ```lo = 0``` and ```hi = n - 1```.
2. While ```lo <= hi```, do the followings:
    - Locate the middle index as ```mi = lo + (hi - lo) // 2```. Compare ```nums[mi]``` with ```target```.
        - If ```target = nums[mi]```, return ```mi```. Otherwise:
        - If ```nums[mi] >= nums[lo]```, the left half is sorted.
            - If ```target >= nums[lo]``` and ```target < nums[mid]```, ```target``` might be in the left half.
            - Continue with the left half by setting ```hi = mi - 1```.
            - Otherwise, move on with the right half by setting ```lo = mi + 1```.
        - If ```nums[mi] < nums[lo]```, the right half is sorted.
            - If ```target <= nums[lo]``` and ```target > nums[mi]```, target might be in the right half.
            - Continue with the right half by setting ```lo = mi + 1```.
            - Otherwise, move on with the left half by setting ```hi = mi + 1```.
5. Return ```-1``` when the search is complete.

__Complexity Analysis__

- __Time complexity__: $\mathcal{O}(\log n)$
- __Space complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo <= hi:
            mi = lo + (hi - lo) // 2
            # Check if the element at the pivot index mi is the target
            if nums[mi] == target:
                return mi
            # Check if the element at the pivot index mi is smaller than the elemnts in its left: mi could be the rotate index or in the rotated array
            elif nums[mi] < nums[lo]:
                # Check if target is in the right half subarray [mi + 1, hi] 
                if nums[mi] < target <= nums[hi]: 
                    lo = mi + 1
                # Otherwise, the target is in the left half subarray [lo, mi + 1]
                else:
                    hi = mi - 1
            # Otherwise, the element at pivot index mi is larger than the elements in its left: mi is in the non-rotated array
            else:
                # Check if the target is in the left half subarray [lo, mi + 1]
                if nums[lo] <= target < nums[mi]:
                    hi = mi - 1
                # Otherwise, the target is in the right half subarray [mi + 1, hi]
                else:
                    lo = mi + 1
                    
        return -1
```
