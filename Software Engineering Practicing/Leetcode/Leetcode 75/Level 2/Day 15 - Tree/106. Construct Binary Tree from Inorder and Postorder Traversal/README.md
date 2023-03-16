## [106. Construct Binary Tree from Inorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)

```Tag```: ```Binary Tree``` ```Recursion```

#### Difficulty: Medium

Given two integer arrays ```inorder``` and ```postorder``` where ```inorder``` is the inorder traversal of a binary tree and ```postorder``` is the postorder traversal of the same tree, construct and return _the binary tree_.

![image](https://user-images.githubusercontent.com/35042430/225526472-ec047986-2edc-4a4c-83fe-d888ca02be70.png)

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
        n = len(inorder)

        memo = collections.defaultdict(int)
        for idx, num in enumerate(inorder):
            memo[num] = idx

        def build(left, right):
            if left > right:
                return 

            val = postorder.pop()
            root = TreeNode(val)

            '''
            index = inorder.index(val)
            '''
            index = memo[val]

            # Pop from postorder the right nodes before left nodes, hence build right subtree first
            right_subtree = build(index + 1, right)
            left_subtree = build(left, index - 1)

            root.left = left_subtree
            root.right = right_subtree
            return root

        return build(0, n - 1)
```
