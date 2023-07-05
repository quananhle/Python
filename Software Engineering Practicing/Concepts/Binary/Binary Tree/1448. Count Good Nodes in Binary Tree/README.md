## [1448. Count Good Nodes in Binary Tree](https://leetcode.com/problems/count-good-nodes-in-binary-tree)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given a binary tree ```root```, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.

Return _the number of good nodes in the binary tree_.

![image](https://github.com/quananhle/Python/assets/35042430/81ae9cd5-543e-496a-bfba-3e27a955ee28)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/04/02/test_sample_1.png)
```
Input: root = [3,1,4,3,null,1,5]
Output: 4
Explanation: Nodes in blue are good.
Root Node (3) is always a good node.
Node 4 -> (3,4) is the maximum value in the path starting from the root.
Node 5 -> (3,4,5) is the maximum value in the path
Node 3 -> (3,1,3) is the maximum value in the path.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/04/02/test_sample_2.png)
```
Input: root = [3,3,null,4,2]
Output: 3
Explanation: Node 2 -> (3, 3, 2) is not good, because "3" is higher than it.
```

__Example 3:__
```
Input: root = [1]
Output: 1
Explanation: Root is considered as good.
```

__Constraints:__

- The number of nodes in the binary tree is in the range $[1, 10^5]$.
- Each node's value is between $[-10^4, 10^4]$.

---

### Depth-First Search

#### Global Variable

- Time Complexity: $O(N)$.
- Space Complexity: $O(1)$.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        ans = 0

        def dfs(node, parent):
            nonlocal ans

            if not node:
                return 0

            if parent is None or parent <= node.val:
                parent = node.val
                ans += 1
            
            dfs(node.left, parent)
            dfs(node.right, parent)

            return ans

        return dfs(root, None)
```

#### Without Global Variable

- Time Complexity: $O(N)$.
- Space Complexity: $O(1)$.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        res = [0]

        def dfs(node, parent):
            if not node:
                return 0
            
            if parent is None or parent <= node.val:
                parent = node.val
                res[0] += 1
            
            dfs(node.left, parent)
            dfs(node.right, parent)

        dfs(root, None)
        return res[0]
```

- Time Complexity: $O(N)$.
- Space Complexity: $O(N)$.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        def dfs(node, parent, res):
            if not node:
                return 0

            if parent is None or parent <= node.val:
                parent = node.val
                res.append(1)
            
            dfs(node.left, parent, res)
            dfs(node.right, parent, res)

            return len(res)

        return dfs(root, None, [])
```

### Breadth-First Search

- Time Complexity: $O(N)$.
- Space Complexity: $O(N)$.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        ans = 0

        if not root:
            return None

        queue = collections.deque([(root, None)])

        while queue:
            node, parent = queue.popleft()
            if parent is None or parent <= node.val:
                ans += 1
                parent = node.val
            if node.left: queue.append((node.left, parent))
            if node.right: queue.append((node.right, parent))
        
        return ans
```
