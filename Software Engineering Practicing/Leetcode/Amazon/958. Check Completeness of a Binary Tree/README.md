## [958. Check Completeness of a Binary Tree](https://leetcode.com/problems/check-completeness-of-a-binary-tree/)

```Tag```: ```Binary Tree```

#### Difficulty: Medium

Given the ```root``` of a binary tree, determine if it is a _complete binary tree_.

In a __complete binary tree__, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between ```1``` and ```2```<sup>h</sup> nodes inclusive at the last level ```h```.
 
![image](https://user-images.githubusercontent.com/35042430/225180039-38c9782a-0a60-48c2-a917-01c7e665f70b.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/12/15/complete-binary-tree-1.png)
```
Input: root = [1,2,3,4,5,6]
Output: true
Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/15/complete-binary-tree-2.png)
```
Input: root = [1,2,3,4,5,null,7]
Output: false
Explanation: The node with value 7 isn't as far left as possible.
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 100]```.
- ```1 <= Node.val <= 1000```

---

### Breadth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isCompleteTree(self, root: Optional[TreeNode]) -> bool:
        # Breadth-First Search
        if not root:
            return True

        prev = False
        queue = collections.deque([root])

        while queue:
            node = queue.popleft()
            if not node:
                prev = True
            else:
                if prev:
                    return False
                queue.append(node.left)
                queue.append(node.right)

        return True
```

### Depth-First Search

![image](https://leetcode.com/problems/check-completeness-of-a-binary-tree/Figures/958/958-2.png)

![image](https://leetcode.com/problems/check-completeness-of-a-binary-tree/Figures/958/958-3.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isCompleteTree(self, root: Optional[TreeNode]) -> bool:
        if not root:
            return True

        def count_nodes(node):
            if not node:
                return 0
            return 1 + count_nodes(node.left) + count_nodes(node.right)

        def dfs(node, i, n):
            if not node:
                return True
            
            # Check if the index of current node is greater or equal the total number of nodes in tree
            if i >= n:
                return False

            return dfs(node.left, 2 * i + 1, n) and dfs(node.right, 2 * i + 2, n)
        
        n = count_nodes(root)
        return dfs(root, 0, n)
```
