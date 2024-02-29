## [513. Find Bottom Left Tree Value](https://leetcode.com/problems/find-bottom-left-tree-value)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the ```leftmost``` value in the last row of the tree_.

![image](https://github.com/quananhle/Python/assets/35042430/ebd50a6a-ccef-47e5-bb2c-1ffb36d704d3)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/14/tree1.jpg)
```
Input: root = [2,1,3]
Output: 1
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/14/tree2.jpg)
```
Input: root = [1,2,3,4,null,5,6,null,null,7]
Output: 7
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^4]$.
- $-2^{31} \le Node.val \le 2^{31} - 1$

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
    def findBottomLeftValue(self, root: Optional[TreeNode]) -> int:
        max_depth = -1
        ans = 0

        def dfs(curr, level):
            nonlocal ans, max_depth
            # Base case
            if not curr:
                return
            
            if level > max_depth:
                max_depth = level
                ans = curr.val

            dfs(curr.left, level + 1)
            dfs(curr.right, level + 1)

        dfs(root, 0)
        return ans
```

### Breadth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findBottomLeftValue(self, root: Optional[TreeNode]) -> int:
        node, level = 0, -1

        queue = collections.deque()
        queue.append([root, 0])

        while queue:
            size = len(queue)
            for _ in range(size):
                curr_node, curr_level = queue.popleft()
                if level < curr_level:
                    node = curr_node.val
                    level = curr_level
                if curr_node.left:
                    queue.append([curr_node.left, curr_level + 1])
                if curr_node.right:
                    queue.append([curr_node.right, curr_level + 1])

        return node
```

#### BFS Property

BFS of a tree is often implemented such that the left child of a given node is visited first, then the right child. If we implement BFS such that the right child of a given node is visited first, then the left child, the last node we visit is the leftmost node in the bottom level of the tree. This makes a variable for depth unnecessary. We can just return the value of the last node we encounter during the search.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findBottomLeftValue(self, root: Optional[TreeNode]) -> int:
        queue = collections.deque([root])

        while queue:
            curr = queue.popleft()

            if curr.right:
                queue.append(curr.right)
            if curr.left:
                queue.append(curr.left)

            node = curr.val

        return node
```
