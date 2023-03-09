## [437. Path Sum III](https://leetcode.com/problems/path-sum-iii/)

```Tag```: ```Binary Tree``` ```Prefix Sum```

#### Difficulty: Medium

Given the ```root``` of a binary tree and an integer ```targetSum```, return _the number of paths where the sum of the values along the path equals ```targetSum```_.

The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

![image](https://user-images.githubusercontent.com/35042430/223823792-6998123d-c92c-454c-ba37-5adee9a4e28a.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/09/pathsum3-1-tree.jpg)
```
Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
Output: 3
Explanation: The paths that sum to 8 are shown.
```

__Example 2:__
```
Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
Output: 3
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 1000]```.
- -10<sup>9</sup> <= ```Node.val``` <= 10<sup>9</sup>
- ```-1000 <= targetSum <= 1000```

---

### Brute Force

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:
        def compute(node, target):
            # Exit condition
            if not node:
                return
            
            if target == node.val:
                self.count += 1
            
            compute(node.left, target - node.val)
            compute(node.right, target - node.val)
    
        def traversal(node, target):
            # Exit condition
            if not node:
                return
            
            # Calculate the sum from the current node
            compute(node, target)   # Preorder or Inorder or Postorder
            traversal(node.left, target)
            traversal(node.right, target)

        self.count = 0
        traversal(root, targetSum)
        return self.count
```

### Prefix Sun

__Prefix sum__ technique: ```one pass + linear time complexity```

```
Prefix sum is a sum of the current value with all previous elements starting from the beginning of the structure.
```

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/prefix_qd.png)
_Prefix sum for 1D array._

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/2d_prefix.png)
_Prefix sum for 2D array._

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/tree2.png)
_Prefix sum for the binary tree._

You might want to use the prefix sum technique for the problems like __"Find a number of continuous subarrays/submatrices/tree paths that sum to target"__.

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/one_vs_two.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:
        prefix_sum = collections.defaultdict(int)
        if not root:
            return 0

        def dfs(node, curr_sum):
            if not node:
                return
            
            curr_sum += node.val
            if curr_sum == targetSum:
                self.count += 1

            # number of times the curr_sum − k has has occurred up to the current node
            self.count += prefix_sum[curr_sum - targetSum]

            # add the current sum into hashmap to use it during the child nodes processing
            prefix_sum[curr_sum] += 1

            dfs(node.left, curr_sum)
            dfs(node.right, curr_sum)

            # Backtracking
            prefix_sum[curr_sum] -= 1

        self.count = 0
        dfs(root, 0)
        return self.count
```
