## 700. Search in a Binary Search Tree

```Tag```: ```Depth-First Search``` ```Binary Search Tree``` ```Recursion```

#### Difficulty: Easy

You are given the ```root``` of a binary search tree (BST) and an integer ```val```.

Find the node in the BST that the node's value equals ```val``` and return _the subtree rooted with that node_. If such a node does not exist, return ```null```.

![image](https://user-images.githubusercontent.com/35042430/215680878-adfe86e7-502f-4f8b-86dc-a2ef4ed99a40.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/12/tree1.jpg)
```
Input: root = [4,2,7,1,3], val = 2
Output: [2,1,3]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/01/12/tree2.jpg)
```
Input: root = [4,2,7,1,3], val = 5
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 5000]```.
- 1 <= Node.val <= 10<sup7</sup>
- ```root``` is a binary search tree.
- 1 <= val <= 10<sup>7</sup>

---

### Iterative Traversal BST
 
```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def searchBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        if not root:
            return root
        if root.val == val:
            return root
        curr = root
        while curr:
            if curr.val > val:
                curr = curr.left
            elif curr.val < val:
                curr = curr.right
            else:
                return curr
        return curr
```


### Recursive Traversal BST

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def searchBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        if not root or root.val == val:
            return root
        else:
            return self.searchBST(root.left, val) if root.val > val else self.searchBST(root.right, val)
```

### Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def searchBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        self.subtree = None

        def dfs(node):
            if node:
                if val == node.val:
                    self.subtree = node
                else:
                    dfs(node.left)
                    dfs(node.right)

        dfs(root)

        return self.subtree
```
                
