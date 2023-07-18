## [1644. Lowest Common Ancestor of a Binary Tree II](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-ii/)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the lowest common ancestor (LCA) of two given nodes_, ```p``` and ```q```. If either node ```p``` or ```q``` does not exist in the tree, return ```null```. All values of the nodes in the tree are unique.

According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes ```p``` and ```q``` in a binary tree ```T``` is the lowest node that has both ```p``` and ```q``` as descendants (where we allow a node to be a descendant of itself)". A descendant of a node ```x``` is a node ```y``` that is on the path from node ```x``` to some leaf node.

![image](https://github.com/quananhle/Python/assets/35042430/21d6d138-aa55-439f-8e16-87f78580dbd4)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
Output: 5
Explanation: The LCA of nodes 5 and 4 is 5. A node can be a descendant of itself according to the definition of LCA.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 10
Output: null
Explanation: Node 10 does not exist in the tree, so return null.
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10${4}]$.
- $10^{9} <= Node.val <= 10^{9}$
- All ```Node.val``` are unique.
- ```p != q```
 
---

### Depth-First Search

![image](https://github.com/quananhle/Python/assets/35042430/cdb0c0a6-9a32-4355-b49f-994c6d41a9e9)

__Complexity Analysis__

- Time Complexity: $\mathcal{O}(N)$
- Space Complexity: $\mathcal{O}(N)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        def dfs(node, target):
            if node == target:
                return True
            if node is None:
                return False
            return dfs(node.left, target) or dfs(node.right, target)

        
        def LCA(node):
            if node is None or node == p or node == q:
                return node
            left = LCA(node.left)
            right = LCA(node.right)

            if left and right:
                return node
            elif left:
                return left
            else:
                return right
            
        ans = LCA(root)
        if ans == p:
            return p if dfs(p, q) else None
        elif ans == q:
            return q if dfs(q, p) else None
        
        return ans
```

__Follow up__: Can you find the LCA traversing the tree, without checking nodes existence?

- Time Complexity: $\mathcal{O}(N)$
- Space Complexity: $\mathcal{O}(N)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        ans = 0

        def dfs(node):
            nonlocal ans

            if not node:
                return False
                
            left = dfs(node.left)
            right = dfs(node.right)

            mid = node == p or node == q

            if mid + left + right >= 2:
                ans = node
            
            return mid or left or right
        
        dfs(root)

        return ans
```
