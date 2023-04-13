## [350. Intersection of Two Arrays II](https://leetcode.com/problems/intersection-of-two-arrays-ii)

```Tag```: ```Hash Set``` ```Two Pointers```

#### Difficulty: Easy

Given two integer arrays ```nums1``` and ```nums2```, return _an array of their intersection_. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

![image](https://user-images.githubusercontent.com/35042430/231824668-9a75e8c2-9fa9-41ef-a506-ff5b9fa56510.png)

---

__Example 1:__
```
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
```

__Example 2:__
```
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
```

__Constraints:__

- ```1 <= nums1.length, nums2.length <= 1000``
- ```0 <= nums1[i], nums2[i] <= 1000```
 
__Follow up:__

- What if the given array is already sorted? How would you optimize your algorithm?
- What if ```nums1```'s size is small compared to ```nums2```'s size? Which algorithm is better?
- What if elements of ```nums2``` are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

---

