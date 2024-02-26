## [100. Same Tree](https://leetcode.com/problems/same-tree/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` [```Binary Tree```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Tree) ```Recursion```

#### Difficulty: Easy

Given the roots of two binary trees ```p``` and ```q```, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

![image](https://github.com/quananhle/Python/assets/35042430/238c9eff-8dac-460b-8ce2-49d2916a2c0c)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/20/ex1.jpg)
```
Input: p = [1,2,3], q = [1,2,3]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/20/ex2.jpg)
```
Input: p = [1,2], q = [1,null,2]
Output: false
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/12/20/ex3.jpg)
```
Input: p = [1,2,1], q = [1,1,2]
Output: false
```

__Constraints:__
```
The number of nodes in both trees is in the range [0, 100].
-104 <= Node.val <= 104
```

---

### Recursion

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        # Time complexity : O(N), where N is a number of nodes in the tree
        # Space complexity: O(N), to keep a recursion stack.
        if not p and not q:
            return True
        elif not p or not q:
            return False
        elif p.val != q.val:
            return False
        else:
            return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right)
```

### Recursive Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        # Recursive Depth-First Search
        def dfs(root, node):
            if root:
                node.append(root.val)
                if root.left:
                    node = dfs(root.left, node)
                else:
                    node.append(None)
                if root.right:
                    node = dfs(root.right, node)
                else:
                    node.append(None)
            else:
                node.append(None)
            return node

        return dfs(p, []) == dfs(q, [])
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        # Rebuild the p and q trees into arrays
        tree1 = list()
        tree2 = list()

        def build(node, tree):
            if not node:
                tree.append(None)
                return
            else:
                tree.append(node.val)
            build(node.left, tree)
            build(node.right, tree)
            return tree

        return build(p, []) == build(q, [])
```

### Iterative Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        # Iterative Depth First-Search
        stack = [(p, q)]
        while stack:
            (p, q) = stack.pop()
            if p and q and p.val == q.val:
                stack.extend([(p.left, q.left), (p.right, q.right)])
            elif p or q:
                return False
        return True
```

### Iterative Breadth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        queue = collections.deque([(p, q)])

        while queue:
            l, r = queue.popleft()

            if not l and not r:
                continue
            elif not l or not r or l.val != r.val:
                return False
            else:
                '''
                queue.append((l.left, r.left))
                queue.append((l.right, r.right))
                '''
                queue.extend(((l.left, r.left), (l.right, r.right)))
        return True
```
