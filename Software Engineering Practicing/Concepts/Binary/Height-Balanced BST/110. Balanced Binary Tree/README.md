## 110. Balanced Binary Tree

```Tag```: ```Binary Search Tree``` ```Dynamic Programming```

#### Difficulty: Easy

Given a binary tree, determine if it is ```height-balanced```.

![image](https://user-images.githubusercontent.com/35042430/216547327-d3018002-938e-4040-9b02-f1de94fb3785.png)

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

### Top-Down Dynamic Programming

#### Recursion

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

        def get_height(node):
            if not node:
                return -1
            return 1 + max(get_height(node.left), get_height(node.right))

        return abs(get_height(root.left) - get_height(root.right)) < 2 and self.isBalanced(root.left) and self.isBalanced(root.right)
```

### Bottom-Up Recursion

#### Cache

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
        
        def helper(node):
            if not node:
                return True, -1
                
            right_balanced, right_height = helper(node.right)
            if not right_balanced:
                return False, 0

            left_balanced, left_height = helper(node.left)
            if not left_balanced:
                return False, 0

            return (abs(left_height - right_height) < 2), (1 + max(right_height, left_height))
        
        ans, height = helper(root)
        return ans
```
