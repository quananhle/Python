## 783. Minimum Distance Between BST Nodes

```Tag```: ```Binary Search Tree```

#### Difficulty: Easy

Given the ```root``` of a Binary Search Tree (BST), return _the minimum difference between the values of any two different nodes in the tree_.

![image](https://user-images.githubusercontent.com/35042430/219536040-5c7f734d-de44-49e7-8776-982753457e4e.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/05/bst1.jpg)
```
Input: root = [4,2,6,1,3]
Output: 1
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/05/bst2.jpg)
```
Input: root = [1,0,48,null,null,12,49]
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range ```[2, 100]```.
- ```0 <= Node.val <= 10^5```
 
---

### Inorder Traversal

#### Recursive Approach

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        # Recursive Inorder Traversal
        if not root:
            return 0

        stack = list()

        def inorder(node):
            if not node:
                return
            
            inorder(node.left)
            stack.append(node.val)
            inorder(node.right)
        
        inorder(root)
        ans = sys.maxsize
        for i in range(1, len(stack)):
            ans = min(ans, stack[i] - stack[i-1])

        return ans
```

#### Space Optimized Recursive Approach

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        # Space Optimized Recursive Inorder Traversal

        if not root:
            return 0

        self.child = None
        self.answer = float("inf")

        def inorder(node):
            if not node:
                return 
            
            inorder(node.left)
            if self.child:
                self.answer = min(self.answer, node.val - self.child.val)
            self.child = node
            inorder(node.right)
            
        inorder(root)
        return self.answer
```

#### Iterative Approach

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        # Iterative Inorder Traversal
        if not root:
            return 0
        
        stack = list()
        tree = list()
        ans = float("inf")

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if root:
                tree.append(root.val)
            root = root.right
        
        for i in range(1, len(tree)):
            ans = min(ans, tree[i] - tree[i-1])
        return ans
```

#### Space Optimized Iterative Approach

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        # Space Optimized Iterative Inorder Traversal
        if not root:
            return 0

        child = None
        stack = list()
        ans = sys.maxsize

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if child:
                ans = min(ans, root.val - child.val)
            child = root
            root = root.right
        
        return ans
```
