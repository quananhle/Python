## [515. Find Largest Value in Each Tree Row](https://leetcode.com/problems/find-largest-value-in-each-tree-row)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _an array of the largest value in each row of the tree __(0-indexed)___.

<img width="314" alt="image" src="https://github.com/quananhle/Python/assets/35042430/4dee5dc1-5036-4795-bb87-ff4c9ec456a7">

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/21/largest_e1.jpg)

```
Input: root = [1,3,2,5,3,null,9]
Output: [1,3,9]
```

__Example 2:__
```
Input: root = [1,2,3]
Output: [1,3]
```
 
__Constraints:__

- The number of nodes in the tree will be in the range $[0, 10^4]$.
- $-2^{31} \le Node.val \le 2^{31} - 1$

---

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
    def largestValues(self, root: Optional[TreeNode]) -> List[int]:
        res = list()

        def dfs(node, level):
            if not node:
                return None
            
            if len(res) >= level + 1:
                res[level] = max(res[level], node.val)
            else:
                res.append(node.val)
            
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        
        dfs(root, 0)
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
    def largestValues(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return None

        res = list()

        queue = collections.deque([(root, 0)])

        while queue:
            node, level = queue.popleft()
            
            if len(res) >= level + 1:
                res[level] = max(res[level], node.val)
            else:
                res.append(node.val)
            
            if node.left: queue.append((node.left, level + 1))
            if node.right: queue.append((node.right, level + 1))
        
        return res
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
    def largestValues(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []
        
        res = list()
        queue = collections.deque([root])

        while queue:
            size = len(queue)
            temp = -math.inf
        
            for _ in range(size):
                node = queue.popleft()
                temp = max(temp, node.val)
                if node.left: queue.append(node.left)
                if node.right: queue.append(node.right)
            
            res.append(temp)
        
        return res
```
