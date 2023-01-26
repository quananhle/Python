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
        
        def left_subtree(stack, node):
            if not node:
                stack.append("None")
                return
            if node:
                stack.append(node.val)
            left_subtree(stack, node.left)
            left_subtree(stack, node.right)

        def right_subtree(stack, node):
            if not node:
                stack.append("None")
                return
            if node:
                stack.append(node.val)
            right_subtree(stack, node.right)
            right_subtree(stack, node.left)
        
        left_subtree(stack1, root)
        right_subtree(stack2, root)
        
        return stack1 == stack2
```


__Follow up__: Could you solve it both recursively and iteratively?
