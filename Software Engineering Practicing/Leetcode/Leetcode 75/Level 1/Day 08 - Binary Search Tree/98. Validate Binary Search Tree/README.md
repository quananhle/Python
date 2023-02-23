## 98. Validate Binary Search Tree

#### Difficulty: Medium

Given the ```root``` of a binary tree, _determine if it is a valid binary search tree (BST)_.

A __valid BST__ is defined as follows:

- The left subtree of a node contains only nodes with keys __less than__ the node's key.
- The right subtree of a node contains only nodes with keys __greater than__ the node's key.
- Both the left and right subtrees must also be binary search trees.

<img width="545" alt="image" src="https://user-images.githubusercontent.com/35042430/206097698-15c5f56e-a51a-4e46-9612-501892ce15a4.png">

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/01/tree1.jpg)

```
Input: root = [2,1,3]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/01/tree2.jpg)

```
Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
```

__Constraints:__

```
The number of nodes in the tree is in the range [1, 104].
-231 <= Node.val <= 231 - 1
```

---

### DFS Recursion
![image](https://leetcode.com/problems/validate-binary-search-tree/solutions/204551/Figures/98/98_not_bst.png)
![image](https://leetcode.com/problems/validate-binary-search-tree/solutions/204551/Figures/98/98_not_bst_3.png)

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        # DFS Recursive Traversal with Valid Range
        #### Time Complexity: O(N), traverse every node through the tree
        #### Space Complexity: O(N), keep up to the entire tree
        def validate(node, lo=-sys.maxsize-1, hi=sys.maxsize):
            # Base cases:
            # Empty trees are valid BSTs            
            if not node:
                return True
            # Check if node.val outside of the valid range
            if node.val <= lo or hi <= node.val:
                return False
            # Validate left child node and right child node of the root node
            return validate(node.left, lo, node.val) and validate(node.right, node.val, hi )
        return validate(root)
```

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        # Iterative Traversal with Valid Range
        #### Time Complexity: O(N), traverse every node through the tree
        #### Space Complexity: O(N), keep up to the entire tree
        """
        stack = [(root, -sys.maxsize-1, sys.maxsize)]
        if not root:
            return True
        while stack:
            node, low, high = stack.pop()
            if not node:
                continue
            if node.val <= low or high <= node.val:
                return False
            stack.append((node.left, low, node.val))
            stack.append((node.right, node.val, high))
        return True
```

### Depth-First Search

![image](https://leetcode.com/problems/validate-binary-search-tree/solutions/204551/Figures/145_transverse.png)
![image](https://leetcode.com/problems/validate-binary-search-tree/solutions/204551/Figures/98/98_bst_inorder.png)

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        # Depth-First Search
        #### Time Complexity: O(N), the bad element is a rightmost leaf
        #### Space Complexity: O(N), space on the run-time stack
        # -2^31 <= Node.val <= 2^31 - 1        
        self.node = -sys.maxsize-1
        def dfs(root):
            # Base cases:
            # Empty trees are valid BSTs
            if not root:
                return True
            # Check if not left node, not BST
            if not dfs(root.left):
                return False
            # Check if right node smaller than or equals key node
            if root.val <= self.node:
                return False
            self.node = root.val
            # Check the right node
            return dfs(root.right)
        return dfs(root)
```
```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        # Iterative Inorder Traversal
        #### Time Complexity: O(N), when the bad element is at the rightmost leaf
        #### Space Complexity: O(N), to keep stack
        stack = list()
        node = -sys.maxsize-1
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if root.val <= node:
                return False
            node = root.val
            root = root.right
        return True
```

