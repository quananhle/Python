## 88. Merge Sorted Array

```Tag```:

#### Difficulty: Easy

You are given two integer arrays ```nums1``` and ```nums2```, sorted in __non-decreasing__ order, and two integers ```m``` and ```n```, representing the number of elements in ```nums1``` and ```nums2``` respectively.

__Merge__ ```nums1``` and ```nums2``` into a single array sorted in __non-decreasing__ order.

The final sorted array should not be returned by the function, but instead be _stored inside the array ```nums1```_. To accommodate this, ```nums1``` has a length of ```m + n```, where the first ```m``` elements denote the elements that should be merged, and the last ```n``` elements are set to ```0``` and should be ignored. ```nums2``` has a length of ```n```.

![image](https://user-images.githubusercontent.com/35042430/211989681-0d649cc3-b589-447b-9723-b39b86f0df45.png)

---

__Example 1:__
```
Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
```

__Example 2:__
```
Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
Explanation: The arrays we are merging are [1] and [].
The result of the merge is [1].
```

__Example 3:__
```
Input: nums1 = [0], m = 0, nums2 = [1], n = 1
Output: [1]
Explanation: The arrays we are merging are [] and [1].
The result of the merge is [1].
Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
```

__Constraints:__
```
nums1.length == m + n
nums2.length == n
0 <= m, n <= 200
1 <= m + n <= 200
-109 <= nums1[i], nums2[j] <= 109
```

---



__Follow up__: Can you come up with an algorithm that runs in O(m + n) time?

### Two Pointers

```Python
class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        # Two Pointers
        #### Time Complexity : O(N + M), traverse through total length of nums1 and nums2
        #### Space Complexity: O(1), modified in-place, constant memory space for pointers
        n1, n2 = m - 1, n - 1
        length = m + n - 1
        while length >= 0:
            # Check if all numbers from nums2 merged into nums1
            if n2 < 0:
                break
            # Check if edge case example 3 or check the largest number of nums2 > largest number of nums1
            if n1 < 0 or nums2[n2] > nums1[n1]:
                nums1[length] = nums2[n2]
                # Decrement the nums2 to keep checking until found the number in nums2 < number in nums1
                n2 -= 1
            # Since current number in nums1 > number in nums2, swap current number of nums1 with 0
            else:
                nums1[length] = nums1[n1]
                n1 -= 1
            length -= 1
'''
[1,2,3,0,0,0]   [4,5,6]
     |     |         |
     n1    l         n2
     n2 > n1: nums1[l] = nums2[n2]
     n2 = 1
[1,2,3,0,0,6]   [4,5,6]
     |   |         |
     n1  l         n2
     n2 > n1: nums1[l] = nums2[n2]
     n2 = 0
[1,2,3,0,5,6]   [4,5,6]
     | |         |
     n1l         n2
     n2 > n1: nums1[l] = nums2[n2]
     n2 = -1
[1,2,3,4,5,6]   [4,5,6]
n2 < 0: break
'''

'''
[1,2,3,0,0,0]   [2,5,6]
     |     |         |
     n1    l         n2
     n2 > n1: nums1[l] = nums2[n2]
     n2 = 1
[1,2,3,0,0,6]   [2,5,6]
     |   |         |
     n1  l         n2
     n2 > n1: nums1[l] = nums2[n2]
     n2 = 0
[1,2,3,0,5,6]   [2,5,6]
     | |         |
     n1l         n2
     n2 < n1: nums1[l] = nums1[n1]
     n1 = 1
[1,2,0,3,5,6]   [2,5,6]
   | |           |
   n1l          n2
     n2 = n1: nums1[l] = nums2[n2]
     n2 = -1
[1,2,2,3,5,6]   [2,5,6]
n2 < 0: break
'''

'''
[0]   [1]
 |     |
 l     n2
'''
```
