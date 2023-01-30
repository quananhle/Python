## 236. Lowest Common Ancestor of a Binary Tree

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

![image](https://user-images.githubusercontent.com/35042430/215356897-53fc9b21-e3b5-444d-8b1c-a01a9f71ef8d.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
Output: 5
Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
```

__Example 3:__
```
Input: root = [1,2], p = 1, q = 2
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range [2, 10<sup>5</sup>].
- -10<sup>9</sup> <= Node.val <= 10<sup>9</sup>
- All ```Node.val``` are unique.
- ```p != q```
- ```p``` and ```q``` will exist in the tree.

---

### Recursion

![image](https://user-images.githubusercontent.com/35042430/215383286-62467197-b6c8-4fa2-af82-4dde34945c60.png)

Following is the sequence of nodes that are followed in the recursion:

```
1 --> 2 --> 4 --> 8
BACKTRACK 8 --> 4
4 --> 9 (ONE NODE FOUND, return True)
BACKTRACK 9 --> 4 --> 2
2 --> 5 --> 10
BACKTRACK 10 --> 5
5 --> 11 (ANOTHER NODE FOUND, return True)
BACKTRACK 11 --> 5 --> 2
```

2 is the node where we have ```left = True``` and ```right = True``` and hence it is the __lowest common ancestor__.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        # Bottom-Up Recursion
    
        ans = 0

        def helper(curr):
            nonlocal ans
            if not curr:
                return False
            # Traverse to the bottom left
            left = helper(curr.left)
            # Traverse to the bottom right:
            right = helper(curr.right)
            # Check if the current node is p or q
            '''
            mid = curr == p or curr == q
            '''
            if curr == p or curr == q:
                mid = True
            else:
                mid = False
            # Check if any two of the three flags left, right or mid become True.
            if mid + left + right >= 2:
                ans = curr
            # Check if any of mid or left or right is True, meaning p or q was found
            return mid or left or right
        
        helper(root)
        return ans
```
