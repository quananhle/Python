## [106. Construct Binary Tree from Inorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)

```Tag```: ```Binary Tree``` ```Recursion```

#### Difficulty: Medium

Given two integer arrays ```inorder``` and ```postorder``` where ```inorder``` is the inorder traversal of a binary tree and ```postorder``` is the postorder traversal of the same tree, construct and return _the binary tree_.

![image](https://user-images.githubusercontent.com/35042430/225526853-62b4bdfc-2511-4978-9248-3d6bfc06c8a9.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```
Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
Output: [3,9,20,null,null,15,7]
```

__Example 2:__
```
Input: inorder = [-1], postorder = [-1]
Output: [-1]
```

__Constraints:__

- ```1 <= inorder.length <= 3000```
- ```postorder.length == inorder.length```
- ```-3000 <= inorder[i], postorder[i] <= 3000```
- ```inorder``` and ```postorder``` consist of __unique__ values.
- Each value of __postorder__ also appears in __inorder__.
- ```inorder``` is __guaranteed__ to be the inorder traversal of the tree.
- ```postorder``` is __guaranteed__ to be the postorder traversal of the tree.

---

![image](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/solutions/298219/Figures/106/bfs_dfs.png)

![image](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/solutions/298219/Figures/106/recursion.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> Optional[TreeNode]:
        #### Time Complexity: O(N), traverse through every node once
        #### Space Complexity: O(N), build a tree containing all nodes
        # Build hash map of index values of element in inorder
        idx_map = collections.defaultdict(int)
        for idx, val in enumerate(inorder):
            idx_map[val] = idx
            
        def helper(left, right):
            if left > right:
                return None

            # Get the root node, last element of postorder
            root_val = postorder.pop()
            root = TreeNode(root_val)
        
            # Get the index of the root node in inorder
            root_idx = idx_map[root_val]
            
            # Build right subtree
            root.right = helper(root_idx + 1, right)
            
            # Build left subtree
            root.left = helper(left, root_idx - 1)
            
            return root

        return helper(0, len(inorder) - 1)
```
