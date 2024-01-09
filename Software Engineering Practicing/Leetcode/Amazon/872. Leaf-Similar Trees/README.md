## [872. Leaf-Similar Trees](https://leetcode.com/problems/leaf-similar-trees)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Easy

Consider all the leaves of a binary tree, from left to right order, the values of those leaves form a __leaf value sequence__.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/16/tree.png)

For example, in the given tree above, the leaf value sequence is ```(6, 7, 4, 9, 8)```.

Two binary trees are considered _leaf-similar_ if their leaf value sequence is the same.

Return _```True``` if and only if the two given trees with head nodes ```root1``` and ```root2``` are leaf-similar_.

![image](https://user-images.githubusercontent.com/35042430/206362628-86178084-9838-4e37-897a-ed99d558e6ad.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/03/leaf-similar-1.jpg)

```
Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/03/leaf-similar-2.jpg)

```
Input: root1 = [1,2,3], root2 = [1,3,2]
Output: false
```

__Constraints:__

- The number of nodes in each tree will be in the range ```[1, 200]```.
- Both of the given trees will have values in the range ```[0, 200]```.

---

### Depth-First Search

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def leafSimilar(self, root1, root2):
        """
        :type root1: TreeNode
        :type root2: TreeNode
        :rtype: bool
        """
        # Depth-First Search
        #### Time Complexity: O(T1+T2), travel through every node in the tree root1 and root2
        #### Space Complexity: O(T1+T2), keep up to the size of the tree
        res1, res2 = list(), list()
        res = list()
        def dfs(node):
            if not node.left and not node.right:
                res.append(node.val)
            elif node:
                if node.left:
                    dfs(node.left)
                if node.right:
                    dfs(node.right)
            return res
        res1 = dfs(root1)
        res = list()
        res2 = dfs(root2)
        return res1 == res2
```

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def leafSimilar(self, root1, root2):
        """
        :type root1: TreeNode
        :type root2: TreeNode
        :rtype: bool
        """
        def dfs(node):
            ans = list()
            if not node:
                return []
            if not node.left and not node.right:
                ans.append(node.val)
            ans += dfs(node.left)
            ans += dfs(node.right)
            return ans
        return dfs(root1) == dfs(root2)
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def leafSimilar(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> bool:
        def dfs(curr, nodes):
            # Base case
            if not curr:
                return None
            
            if not curr.left and not curr.right:
                nodes.append(curr.val)
            
            dfs(curr.left, nodes)
            dfs(curr.right, nodes)
        
            return nodes
        
        return dfs(root1, []) == dfs(root2, [])
```

### Iterations

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def leafSimilar(self, root1, root2):
        """
        :type root1: TreeNode
        :type root2: TreeNode
        :rtype: bool
        """
        # Iteration
        #### Time Complexity: O(T1+T2), travel through every node in the tree
        #### Space Complexity: O(T1+T2), stack keep up to the size of the tree
        def dfs(node):
            stack, res = list(), list()
            while stack or node:
                if node:
                    stack.append(node)
                    node = node.left
                else:
                    node = stack.pop()
                    if not node.left and not node.right:
                        res.append(node.val)
                    node = node.right
            return res
        return dfs(root1) == dfs(root2)
```
