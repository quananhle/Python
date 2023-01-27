## 105. Construct Binary Tree from Preorder and Inorder Traversal

```Tag```: ```Recursion``` ```Binary Tree``` ```Hash Map```

#### Difficulty: Medium

Given two integer arrays ```preorder``` and ```inorder``` where ```preorder``` is the preorder traversal of a binary tree and ```inorder``` is the inorder traversal of the same tree, construct and return the _binary tree_.

![image](https://user-images.githubusercontent.com/35042430/215055846-3a6f0fef-df46-4a3d-828c-784202497c8c.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
```

__Example 2:__
```
Input: preorder = [-1], inorder = [-1]
Output: [-1]
```

__Constraints:__

- ```1 <= preorder.length <= 3000```
- ```inorder.length == preorder.length```
- ```-3000 <= preorder[i], inorder[i] <= 3000```
- ```preorder``` and ```inorder``` consist of unique values.
- Each value of ```inorder``` also appears in ```preorder```.
- ```preorder``` is __guaranteed__ to be the preorder traversal of the tree.
- ```inorder``` is __guaranteed__ to be the inorder traversal of the tree.

---

![image](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solutions/1102530/Figures/105/105-Page-1.png)

1. ```Preorder``` traversal follows ```Root -> Left -> Right```; therefore, given the preorder array ```preorder```, we have easy access to the root which is ```preorder[0]```.

2. ```Inorder``` traversal follows ```Left -> Root -> Right```; therefore if we know the position of ```Root```, we can recursively split the entire array into two subtrees.

![image](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solutions/1102530/Figures/105/105-Page-2.png)

### Recursion

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        #### Time Complexity: O(N), traverse every node once
        #### Space Complexity: O(N), rebuild the tree of all nodes
        idx_map = collections.defaultdict(int)
        for idx, val in enumerate(inorder):
            idx_map[val] = idx

        queue = collections.deque(preorder)

        def helper(left, right):
            # Base case:
            if left > right:
                return

            # Get the root node value from preorder traversal
            val = queue.popleft()
            # Build the tree from the root node
            root = TreeNode(val)

            # Get the index value of the root node from inorder traversal
            idx = idx_map[val]

            # Rebuilding the tree from inorder traversal starts from left subtree
            root.left = helper(left, idx - 1)
            # Rebuilding the right subtree 
            root.right = helper(idx + 1, right)

            return root

        return helper(0, len(inorder) - 1)
```
