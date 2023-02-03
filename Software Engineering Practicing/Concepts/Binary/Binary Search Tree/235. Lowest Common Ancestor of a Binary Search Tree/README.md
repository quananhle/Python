## 235. Lowest Common Ancestor of a Binary Search Tree

```Tag```: ```Binary Search Tree```

#### Difficulty: Medium

Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes ```p``` and ```q``` as the lowest node in ```T``` that has both ```p``` and ```q``` as descendants (where we allow a node to be a descendant of itself).”

![image](https://user-images.githubusercontent.com/35042430/216522706-666a4974-e718-457a-90fc-5663b76f7491.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)
```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)
```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
Output: 2
Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
```

__Example 3:__
```
Input: root = [2,1], p = 2, q = 1
Output: 2
```

__Constraints:__

- The number of nodes in the tree is in the range [2, 10<sup>5</sup>].
- -10<sup>9</sup> <= ```Node.val``` <= 10<sup>9</sup>
- All ```Node.val``` are unique.
- ```p != q```
- ```p``` and ```q``` will exist in the BST.

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
        #### Time Complexity: O(N) where N is the number of nodes in the binary tree
        #### Space Complexity: O(N), extra memory space to keep up the recursion stack
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
            # Check if any of mid or left or right is True, meaning p or q was found, or False, meaning p or q has not been found yet
            return mid or left or right
        
        helper(root)
        return ans
```
