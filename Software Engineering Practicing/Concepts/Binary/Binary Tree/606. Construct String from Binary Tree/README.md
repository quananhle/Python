## [606. Construct String from Binary Tree](https://leetcode.com/problems/construct-string-from-binary-tree)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Easy

Given the ```root``` of a binary tree, construct a string consisting of parenthesis and integers from a binary tree with the preorder traversal way, and return it.

Omit all the empty parenthesis pairs that do not affect the one-to-one mapping relationship between the string and the original binary tree.

![image](https://github.com/quananhle/Python/assets/35042430/6636c295-abf1-4f6d-95f0-507ee9c3f5dd)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/05/03/cons1-tree.jpg)
```
Input: root = [1,2,3,4]
Output: "1(2(4))(3)"
Explanation: Originally, it needs to be "1(2(4)())(3()())", but you need to omit all the unnecessary empty parenthesis pairs. And it will be "1(2(4))(3)"
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/05/03/cons2-tree.jpg)
```
Input: root = [1,2,3,null,4]
Output: "1(2()(4))(3)"
Explanation: Almost the same as the first example, except we cannot omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^4]$.
- $-1000 \le Node.val \le 1000$

---

### Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def tree2str(self, root: Optional[TreeNode]) -> str:
        ans = list()

        def dfs(curr):
            # Base case
            if not curr:
                return

            ans.append(str(curr.val))

            if not curr.left and curr.right:
                ans.extend(['(', ')'])

            if curr.left:
                ans.append('(')
                dfs(curr.left)
                ans.append(')')

            if curr.right:
                ans.append('(')
                dfs(curr.right)
                ans.append(')')

        dfs(root)
        return "".join(ans)
```
