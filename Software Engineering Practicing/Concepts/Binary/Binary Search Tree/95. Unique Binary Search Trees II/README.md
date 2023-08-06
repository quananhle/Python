## [95. Unique Binary Search Trees II](https://leetcode.com/problems/unique-binary-search-trees-ii/)

```Tag```: ```Recursion``` ```Binary Search Tree``` ```Dynamic Programming```

#### Difficulty: Medium

Given an integer ```n```, return _all the structurally unique __BST's (binary search trees)__, which has exactly ```n``` nodes of unique values from ```1``` to ```n```_. Return _the answer in any order_.

![image](https://github.com/quananhle/Python/assets/35042430/18708fbb-a40a-4691-823f-9392a92523cf)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/18/uniquebstn3.jpg)
```
Input: n = 3
Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
```

__Example 2:__
```
Input: n = 1
Output: [[1]]
```

__Constraints:__

- ```1 <= n <= 8```

---

### Recursion

![image](https://leetcode.com/problems/unique-binary-search-trees-ii/solutions/187794/Figures/96_BST.png)

![image](https://leetcode.com/problems/unique-binary-search-trees-ii/Figures/95/95-1.png)

__Time Complexity__: ```O(C0+C1+...Cn)``` where C<sub>n</sub> is the Catalan number. The Catalan numbers for ```n = 0, 1, 2, 3, 4, 5, 6, 7, 8``` are ```1, 1, 2, 5, 14, 42, 132, 429, 1430```.

__Space Complexity__: ```O(n * Cn)```, there is total C<sub>n</sub> __BSTs__, each __BST__ has ```n``` nodes

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def generateTrees(self, n: int) -> List[Optional[TreeNode]]:
        @lru_cache(None)
        def build_tree(start, end):
            if start > end:
                return [None]
            
            res = list()
            for root in range(start, end + 1):
                left_subtree = build_tree(start, root - 1)
                right_subtree = build_tree(root + 1, end)
            
                for left_node in left_subtree:
                    for right_node in right_subtree:
                        curr = TreeNode(root)
                        curr.left = left_node
                        curr.right = right_node
                        res.append(curr)
            
            return res
        
        return build_tree(1, n)
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def generateTrees(self, n: int) -> List[Optional[TreeNode]]:
        @lru_cache(maxsize=None)
        def helper(start, end):
            res = list()
            # Base case
            if start > end:
                res.append(None)
                return res

            for val in range(start, end + 1):
                left_subtree = helper(start, val - 1)
                right_subtree = helper(val + 1, end)

                for left_node in left_subtree:
                    for right_node in right_subtree:
                        root = TreeNode(val=val, left=left_node, right=right_node)
                        res.append(root)
                
            return res
        
        return helper(1, n)
```

### Bottom-Up Dynamic Programming

```Python

```
