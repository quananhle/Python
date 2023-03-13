## 101. Symmetric Tree

```Tag```: ```Recursion```

#### Difficulty: Easy

Given the ```root``` of a binary tree, _check whether it is a mirror of itself (i.e., symmetric around its center)_.

![image](https://user-images.githubusercontent.com/35042430/214945564-3d15c64d-d80d-4553-b555-90e7ea1b45d3.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/symtree1.jpg)
```
Input: root = [1,2,2,3,4,4,3]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/19/symtree2.jpg)
```
Input: root = [1,2,2,null,3,null,3]
Output: false
```

__Constraints:__
```
The number of nodes in the tree is in the range [1, 1000].
-100 <= Node.val <= 100
```

---

### Top-Down Recursion

![image](https://leetcode.com/media/original_images/101_Symmetric_Mirror.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        if not root:
            return None

        left = list()
        right = list()

        def left_subtree(node):
            if not node:
                left.append(None)
                return
            else:
                left.append(node.val)
            left_subtree(node.left)
            left_subtree(node.right)

        def right_subtree(node):
            if not node:
                right.append(None)
                return
            else:
                right.append(node.val)
            right_subtree(node.right)
            right_subtree(node.left)

        left_subtree(root.left)
        right_subtree(root.right)

        return left == right
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        def symmetric_traverse(left_subtree, right_subtree):
            if not left_subtree and not right_subtree:
                return True
            if not left_subtree or not right_subtree:
                return False
            if left_subtree.val != right_subtree.val:
                return False
            return symmetric_traverse(left_subtree.left, right_subtree.right) and symmetric_traverse(left_subtree.right, right_subtree.left)

        return symmetric_traverse(root.left, root.right)
```

__Follow up__: Could you solve it both recursively and iteratively?

### Top-Down Iterative

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        stack1 = list()
        stack2 = list()

        left_subtree = [root]
        right_subtree = [root]

        while left_subtree:
            node = left_subtree.pop()
            if node:
                stack1.append(node.val)
            left_subtree.append(node.left) if node.left else stack1.append("L")
            left_subtree.append(node.right) if node.right else stack1.append("R")

        while right_subtree:
            node = right_subtree.pop()
            if node:
                stack2.append(node.val)
            right_subtree.append(node.right) if node.right else stack2.append("L")
            right_subtree.append(node.left) if node.left else stack2.append("R")

        return stack1 == stack2
```
