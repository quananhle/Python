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

__Intuition__

Recall that after rotating a sorted array, what we get is two sorted arrays appended to each other.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/1.png)

Let's refer to the first sorted array as ```F``` and second as ```S```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/2.png)

Also, we can observe that all the elements of the second array ```S``` will be __smaller or equal__ to the first element ```start``` of ```F```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/3.png)

With this observation in mind, we can easily tell which of the 2 arrays (```F``` or ```S```) does a ```target``` element lie in by just comparing it with the first element of the array.

Let's say we are looking for element target in array ```arr```:

- __Case 1__: If ```target > arr[start]```: ```target``` exists in the first array ```F```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/4.png)

- __Case 2__: If ```target < arr[start]```: ```target``` exists in the second array ```S```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/5.png)

- __Case 3__: If ```target == arr[start]```: ```target``` obviously exists in the first array ```F```, but it might also be present in the second array ```S```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/6.png)

__Algorithm__

Recall that in standard binary search, we keep two pointers (i.e. ```lo``` and ```hi```) to track the search scope in an ```arr``` array. We then divide the search space in three parts ```[start, mid)```, ```[mid, mid]```, ```(mid, end]```. Now, we continue to look for our ```target``` element in one of these search spaces.

By identifying the positions of both ```arr[mi]``` and ```target``` in ```F``` and ```S```, we can reduce search space in the very same way as in standard binary search:

- Case 1: ```arr[mi]``` lies in ```F```, ```target``` lies in ```S```: Since ```S``` starts after ```F``` ends, we know that element lies here:```(mi, hi]```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/7.png)

- Case 2: ```arr[mi]``` lies in the ```S```, ```target``` lies in ```F```: Similarly, we know that element lies here: ```[lo, mi)```.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/8.png)

- Case 3: Both ```arr[mi]``` and ```target``` lie in ```F```: since both of them are in same sorted array, we can compare ```arr[mi]``` and ```target``` in order to decide how to reduce search space.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/9.png)

- Case 4: Both ```arr[mi]``` and ```target``` lie in ```S```: Again, since both of them are in same sorted array, we can compare ```arr[mi]``` and ```target``` in order to decide how to reduce search space.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/10.png)

- Case 5: But there is a catch, if ```arr[mi]``` equals ```arr[lo]```, then we don't know which part ```arr[mi]``` might belong to and hence we cannot find the relative position of ```target``` from it. In this case, we have no option but to move to next search space iteratively. Hence, there are certain search spaces that allow a binary search, and some search spaces that don't.

![image](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/Figures/81/11.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$ worst case, $\mathcal{O}(\log N)$ best case
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def search(self, nums: List[int], target: int) -> bool:
        # Returns True if we can reduce the search space in current binary search space
        def is_binary_search_helpful(start, num):
            return nums[start] != num
        
        # Returns true if element exists in left array, false if it exists in the right
        def exists_in_first(start, num):
            return nums[start] <= num
        
        n = len(nums)

        if n == 1:
            return True if nums[0] == target else False

        lo, hi = 0, n - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if num == target:
                return True
            
            if not is_binary_search_helpful(lo, num):
                lo += 1
                continue
            
            target_array = exists_in_first(lo, target)
            pivot_array = exists_in_first(lo, num)

            # Check if pivot and target exist in different sorted arrays
            if target_array ^ pivot_array:
                if pivot_array:
                    # Pivot is in the left half, target is in the right half
                    lo = mi + 1
                else:
                    # Target is in the left half, pivot is in the right half
                    hi = mi - 1
            # Pivot and target exist in the same sorted array
            else:
                if num < target:
                    lo = mi + 1
                else:
                    hi = mi - 1
        
        return False
```

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