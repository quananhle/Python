## [530. Minimum Absolute Difference in BST](https://leetcode.com/problems/minimum-absolute-difference-in-bst)

```Tag```: ```Binary Search Tree``` ```Stack``` ```Depth-First Search```

#### Difficulty: Easy

Given the ```root``` of a __Binary Search Tree (BST)__, return _the minimum absolute difference between the values of any two different nodes in the tree_.

![image](https://github.com/quananhle/Python/assets/35042430/f55849b1-2ea4-4eaa-9803-d9e592cb675e)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/05/bst1.jpg)
```
Input: root = [4,2,6,1,3]
Output: 1
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/05/bst2.jpg)
```
Input: root = [1,0,48,null,null,12,49]
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range ```[2, 10^4]```.
- ```0 <= Node.val <= 10^5```
 
Note: This question is the same as [783](https://leetcode.com/problems/minimum-distance-between-bst-nodes/)

---

### Iterative Inorder Traversal (Template)

![image](https://leetcode.com/problems/minimum-absolute-difference-in-bst/Figures/530/530-1.png)

- __Time complexity__: $O(n)$
- __Space complexity__: $O(n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def getMinimumDifference(self, root: Optional[TreeNode]) -> int:
        stack = list()
        left_child_found = False
        ans = float('inf')

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()

            if left_child_found:
                ans = min(ans, abs(root.val - child))
            left_child_found = True
            child = root.val

            root = root.right
        
        return ans
```

### Recursive Inorder Traversal

- __Time complexity__: $O(n)$
- __Space complexity__: $O(n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def getMinimumDifference(self, root: Optional[TreeNode]) -> int:
        self.ans = float('inf')        
        self.prev = None

        def inorder(node):
            if not node:
                return None
            
            inorder(node.left)
            if self.prev is not None:
                self.ans = min(self.ans, abs(node.val - self.prev))
            self.prev = node.val
            inorder(node.right)
        
        inorder(root)
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
    def getMinimumDifference(self, root: Optional[TreeNode]) -> int:
        stack = []
        
        def inorder(node):
            if not node:
                return None
            inorder(node.left)
            stack.append(node.val)
            inorder(node.right)

        inorder(root)
        
        ans = float('inf')
        for i in range(1, len(stack)):
            ans = min(ans, abs(stack[i] - stack[i - 1]))

        return ans
```

### Depth-First Search

- __Time complexity__: $O(n * logn)$
- __Space complexity__: $O(n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def getMinimumDifference(self, root: Optional[TreeNode]) -> int:
        stack = []
        
        def dfs(node):
            if not node:
                return None
            stack.append(node.val) 
            dfs(node.left)
            dfs(node.right)

        dfs(root)
        
        stack.sort()
        ans = float('inf')
        for i in range(1, len(stack)):
            ans = min(ans, abs(stack[i] - stack[i - 1]))

        return ans
```

