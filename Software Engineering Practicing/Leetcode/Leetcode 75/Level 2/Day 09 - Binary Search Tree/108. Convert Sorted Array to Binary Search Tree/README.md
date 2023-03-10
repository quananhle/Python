## [108. Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree)

```Tag```: ```Binary Search Tree```

#### Difficulty: Easy

Given an integer array ```nums``` where the elements are sorted in __ascending order__, convert it to a __height-balanced__ binary search tree.

![image](https://user-images.githubusercontent.com/35042430/224209437-f7d3bf64-b417-4214-9de8-53b6607ab3c6.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/18/btree1.jpg)
```
Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:
```
![image](https://assets.leetcode.com/uploads/2021/02/18/btree2.jpg)

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/18/btree.jpg)
```
Input: nums = [1,3]
Output: [3,1]
Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
```

__Constraints:__

- ```1 <= nums.length <= 10^4```
- ```-10^4 <= nums[i] <= 10^4```
- ```num```s is sorted in a __strictly increasing order__.

---

