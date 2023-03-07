## [110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)

```Tag```: ```Binary Tree``` ```Recursion```

#### Difficulty: Easy

Given a binary tree, determine if it is height-balanced.

![image](https://user-images.githubusercontent.com/35042430/223297298-49244add-b2d9-41a0-bb32-30e95d92fb77.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/06/balance_1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/06/balance_2.jpg)
```
Input: root = [1,2,2,3,3,null,null,4,4]
Output: false
```

__Example 3:__
```
Input: root = []
Output: true
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 5000]```.
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
    def isBalanced(self, root: Optional[TreeNode]) -> bool:
        if not root:
            return True
        
        def traverse(node):
            # Base case
            if not node:
                return -1
        
            return 1 + max(traverse(node.left), traverse(node.right))
        
        return abs(traverse(root.left) - traverse(root.right)) < 2 and self.isBalanced(root.left) and self.isBalanced(root.right)
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
    def isBalanced(self, root: Optional[TreeNode]) -> bool:
        if not root:
            return True

        def dfs(node):
            if not node:
                return True, -1

            left_balanced, left_height = dfs(node.left)
            if not left_balanced:
                return False, 0
            
            right_balanced, right_height = dfs(node.right)
            if not right_balanced:
                return False, 0
            
            return abs(left_height - right_height) < 2, 1 + max(left_height, right_height)

        ans, height = dfs(root)
        return ans
```
