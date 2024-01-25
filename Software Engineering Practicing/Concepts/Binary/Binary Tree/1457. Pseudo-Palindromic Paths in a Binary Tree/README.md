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

__Two subproblems__

The problem consists of two subproblems:

- Traverse the tree to build all root-to-leaf paths.

- For each root-to-leaf path, check if it's a pseudo-palindromic path or not.

![image](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/Figures/1457/split.png)

![image](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/Figures/1457/dfs.png)

```Python
def check_palindrom(nums):
    is_palindrom = 0

    for i in range(1, 10):
        if nums.count(i) % 2 == 1:
            is_palindrom += 1
            if is_palindrom > 1:
                return False

    return True
```

### Backtracking + Depth-First Search

#### Build Path Using List

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

---

### Bitmasking

#### Iterative Preorder Traversal

![image](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/Figures/1457/xor.png)
_XOR of zero and a bit results in that bit. XOR of two equal bits (even if they are zeros) results in a zero. Hence, one could see the bit in a path only if it appears an odd number of times._

```Python
# compute occurences of each digit in the corresponding bit
path = path ^ (1 << node.val)
```

![image](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/Figures/1457/turn_off.png)
_ _Check if path is a power of two_. ```x & (x - 1)``` is a way to set the rightmost 1-bit to zero, i.e., ```x & (x - 1) == 0``` for the power of two. To subtract 1 means to change the rightmost 1-bit to 0 and to set all the lower bits to 1. Now AND operator: the rightmost 1-bit will be turned off because ```1 & 0 = 0```, and all the lower bits as well.

```Python
# if it's a leaf, check that at most one digit has an odd frequency
if path & (path - 1) == 0:
    count += 1
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pseudoPalindromicPaths (self, root: Optional[TreeNode]) -> int:
        count = 0
        stack = [(root, 0)]

        while stack:
            curr, path = stack.pop()
            if curr:
                path = path ^ (1 << curr.val)
                if not curr.left and not curr.right:
                    if path & (path - 1) == 0:
                        count += 1
                else:
                    stack.append((curr.left, path))
                    stack.append((curr.right, path))
        
        return count
```

#### Recursive Preorder Traversal

![image](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/Figures/1457/dfs.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pseudoPalindromicPaths (self, root: Optional[TreeNode]) -> int:
        count = 0

        def preorder(curr, path):
            nonlocal count
            if not curr:
                return None
            
            # Compute occurences of each digit in the corresponding register
            path ^= (1 << curr.val)
            # Check when current node is a leaf
            if not curr.left and not curr.right:
                # Check if at most one digit has an odd frequency
                if path & (path - 1) == 0:
                    count += 1

            preorder(curr.left, path)
            preorder(curr.right, path)
        
        preorder(root, 0)
        return count
```
