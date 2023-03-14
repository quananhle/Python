## [129. Sum Root to Leaf Numbers](https://leetcode.com/problems/sum-root-to-leaf-numbers/)

```Tag```: ```Binary Tree``` ```Backtracking``` ```Morris's Algorithm```

#### Difficulty: Medium

You are given the ```root``` of a binary tree containing digits from ```0``` to ```9``` only.

Each root-to-leaf path in the tree represents a number.

- For example, the root-to-leaf path ```1 -> 2 -> 3``` represents the number ```123```.

Return _the total sum of all root-to-leaf numbers_. Test cases are generated so that the answer will fit in a __32-bit__ integer.

A leaf node is a node with no children.

![image](https://user-images.githubusercontent.com/35042430/224918793-028537ce-54bf-4901-b7fe-be8b581d6eaa.png)

---
Example 1:

![image](https://assets.leetcode.com/uploads/2021/02/19/num1tree.jpg)
```
Input: root = [1,2,3]
Output: 25
Explanation:
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.
Therefore, sum = 12 + 13 = 25.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/19/num2tree.jpg)
```
Input: root = [4,9,0,5,1]
Output: 1026
Explanation:
The root-to-leaf path 4->9->5 represents the number 495.
The root-to-leaf path 4->9->1 represents the number 491.
The root-to-leaf path 4->0 represents the number 40.
Therefore, sum = 495 + 491 + 40 = 1026.
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 1000]```.
- ```0 <= Node.val <= 9```
- The depth of the tree will not exceed ```10```.

---

![image](https://leetcode.com/problems/sum-root-to-leaf-numbers/Figures/129/preorder2.png)

### Preorder Traversal

![image](https://leetcode.com/problems/sum-root-to-leaf-numbers/Figures/129/ddfs2.png)

#### Recursive

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        if not root:
            return None

        def traverse(node, path):
            if not node:
                return 0

            path = path * 10 + node.val
            if not node.left and not node.right:
                return path
            
            return traverse(node.left, path) + traverse(node.right, path)
        
        return traverse(root, 0)

#### Iterative

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        ans = 0
        stack = [(root, 0)]

        while stack:
            node, curr = stack.pop()
            if not node:
                continue

            curr = curr * 10 + node.val
            if not node.left and not node.right:
                ans += curr

            stack.extend(((node.right, curr), (node.left, curr)))
        
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
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        ans = 0
        stack = [(root, 0)]

        while stack:
            node, curr = stack.pop()
            if node:
                curr = curr * 10 + node.val
                if not node.left and not node.right:
                    ans += curr
                stack.append((node.right, curr))
                stack.append((node.left, curr))
        
        return ans
```

### Backtracking

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        self.ans = 0

        def backtrack(curr, path):
            if not curr:
                return 0

            path += curr.val
            if not curr.left and not curr.right:
                self.ans += path

            backtrack(curr.left, path * 10)
            backtrack(curr.right, path * 10)
            
            # Backtracking
            path -= curr.val
        
        backtrack(root, 0)
        return self.ans
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        self.ans = 0
        self.curr = 0

        def dfs(node):
            if not node:
                return 0

            self.curr = self.curr * 10 + node.val
            if not node.left and not node.right:
                self.ans += self.curr

            dfs(node.left)
            dfs(node.right)

            # Backtracking
            self.curr = (self.curr - node.val) // 10

        dfs(root)
        return self.ans
```

### Morris' Algorithm
