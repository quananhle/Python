## [543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Easy

Given the ```root``` of a binary tree, return _the length of the diameter of the tree_.

The __diameter__ of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the ```root```.

The length of a path between two nodes is represented by the number of edges between them.

![image](https://user-images.githubusercontent.com/35042430/223796156-b895d3ba-272f-4e67-901e-cac3e9490424.png)

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

- The number of nodes in the tree is in the range [1, 10<sup>4</sup>].
- ```-100 <= Node.val <= 100```

---

![image](https://leetcode.com/problems/diameter-of-binary-tree/Figures/543/543.png)
Two cases of the longest path.

- __Time complexity__: ```O(N)```
- __Space complexity__: ```O(N)```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        if not root:
            return root
        
        self.ans = 0

        def dfs(node):
            if not node:
                return 0

            # Recursively find the longest path in both left child and right child
            left_path = dfs(node.left)
            right_path = dfs(node.right)

            # Update the diameter if left_path plus right_path is larger
            self.ans = max(self.ans, left_path + right_path)

            # Return the longest one between left_path and right_path and add 1 for the path connecting the node and its parent
            return max(left_path, right_path) + 1
        
        dfs(root)
        return self.ans
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        if not root:
            return root

        def dfs(node):
            if not node:
                return 0

            left_height = dfs(node.left) 
            right_height = dfs(node.right)
            
            self.ans = max(self.ans, left_height + right_height)
            return max(left_height, right_height) + 1 
                
        self.ans = 0
        dfs(root)
        return self.ans
```
