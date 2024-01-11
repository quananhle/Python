## [1026. Maximum Difference Between Node and Ancestor](https://leetcode.com/problems/maximum-difference-between-node-and-ancestor)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Recursion```

#### Difficulty: Medium

Given the ```root``` of a binary tree, find the maximum value ```v``` for which there exist different nodes ```a``` and ```b``` where ```v = |a.val - b.val|``` and ```a``` is an ancestor of ```b```.

A node ```a``` is an ancestor of ```b``` if either: any child of ```a``` is equal to ```b``` or any child of ```a``` is an ancestor of ```b```.

![image](https://github.com/quananhle/Python/assets/35042430/aa181deb-16ef-451a-aa94-8edc68437e22)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/09/tmp-tree.jpg)
```
Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
Output: 7
Explanation: We have various ancestor-node differences, some of which are given below :
|8 - 3| = 5
|3 - 7| = 4
|8 - 1| = 7
|10 - 13| = 3
Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/09/tmp-tree-1.jpg)
```
Input: root = [1,null,2,null,0,3]
Output: 3
```

__Constraints:__

- The number of nodes in the tree is in the range $[2, 5000]$.
- $0 \le Node.val \le 10^5$

---

### Recursion

#### Top-Down

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxAncestorDiff(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0
        
        ans = 0

        def dfs(node, curr_max, curr_min):
            nonlocal ans
            # Base case
            if not node:
                return
            
            ans = max(ans, abs(node.val - curr_max), abs(node.val - curr_min))
            curr_max = max(node.val, curr_max)
            curr_min = min(node.val, curr_min)
            dfs(node.left, curr_max, curr_min)
            dfs(node.right, curr_max, curr_min)

        dfs(root, root.val, root.val)
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
    def maxAncestorDiff(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        def dfs(node, curr_max, curr_min):
            # Base case
            if not node:
                return curr_max - curr_min
            
            curr_max = max(node.val, curr_max)
            curr_min = min(node.val, curr_min)

            # Traverse the subtrees
            left_subtree = dfs(node.left, curr_max, curr_min)
            right_subtree = dfs(node.right, curr_max, curr_min)
            return max(left_subtree, right_subtree)

        return dfs(root, root.val, root.val)
```

#### Bottom-Up

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxAncestorDiff(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0
        ans = 0

        def dfs(node):
            nonlocal ans
            # Base case
            if not node:
                return sys.maxsize, -sys.maxsize-1

            min_left, max_left = dfs(node.left)
            min_right, max_right = dfs(node.right)

            min_curr, max_curr = min(node.val, min_left, min_right), max(node.val, max_left, max_right)
            ans = max(ans, abs(node.val - min_curr), abs(node.val - max_curr))
            return min_curr, max_curr
        
        dfs(root)
        return ans
```


