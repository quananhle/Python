## 701. Insert into a Binary Search Tree

```Tag```: ```Binary Search Tree``` ```Recursion``` ```Depth-First Search```

#### Difficulty: Medium

You are given the ```root``` node of a __binary search tree (BST)__ and a ```value``` to insert into the tree. Return _the root node of the BST after the insertion_. It is guaranteed that the new value does not exist in the original BST.

__Notice__ that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return __any of them__.

![image](https://user-images.githubusercontent.com/35042430/215681681-b02e34c6-aa17-4aff-ab70-e8d3cb779202.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/05/insertbst.jpg)
```
Input: root = [4,2,7,1,3], val = 5
Output: [4,2,7,1,3,5]
Explanation: Another accepted tree is:
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/05/bst.jpg)
```
Input: root = [40,20,60,10,30,50,70], val = 25
Output: [40,20,60,10,30,50,70,null,null,25]
```

__Example 3:__
```
Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
Output: [4,2,7,1,3,5]
```

__Constraints:__

- The number of nodes in the tree will be in the range [0, 10<sup>4</sup>].
- -10<sup>8</sup> <= Node.val <= 10<sup>8</sup>
- All the values ```Node.val``` are unique.
- -10<sup>8</sup> <= val <= 10<sup>8</sup>
- It's __guaranteed__ that ```val``` does not exist in the original BST.

---

### Iterative Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def insertIntoBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        if not root:
            return TreeNode(val)
        curr = prev = root
        while curr:
            # Note the parent pointer before traversing
            prev = curr
            # Traverse left
            if curr.val > val:
                curr = curr.left
                if not curr:
                    prev.left = TreeNode(val)
            # Traverse right
            else:
                curr = curr.right
                if not curr:
                    prev.right = TreeNode(val)
        return root
```

### Recursive BST Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def insertIntoBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        if not root:
            return TreeNode(val)
        if root.val > val:
            root.left = self.insertIntoBST(root.left, val)
        else:
            root.right = self.insertIntoBST(root.right, val)
        return root
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
    def insertIntoBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        def dfs(node):
            # Base case
            if not node:
                return TreeNode(val)
                
            if node.val > val:
                node.left = dfs(node.left)
            else:
                node.right = dfs(node.right)
            return node

        return dfs(root)
```
