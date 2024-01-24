## [1457. Pseudo-Palindromic Paths in a Binary Tree](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree)

```Tag```: ```Binary Tree``` ```Bitmasking``` ```Depth-First Search``` ```Hash Map``` ```Backtracking```

#### Difficulty: Medium

Given a binary tree where node values are digits from ```1``` to ```9```. A path in the binary tree is said to be __pseudo-palindromic__ if at least one permutation of the node values in the path is a palindrome.

Return _the number of __pseudo-palindromic__ paths going from the root node to leaf nodes_.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/05/06/palindromic_paths_1.png)
```
Input: root = [2,3,1,3,1,null,1]
Output: 2 
Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the red path [2,3,3], the green path [2,1,1], and the path [2,3,1]. Among these paths only red path and green path are pseudo-palindromic paths since the red path [2,3,3] can be rearranged in [3,2,3] (palindrome) and the green path [2,1,1] can be rearranged in [1,2,1] (palindrome).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/05/07/palindromic_paths_2.png)
```
Input: root = [2,1,1,1,3,null,null,null,null,null,1]
Output: 1 
Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the green path [2,1,1], the path [2,1,3,1], and the path [2,1]. Among these paths only the green path is pseudo-palindromic since [2,1,1] can be rearranged in [1,2,1] (palindrome).
```

__Example 3:__
```
Input: root = [9]
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^5]$.
- $1 \le Node.val \le 9$

---

### Backtracking + Depth-First Search

#### Build Path Using List

```Oython
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pseudoPalindromicPaths (self, root: Optional[TreeNode]) -> int:
        self.count = 0
        stack = list()

        # Palindromic check
        def is_pseudo_palindromic(path: list) -> bool:
            counter = collections.defaultdict(int)
            mid = False
            for node in path:
                counter[node] = 1 + counter.get(node, 0)
            for count in counter.values():
                if count % 2:
                    if mid:
                        return False
                    mid = True
            return True

        # Traverse the tree
        def dfs(node: Optional[TreeNode], path: list) -> None:
            # Base case
            if not node:
                return None
            
            path.append(node.val)
            if not node.left and not node.right:
                if is_pseudo_palindromic(path):
                    self.count += 1
                
            dfs(node.left, path)
            dfs(node.right, path)
            # Backtracking
            path.pop()

        dfs(root, [])
        return self.count
```

#### Build Path with Node Counter Using Hash Map

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pseudoPalindromicPaths (self, root: Optional[TreeNode]) -> int:
        self.count = 0
        stack = list()

        # Palindromic check
        def is_pseudo_palindromic(path: dict) -> bool:
            mid = False
            for count in path.values():
                if count % 2:
                    if mid:
                        return False
                    mid = True
            return True

        # Traverse the tree
        def dfs(node: Optional[TreeNode], path: dict) -> None:
            # Base case
            if not node:
                return None
            
            path[node.val] += 1
            if not node.left and not node.right:
                if is_pseudo_palindromic(path):
                    self.count += 1
                
            dfs(node.left, path)
            dfs(node.right, path)
            # Backtracking
            path[node.val] -= 1

        dfs(root, collections.defaultdict(int))
        return self.count
```
