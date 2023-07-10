## [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Easy

Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

Note: A leaf is a node with no children.

![image](https://github.com/quananhle/Python/assets/35042430/bfa70f8b-db4b-4a12-a9a2-ce27715d40cf)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/12/ex_depth.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: 2
```

__Example 2__:
```
Input: root = [2,null,3,null,4,null,5,null,6]
Output: 5
```

__Constraints__:

- The number of nodes in the tree is in the range $[0, 10^{5}]$.
- $-1000 <= Node.val <= 1000$

---

### Depth-First Search

![image](https://leetcode.com/problems/minimum-depth-of-binary-tree/Figures/111/111A.png)

- Time Complexity : $\mathcal{O}(N)$
- Space Complexity : $\mathcal{O}(N)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        def dfs(node: Optional[TreeNode], level: int) -> int:
            # Base case
            if not node:
                return float('inf')
            if not node.left and not node.right:
                return level
            return min(dfs(node.left, level + 1), dfs(node.right, level + 1))
        
        return dfs(root, 1)
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        def dfs(node):
            # Base case
            if not node:
                return 0
            
            if not node.left:
                return 1 + dfs(node.right)
            elif not node.right:
                return 1 + dfs(node.left)
            
            return 1 + min(dfs(node.left), dfs(node.right))

        return dfs(root)
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        def dfs(node):
            if not node:
                return 0
            
            left = right = float(inf)
            if node.left: left = dfs(node.left)
            if node.right: right = dfs(node.right)
            if node.left == node.right:
                return 1
            
            return min(left, right) + 1
        
        return dfs(root)
```

### ✅ Breadth-First Search

- Time Complexity : $\mathcal{O}(N)$
- Space Complexity : $\mathcal{O}(N)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        queue = collections.deque([(root, 1)])
        
        while queue:
            node, level = queue.popleft()
            if not node.left and not node.right:
                return level
            if node.left: queue.append((node.left, level + 1))
            if node.right: queue.append((node.right, level + 1))
            
        return -1
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        queue = collections.deque([(root)])
        depth = 1

        while queue:
            size = len(queue)
            while size:
                size -= 1
                node = queue.popleft()
                if not node:
                    continue
                if not node.left and not node.right:
                    return depth
                queue.append(node.left)
                queue.append(node.right)
            depth += 1

        return -1
```
