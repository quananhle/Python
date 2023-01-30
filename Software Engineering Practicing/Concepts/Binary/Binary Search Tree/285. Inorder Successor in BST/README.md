## 285. Inorder Successor in BST

```Tag```: ```Binary Search Tree``` ```Depth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary search tree and a node ```p``` in it, return the in-order successor of that node in the BST. If the given node has no in-order successor in the tree, return ```null```.

The successor of a node ```p``` is the node with the smallest key greater than ```p.val```.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/01/23/285_example_1.PNG)
```
Input: root = [2,1,3], p = 1
Output: 2
Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/01/23/285_example_2.PNG)
```
Input: root = [5,3,6,2,4,null,null,1], p = 6
Output: null
Explanation: There is no in-order successor of the current node, so the answer is null.
```

__Constraints:__

- The number of nodes in the tree is in the range [1, 10<sup>4</sup>].
- -10<sup>5</sup> <= Node.val <= 10<sup>5</sup>
- All Nodes will have unique values.

---

### Iterative Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def inorderSuccessor(self, root: TreeNode, p: TreeNode) -> Optional[TreeNode]:
        #### Time Complexity: O(N), visit every node in the root once
        #### Space Complexity: O(N), stack contains as many as N nodes
        stack = list()
        found = False
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if found:
                return root
            value = root.val
            if value == p.val:
                found = True
            root = root.right
        return root
```

### Binary Search Properties

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def inorderSuccessor(self, root: TreeNode, p: TreeNode) -> Optional[TreeNode]:
        #### Time Complexity: O(N), visit every node in the root once in a skewed tree
        #### Space Complexity: O(1), constant memory space to keep track of successor node
        successor = None
        while root:
            if p.val < root.val:
                successor = root
                root = root.left
            else:
                root = root.right
        return successor
```
