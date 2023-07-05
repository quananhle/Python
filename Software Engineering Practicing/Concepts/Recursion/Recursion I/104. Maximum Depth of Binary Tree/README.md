## [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Recursion```

#### Difficulty: Easy

Given the ```root``` of a binary tree, return _its maximum depth_.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

![image](https://user-images.githubusercontent.com/35042430/217079209-78c4f467-182b-47c0-8edb-ed98a1c5c32a.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: 3
```

__Example 2:__
```
Input: root = [1,null,2]
Output: 2
```

__Constraints:__

- The number of nodes in the tree is in the range [0, 10<sup>4</sup>].
- ```-100 <= Node.val <= 100```

---

### One Liner

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        # One Liner
        return 0 if not root else 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))
```

### Depth-First Search

#### Recursive

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        ans = 0

        def dfs(node, level):
            if not node:
                return 0
            
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)

            nonlocal ans
            ans = max(ans, level)
            return ans
        
        return dfs(root, 1)
```

#### Iterative

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        # Iterative DFS
        if not root:
            return 0
        
        queue = collections.deque([(root, 1)])

        while queue:
            node, level = queue.popleft()
            if node.left: queue.append((node.left, level + 1))
            if node.right: queue.append((node.right, level + 1))
        
        return level
```
