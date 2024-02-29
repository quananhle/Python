## [1609. Even Odd Tree](https://leetcode.com/problems/even-odd-tree)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

A binary tree is named Even-Odd if it meets the following conditions:

- The root of the binary tree is at level index ```0```, its children are at level index ```1```, their children are at level index ```2```, etc.
- For every even-indexed level, all nodes at the level have odd integer values in strictly increasing order (from left to right).
- For every odd-indexed level, all nodes at the level have even integer values in strictly decreasing order (from left to right).

Given the ```root``` of a binary tree, return ```True``` if the binary tree is Even-Odd, otherwise return ```False```.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/15/sample_1_1966.png)
```
Input: root = [1,10,4,3,null,7,9,12,8,6,null,null,2]
Output: true
Explanation: The node values on each level are:
Level 0: [1]
Level 1: [10,4]
Level 2: [3,7,9]
Level 3: [12,8,6,2]
Since levels 0 and 2 are all odd and increasing and levels 1 and 3 are all even and decreasing, the tree is Even-Odd.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/15/sample_2_1966.png)
```
Input: root = [5,4,2,3,3,7]
Output: false
Explanation: The node values on each level are:
Level 0: [5]
Level 1: [4,2]
Level 2: [3,3,7]
Node values in level 2 must be in strictly increasing order, so the tree is not Even-Odd.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/09/22/sample_1_333_1966.png)
```
Input: root = [5,9,1,3,5,7]
Output: false
Explanation: Node values in the level 1 should be even integers.
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^5]$.
- $1 \le Node.val \le 10^6$

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
    def isEvenOddTree(self, root: Optional[TreeNode]) -> bool:
        nodes = list()

        def is_even_odd(nodes):
            for i, node in enumerate(nodes):
                if i % 2 == 0:
                    prev = node.pop()
                    if prev % 2 == 0:
                        return False
                    while node:
                        curr = node.pop()
                        if prev <= curr or curr % 2 == 0:
                            return False
                        prev = curr
                else:
                    prev = node.pop()
                    if prev % 2 != 0:
                        return False
                    while node:
                        curr = node.pop()
                        if prev >= curr or curr % 2 != 0:
                            return False
                        prev = curr
            return True

        def dfs(curr, level):
            # Base case
            if not curr:
                return

            if not nodes or level == len(nodes):
                nodes.append([])
            nodes[level].append(curr.val)

            dfs(curr.left, level + 1)
            dfs(curr.right, level + 1)

        dfs(root, 0)
        return is_even_odd(nodes)
```
