## [2540. Minimum Common Value](https://leetcode.com/problems/minimum-common-value)

```Tag```: ```Hash Set``` ```Two Pointers``` ```Binary Search```

#### Difficulty: Easy

Given two integer arrays ```nums1``` and ```nums2```, sorted in non-decreasing order, return _the minimum integer common to both arrays_. If there is no common integer amongst nums1 and nums2, return ```-1```.

Note that an integer is said to be common to ```nums1``` and ```nums2``` if both arrays have at least one occurrence of that integer.

![image](https://github.com/quananhle/Python/assets/35042430/ae70caba-c6eb-4d3d-be39-6759c1581cae)

---

__Example 1:__
```
Input: nums1 = [1,2,3], nums2 = [2,4]
Output: 2
Explanation: The smallest element common to both arrays is 2, so we return 2.
```

__Example 2:__
```
Input: nums1 = [1,2,3,6], nums2 = [2,3,4,5]
Output: 2
Explanation: There are two common elements in the array 2 and 3 out of which 2 is the smallest, so 2 is returned.
```

__Constraints:__

- $1 \le nums1.length, nums2.length \le 10^5$
- $1 \le nums1[i], nums2[j] \le 10^9$
- Both nums1 and nums2 are sorted in non-decreasing order.

---

### Two Pointers

```Python
class Solution:
    def getCommon(self, nums1: List[int], nums2: List[int]) -> int:
        if len(nums1) > len(nums2):
            nums1, nums2 = nums2, nums1

        m, n = len(nums1), len(nums2)
        i = j = 0

        while i < m and j < n:
            if j < n:
                while i < m and nums1[i] < nums2[j]: 
                    i += 1
            if i < m:
                while j < n and nums2[j] < nums1[i]:
                    j += 1

            if i < m and j < n and nums1[i] == nums2[j]:
                return nums1[i]

        return -1
```