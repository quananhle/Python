## 102. Binary Tree Level Order Traversal

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the level order traversal of its nodes' values_. (i.e., from left to right, level by level).

![image](https://user-images.githubusercontent.com/35042430/205716493-936130ac-7ba7-451f-af86-ab27ec488698.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
```

__Example 2:__

```
Input: root = [1]
Output: [[1]]
```

__Example 3:__

```
Input: root = []
Output: []
```

__Constraints:__
```
The number of nodes in the tree is in the range [0, 2000].
-1000 <= Node.val <= 1000
```

---

![image](https://leetcode.com/problems/binary-tree-level-order-traversal/Figures/145_transverse.png)

### Recursion

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        # Recursion
        #### Time Complexity: O(N), traverse through the tree in linear time
        #### Space Complexity: O(N), space required to store all nodes for output
        levels = list()
        if not root:
            return levels
        def helper(node, level):
            # Start the current level
            if len(levels) == level:
                levels.append([])
            levels[level].append(node.val)
            # Check if there is a left node
            if node.left:
                helper(node.left, level+1)
            # Check if there is a right node
            if node.right:
                helper(node.right, level+1)
        helper(root, 0)
        return levels
```
