## [1161. Maximum Level Sum of a Binary Tree](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree)

```Tag```: ```Binary Tree``` ```Stack``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, the level of its root is ```1```, the level of its children is ```2```, and so on.

Return _the smallest level ```x``` such that the sum of all the values of nodes at level ```x``` is maximal_.

![image](https://github.com/quananhle/Python/assets/35042430/5671b6bd-d878-45f2-ac32-07b9f798253d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/05/03/capture.JPG)
```
Input: root = [1,7,0,7,-8,null,null]
Output: 2
Explanation: 
Level 1 sum = 1.
Level 2 sum = 7 + 0 = 7.
Level 3 sum = 7 + -8 = -1.
So we return the level with the maximum sum which is level 2.
```

__Example 2:__
```
Input: root = [989,null,10250,98693,-89388,null,null,null,-32127]
Output: 2
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 10^4]```.
- ```-10^5 <= Node.val <= 10^5```

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
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        stack = list()
        total = float('-inf')
        ans = 0

        def dfs(node, level):
            # Base case
            if not node:
                return None

            if level == len(stack):
                stack.append(list())

            stack[level].append(node.val)
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)

        dfs(root, 0)

        for i, nodes in enumerate(stack):
            if total < sum(nodes):
                ans, total = i, sum(nodes)
        
        return ans + 1
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        stack = list()

        def dfs(node, level):
            # Base case
            if not node:
                return None
            
            if len(stack) == level:
                stack.append(node.val)
            else:
                stack[level] += node.val
            
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        
        dfs(root, 0)
        return 1 + stack.index(max(stack))
```

### ✅ Breadth-First Search

![image](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/Figures/1161/1161-bfs1.png)

![image](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/Figures/1161/1161-bfs2.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        stack = list()
        ans, level, total = 0, 0, float('-inf')
        queue = collections.deque([root])
        
        while queue:
            curr = 0

            for _ in range(len(queue)):
                node = queue.popleft()
                curr += node.val

                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)
            
            level += 1
            if total < curr:
                total, ans = curr, level

        return ans
```
