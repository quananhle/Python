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

#### Using Global Variables

__Algorithm__

1. Create an integer variable ```count``` to count the number of uni-value subtrees. We initialize it to ```0```.
2. Perform the DFS traversal over the given binary tree. We perform ```dfs(root)``` where ```dfs``` is a recursive method that takes a ```TreeNode node``` as a parameter from which the traversal begins. It returns a boolean indicating whether the subtree rooted at node is a uni-value subtree or not. We perform the following in this method:
    - If ```node``` is ```null```, return ```True```.
    - Recursively check whether the ```left``` child forms a uni-value subtree. We perform ```left_uni = dfs(node.left)```.
    - Recursively check whether the ```right``` child forms a uni-value subtree. We perform ```right_uni = dfs(node.right)```.
    - If both the children form uni-value subtrees, i.e, ```left_uni and right_uni``` is ```True```, we compare the values of the ```node```'s children with ```node```' value. If the ```left``` child exists and ```node.left.val != node.val```, we return ```False``` as the values don't match and we don't have a uni-value subtree. Likewise, if the ```right``` child exists and ```node.right.val != node.val```, we return ```False```. Otherwise, we increment ```count``` by ```1``` and return ```True```.
    - Otherwise, one or both of the children do not form a uni-value subtree, so the tree rooted at ```node``` cannot either. We return ```False```.
3. Return ```count```.

- Time Complexity: $O(N)$.
- Space Complexity: $O(N)$.

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

#### Without Using Global Variables

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countUnivalSubtrees(self, root: Optional[TreeNode]) -> int:
        def dfs(node):
            if not node:
                return True, 0
            
            left = dfs(node.left)
            right = dfs(node.right)

            count = left[1] + right[1]
            left_uni, right_uni = left[0], right[0]

            if left_uni and right_uni:
                if node.left and node.left.val != node.val:
                    return False, count
                if node.right and node.right.val != node.val:
                    return False, count
                
                return True, count + 1

            return False, count
        
        return dfs(root)[1]
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countUnivalSubtrees(self, root: Optional[TreeNode]) -> int:
        count = [0]

        def dfs(node, count):
            if not node:
                return True
            
            left_uni, right_uni = dfs(node.left, count), dfs(node.right, count)

            if left_uni and right_uni:
                if node.left and node.left.val != node.val:
                    return False
                if node.right and node.right.val != node.val:
                    return False
                
                count[0] += 1
                return True

            return False

        dfs(root, count)        
        return count[0]
```
