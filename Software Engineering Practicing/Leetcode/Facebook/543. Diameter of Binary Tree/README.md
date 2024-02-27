## [543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Easy

Given the ```root``` of a binary tree, return _the length of the diameter of the tree_.

The __diameter__ of a binary __tree__ is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The __length__ of a path between two nodes is represented by the number of edges between them.

![image](https://github.com/quananhle/Python/assets/35042430/3669e5f3-7433-4abc-b2bc-df275834ad92)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg)
```
Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
```

__Example 2:__

```
Input: root = [1,2]
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^4]$.
- $-100 \le Node.val \le 100$

---

### Depth-First Search

![image](https://leetcode.com/problems/diameter-of-binary-tree/Figures/543/543.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        diameter = 0

        def dfs(node):
            nonlocal diameter

            if not node:
                return 0

            left_path = dfs(node.left)
            right_path = dfs(node.right)
            diameter = max(diameter, left_path + right_path)

            return max(left_path, right_path) + 1
        
        dfs(root)
        return diameter
```
