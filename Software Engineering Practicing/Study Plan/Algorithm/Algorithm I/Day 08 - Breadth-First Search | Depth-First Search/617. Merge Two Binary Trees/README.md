## [617. Merge Two Binary Trees](https://leetcode.com/problems/merge-two-binary-trees)

```Tag```: ```Binary Tree``` ```Recursion```

#### Difficulty: Easy

You are given two binary trees ```root1``` and ```root2```.

Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.

Return _the merged tree_.

__Note__: The merging process must start from the root nodes of both trees.

![image](https://user-images.githubusercontent.com/35042430/233476369-6fbbed1a-6969-455f-96c2-b7638e16f5a2.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/05/merge.jpg)
```
Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
Output: [3,4,5,5,4,null,7]
```

__Example 2:__
```
Input: root1 = [1], root2 = [1,2]
Output: [2,2]
``` 

__Constraints:__

- The number of nodes in both trees is in the range ```[0, 2000]```.
- -10<sup>4</sup> <= ```Node.val``` <= 10<sup>4</sup>

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
    def mergeTrees(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root1 and not root2:
            return None
        if not root1:
            return root2
        if not root2:
            return root1

        res = TreeNode(root1.val + root2.val)
        res.left = self.mergeTrees(root1.left, root2.left)
        res.right = self.mergeTrees(root1.right, root2.right)
        return res
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def mergeTrees(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root1 and not root2:
            return None
        if not root1:
            return root2
        if not root2:
            return root1

        root1.val += root2.val
        root1.left = self.mergeTrees(root1.left, root2.left)
        root1.right = self.mergeTrees(root1.right, root2.right)
        return root1
```

### Depth-First Search

#### Recursive Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def mergeTrees(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root1 and not root2:
            return None
        if not root1:
            return root2
        if not root2:
            return root1


        def dfs(node1, node2):
            # Base cases
            if not node1:
                return node2
            if not node2:
                return node1

            res = TreeNode(node1.val + node2.val)

            res.left = dfs(node1.left, node2.left)
            res.right = dfs(node1.right, node2.right)
            return res

        return dfs(root1, root2)
```

#### Iterative Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def mergeTrees(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root1 and not root2:
            return None
        if not root1:
            return root2
        if not root2:
            return root1

        stack = [(root1, root2)]

        while stack:
            node1, node2 = stack.pop()
            if not node1 or not node2:
                continue
            node1.val += node2.val
            if not node1.left:
                node1.left = node2.left
            else:
                stack.append((node1.left, node2.left))
            if not node1.right:
                node1.right = node2.right
            else:
                stack.append((node1.right, node2.right))
                
        return root1
```
