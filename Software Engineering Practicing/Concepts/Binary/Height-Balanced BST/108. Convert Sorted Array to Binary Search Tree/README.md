## 108. Convert Sorted Array to Binary Search Tree

```Tag```: ```Depth-First Search``` ```Binary Search``` ```Binary Search Tree```

#### Difficulty: Easy

Given an integer array ```nums``` where the elements are sorted in __ascending order__, convert it to a __height-balanced__ binary search tree.

![image](https://user-images.githubusercontent.com/35042430/216661351-88564e49-a9bb-45ba-8f0b-b90d1f063072.png)

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

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>
- ```nums``` is sorted in a strictly increasing order.

---

### Binary Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sortedArrayToBST(self, nums: List[int]) -> Optional[TreeNode]:
        if not nums:
            return None

        lo, hi = 0, len(nums)-1
        mid = lo + (hi - lo) // 2

        root = TreeNode(nums[mid])
        root.left = self.sortedArrayToBST(nums[:mid])
        root.right = self.sortedArrayToBST(nums[mid+1:])

        return root
```
