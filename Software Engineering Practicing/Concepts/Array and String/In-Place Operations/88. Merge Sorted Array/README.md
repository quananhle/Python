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
