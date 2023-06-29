## [250. Count Univalue Subtrees](https://leetcode.com/problems/count-univalue-subtrees/)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the number of uni-value subtrees_. A uni-value subtree means all nodes of the subtree have the same value.

![image](https://github.com/quananhle/Python/assets/35042430/dc40ef5c-a8b2-4c56-a8e9-8ceaf3da9fc5)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/21/unival_e1.jpg)
```
Input: root = [5,1,5,5,5,null,5]
Output: 4
```

__Example 2:__
```
Input: root = []
Output: 0
```

__Example 3:__
```
Input: root = [5,5,5,5,5,null,5]
Output: 6
```

__Constraints:__

- The number of the node in the tree will be in the range ```[0, 1000]```.
- ```-1000 <= Node.val <= 1000```

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
    def countUnivalSubtrees(self, root: Optional[TreeNode]) -> int:
        ans = 0

        def dfs(node):
            # Base case
            if not node:
                return True

            nonlocal ans
            left_uni, right_uni = dfs(node.left), dfs(node.right)

            if left_uni and right_uni:
                if node.left and node.val != node.left.val:
                    return False
                if node.right and node.val != node.right.val:
                    return False
                
                ans += 1
                return True
            
            return False

        dfs(root)
        return ans
```
