## 226. Invert Binary Tree

```Tag```: ```Binary Tree``` ```Recursion``` ```Breadth-First Search```

#### Difficulty: Easy

Given the ```root``` of a binary tree, invert the tree, and return _its root_.

![image](https://user-images.githubusercontent.com/35042430/219834721-1c68f77f-66b1-426a-a302-fef0967541d8.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/14/invert1-tree.jpg)
```
Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/14/invert2-tree.jpg)
```
Input: root = [2,1,3]
Output: [2,3,1]
```

__Example 3:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 100]```.
- ```-100 <= Node.val <= 100```

---

### Recursive

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # Recursive
        if not root:
            return None
        
        head = root

        left_child = self.invertTree(head.left)
        right_child = self.invertTree(head.right)

        head.left = right_child
        head.right = left_child

        return head
```

### Iterative

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # Iterative
        if not root:
            return None

        queue = collections.deque([root])
        
        while queue:
            node = queue.popleft()
            node.left, node.right = node.right, node.left

            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)

        return root 
```
