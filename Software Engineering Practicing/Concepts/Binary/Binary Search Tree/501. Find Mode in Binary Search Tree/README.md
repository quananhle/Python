## [501. Find Mode in Binary Search Tree](https://leetcode.com/problems/find-mode-in-binary-search-tree)

```Tag```: ```Binary Search Tree``` ```Depth-First Search``` ```Breadth-First Search``` ```Hash Map``` ```Morris's Traversal```

#### Difficulty: Easy

Given the ```root``` of a binary search tree (BST) with duplicates, return _all the mode(s) (i.e., the most frequently occurred element) in it_.

If the tree has more than one mode, return them in any order.

Assume a BST is defined as follows:

- The left subtree of a node contains only nodes with keys less than or equal to the node's key.
- The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
- Both the left and right subtrees must also be binary search trees.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/11/mode-tree.jpg)
```
Input: root = [1,null,2,2]
Output: [2]
```

__Example 2:__
```
Input: root = [0]
Output: [0]
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^4]$.
- $-10^5 \le Node.val \le 105$
 
---

### In-order Traversal

#### Iterative In-order Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        stack = list()
        freq = collections.Counter()

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            freq[root.val] = freq.get(root.val, 0) + 1
            root = root.right

        res = list()
        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

### Depth-First Search

#### Recursive DFS

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        freq = collections.defaultdict(int)
        res = list()

        def dfs(node):
            if not node:
                return None
            
            freq[node.val] = 1 + freq.get(node.val, 0)
            dfs(node.left)
            dfs(node.right)
        
        dfs(root)
        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

#### Iterative DFS

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        stack = [root]
        freq = collections.defaultdict(int)
        res = list()

        while stack:
            node = stack.pop()
            freq[node.val] = 1 + freq.get(node.val, 0)

            if node.left: stack.append(node.left)
            if node.right: stack.append(node.right)

        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

### Breadth-First Search

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/bfs.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        queue = collections.deque([(root)])
        freq = collections.defaultdict(int)
        res = list()

        while queue:
            n = len(queue)

            for _ in range(n):
                node = queue.popleft()
                freq[node.val] = 1 + freq.get(node.val, 0)

                if node.left: queue.append(node.left)
                if node.right: queue.append(node.right)

        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

---

### Binay Search Tree Property

#### Recursive Inorder Traversal

So far, we have not taken advantage of the fact that the input tree is a binary search tree (with duplicates). The first three approaches would work for any binary tree.

If you perform an inorder DFS traversal on a binary search tree (BST), you will handle the nodes in sorted order. Why?

Recall that in a BST, all nodes to the left are less than the current node and all nodes to the right are greater than the current node. In an inorder traversal, we handle all the nodes on the left first, then the current node, then all the nodes to the right.

```Python

```

---

__Follow up__: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).

### Morris Traversal

```Python

```
