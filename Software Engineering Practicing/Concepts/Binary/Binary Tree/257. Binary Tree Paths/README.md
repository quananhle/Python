## 257. Binary Tree Paths

```Tag```: ```Binary Tree``` [```Depth-First Search```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Queue%20%26%20Stack/Depth-First%20Search) [```Backtracking```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Recursion/Recursion%20II/Backtracking)

#### Difficulty: Easy

Given the ```root``` of a binary tree, return _all root-to-leaf paths in __any order___.

A __leaf__ is a node with no children.

![image](https://user-images.githubusercontent.com/35042430/217871804-30f90637-6de1-4fb5-add1-18f7527b85a7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/12/paths-tree.jpg)
```
Input: root = [1,2,3,null,5]
Output: ["1->2->5","1->3"]
```

__Example 2:__
```
Input: root = [1]
Output: ["1"]
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 100]```.
- ```-100 <= Node.val <= 100```

---

### Backtracking

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def binaryTreePaths(self, root: Optional[TreeNode]) -> List[str]:
        res = list()

        def backtrack(node, path):
            if not node:
                return

            path.append(str(node.val))

            # Check if the current node is leaf node
            if not node.left and not node.right:
                # Add the complete path to the final answer
                res.append("->".join(path))
                # Backtracking from the leaf to its parent node
                path.pop()
                return

            backtrack(node.left, path)
            backtrack(node.right, path)
            
            # Backtracking from wrong paths
            path.pop()

        backtrack(root, [])

        return res
```
