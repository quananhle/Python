## 100. Same Tree

```Tag```: ```Depth-First Search``` ```Binary Tree``` [```Recursion```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Recursion/Recursion%20II)

#### Difficulty: Easy

Given the roots of two binary trees ```p``` and ```q```, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

![image](https://user-images.githubusercontent.com/35042430/211455297-7a961d14-4c63-443e-a3b8-d7387aa960de.png)

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
        if not p or not q:
            return False
        if p.val != q.val:
            return False            
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
        def tree(root, node):
            if root:
                node.append(root.val)
                if root.left:
                    node = tree(root.left, node)
                else:
                    node.append(None)
                if root.right:
                    node = tree(root.right, node)
                else:
                    node.append(None)
            else:
                node.append(None)
            return node

        return tree(p, []) == tree(q, [])
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
