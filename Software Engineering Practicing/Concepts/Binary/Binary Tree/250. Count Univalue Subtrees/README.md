## 250. Count Univalue Subtrees

```Tag```: ```Bottom-Up Recursion```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the number of __uni-value__ subtrees_.

A __uni-value subtree__ means all nodes of the subtree have the same value.

![image](https://user-images.githubusercontent.com/35042430/214969844-0780f598-c82f-4bce-adb0-5eebdf5b2d5b.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/21/unival_e1.jpg)
```
Input: root = [5,1,5,5,5,null,5]
Output: 4
```

__Example 2:__
```
Input: root = []
Output: 0
```

__Example 3:__
```
Input: root = [5,5,5,5,5,null,5]
Output: 6
```

__Constraints:__

- The number of the node in the tree will be in the range ```[0, 1000]```.
- ```-1000 <= Node.val <= 1000```

---

### Bottom-Up Recursion

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countUnivalSubtrees(self, root: Optional[TreeNode]) -> int:
        # Bottom-Up Recursion
        self.count = 0

        def check_unique(node):
            # Base case
            if not node:
                return True

            # Traverse to the leaf nodes, check its value and its child value and count them, then go up
            left_subtree = check_unique(node.left)
            right_subtree = check_unique(node.right)
            
            # Check if at the leaf node or child node has same value
            if left_subtree and right_subtree:
                # Check parent value is equal to both children's values if exist, then root node is uni-value subtrees
                if (not node.left or node.left.val == node.val) and (not node.right or node.right.val == node.val):
                    self.count += 1
                    return True
            return False

        check_unique(root)
        
        return self.count
```
