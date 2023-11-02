## [2265. Count Nodes Equal to Average of Subtree](https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the number of nodes where the value of the node is equal to the __average__ of the values in its __subtree___.

__Note__:

- The __average__ of ```n``` elements is the sum of the ```n``` elements divided by ```n``` and rounded down to the nearest integer.
- A __subtree__ of ```root``` is a tree consisting of ```root``` and all of its descendants.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/03/15/image-20220315203925-1.png)
```
Input: root = [4,8,5,0,1,null,6]
Output: 5
Explanation: 
For the node with value 4: The average of its subtree is (4 + 8 + 5 + 0 + 1 + 6) / 6 = 24 / 6 = 4.
For the node with value 5: The average of its subtree is (5 + 6) / 2 = 11 / 2 = 5.
For the node with value 0: The average of its subtree is 0 / 1 = 0.
For the node with value 1: The average of its subtree is 1 / 1 = 1.
For the node with value 6: The average of its subtree is 6 / 1 = 6.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/03/26/image-20220326133920-1.png)
```
Input: root = [1]
Output: 1
Explanation: For the node with value 1: The average of its subtree is 1 / 1 = 1.
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 1000]$.
- $0 \le Node.val \le 1000$

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
    def averageOfSubtree(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        ans = 0

        def dfs(node):
            count = value = 0
            nonlocal ans

            # Base case
            if not node:
                return (0, 0)

            count += 1
            value += node.val

            left_subtree_cnt, left_substree_val = dfs(node.left)
            right_subtree_cnt, right_subtree_val = dfs(node.right)

            value += left_substree_val + right_subtree_val
            count += left_subtree_cnt + right_subtree_cnt
            if math.floor(value / count) == node.val:
                ans += 1
            
            return (count, value)
        
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
    def averageOfSubtree(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        ans = 0

        def dfs(node):
            value = count = 0
            nonlocal ans

            # Base case
            if not node:
                return (0, 0)

            left_subtree_cnt, left_substree_val = dfs(node.left)
            right_subtree_cnt, right_subtree_val = dfs(node.right)

            value += left_substree_val + right_subtree_val + node.val
            count += left_subtree_cnt + right_subtree_cnt + 1
            if value // count == node.val:
                ans += 1
            
            return (count, value)
        
        dfs(root)
        return ans
```
