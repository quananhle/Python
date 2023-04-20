## [1372. Longest ZigZag Path in a Binary Tree](https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/)

```Tag```: [```Binary Tree```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Tree) ```Depth-First Search```

#### Difficulty: Medium

You are given the ```root``` of a binary tree.

A ZigZag path for a binary tree is defined as follow:

- Choose any node in the binary tree and a direction (right or left).
- If the current direction is right, move to the right child of the current node; otherwise, move to the left child.
- Change the direction from right to left or from left to right.
- Repeat the second and third steps until you can't move in the tree.

Zigzag length is defined as the number of nodes visited - 1. (A single node has a length of 0).

Return _the longest ZigZag path contained in that tree_.

![image](https://user-images.githubusercontent.com/35042430/232969920-ad6063e5-838d-4906-962c-e4f7e4836f6a.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2020/01/22/sample_1_1702.png)
```
Input: root = [1,null,1,1,1,null,null,1,1,null,1,null,null,null,1,null,1]
Output: 3
Explanation: Longest ZigZag path in blue nodes (right -> left -> right).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/01/22/sample_2_1702.png)
```
Input: root = [1,1,1,null,1,null,null,1,1,null,1]
Output: 4
Explanation: Longest ZigZag path in blue nodes (left -> right -> left -> right).
```

__Example 3:__
```
Input: root = [1]
Output: 0
```

__Constraints:__

- The number of nodes in the tree is in the range [1, 5 * 10<sup>4</sup>].
- ```1 <= Node.val <= 100```

---

### Depth-First Search

![image](https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/Figures/1372/1372-1.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def longestZigZag(self, root: Optional[TreeNode]) -> int:
        if not root:
            return None
        
        self.ans = 0

        def dfs(node, is_left, steps):
            if node:
                self.ans = max(self.ans, steps)
                if is_left:
                    dfs(node.left, False, steps + 1)
                    dfs(node.right, True, 1)
                else:
                    dfs(node.right, True, steps + 1)
                    dfs(node.left, False, 1)

        dfs(root, True, 0)
        return self.ans
```
