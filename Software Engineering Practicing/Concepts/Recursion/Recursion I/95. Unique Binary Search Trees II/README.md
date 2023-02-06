## 95. Unique Binary Search Trees II

```Tag```: ```Recursion```

#### Difficulty: Medium

Given an integer ```n```, return _all the structurally unique __BST's (binary search trees)__, which has exactly ```n``` nodes of unique values from ```1``` to ```n```_. Return _the answer in any order_.

![image](https://user-images.githubusercontent.com/35042430/217061215-c32c32bc-c4a5-4de9-a0be-de8d736fef59.png)

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

        def build_tree(first, last):
            if first > last:
                return [None]
            res = list()
            # Iterate through every root node candidate
            for root in range(first, last + 1):
                # Generate left subtree of tje root node
                left_subtree = build_tree(first, root - 1)
                # Generate right subtree of the root node
                right_subtree = build_tree(root + 1, last)

                # Connect subtrees to the root node
                for left in left_subtree:
                    for right in right_subtree:
                        curr = TreeNode(root)
                        curr.left = left
                        curr.right = right
                        res.append(curr)
            return res

        return build_tree(1, n)
```
