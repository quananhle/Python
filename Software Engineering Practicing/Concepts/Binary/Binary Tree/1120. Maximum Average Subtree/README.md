## [1120. Maximum Average Subtree](https://leetcode.com/problems/maximum-average-subtree)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Recursion``` ```Stack```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the maximum average value of a subtree of that tree_. Answers within $10^{-5}$ of the actual answer will be accepted.

A subtree of a tree is any node of that tree plus all its descendants.

The average value of a tree is the sum of its values, divided by the number of nodes.

![image](https://github.com/quananhle/Python/assets/35042430/3fcbb0c6-3642-4f67-939e-62a626594f95)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/04/09/1308_example_1.png)
```
Input: root = [5,6,1]
Output: 6.00000
Explanation: 
For the node with value = 5 we have an average of (5 + 6 + 1) / 3 = 4.
For the node with value = 6 we have an average of 6 / 1 = 6.
For the node with value = 1 we have an average of 1 / 1 = 1.
So the answer is 6 which is the maximum.
```

__Example 2:__
```
Input: root = [0,null,1]
Output: 1.00000
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^4]$.
- $0 \le Node.val \le 10^5$

---

### Depth-First Search

#### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(N^2)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maximumAverageSubtree(self, root: Optional[TreeNode]) -> float:
        def dfs(curr, nodes):
            # Base case
            if not curr:
                return 0
            
            nodes.append(curr.val)
            dfs(curr.left, nodes)
            dfs(curr.right, nodes)

            return nodes

        ans = 0

        stack = [(root, [])]
        while stack:
            curr, nodes = stack.pop()
            node = curr
            dfs(curr, nodes)
            ans = max(ans, sum(nodes)/len(nodes))
            if curr.left:
                stack.append((curr.left, []))
            if curr.right:
                stack.append((curr.right, []))

        return ans
```

#### Postorder Traversal

![image](https://leetcode.com/problems/maximum-average-subtree/Figures/1120/1.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maximumAverageSubtree(self, root: Optional[TreeNode]) -> float:
        if not root:
            return 0

        def dfs(curr):
            nonlocal ans
            # Base case
            if not curr:
                return (0, 0)
            
            left_sum, left_node_cnt = dfs(curr.left)
            right_sum, right_node_cnt = dfs(curr.right)
        
            total = curr.val + left_sum + right_sum
            nodes = 1 + left_node_cnt + right_node_cnt

            ans = max(ans, total / nodes)
            return (total, nodes)
        
        ans = 0
        dfs(root)
        return ans
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maximumAverageSubtree(self, root: Optional[TreeNode]) -> float:
        def dfs(curr):
            if not curr:
                return 0, 0, 0
            
            left_subtree, left_total, left_node_cnt = dfs(curr.left)
            right_subtree, right_total, right_node_cnt = dfs(curr.right)
            return max(left_subtree, right_subtree, (total := curr.val + left_total + right_total) / (value := 1 + left_node_cnt + right_node_cnt)), total, value

        return dfs(root)[0]
```