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

#### Two Passes

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

#### One Pass

To handle a node, we must check the conditions to determine whether it meets the requirements to be an Even-Odd tree:

- Check whether the current value has the correct parity:

    - Nodes on even levels must have odd values
    - Nodes on odd levels must have even values

- Check whether the current value is in the correct order:

    - Nodes on even levels must be in strictly increasing order. If true, the node breaks the increasing condition, and we can return ```False```.
      ```node.val <= prev[level] // True when node.val is less than or equal to `prev```
    - Nodes on odd levels must be in strictly decreasing order. If true, the node breaks the decreasing condition, and we can return ```False```.
      ```node.val >= prev[level] // True when node.val is greater than or equal to `prev` ```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isEvenOddTree(self, root: Optional[TreeNode]) -> bool:
        levels = list()

        def dfs(curr, level):
            # Base case: an empty tree is Even-Odd
            if not curr:
                return True

            # Compare the parity of current and level
            if curr.val % 2 == level % 2:
                return False
            
            # Add new level to levels
            while len(levels) <= level:
                levels.append(0)
            
            # Nodes on even levels must be in strictly increasing order
            # Nodes on odd levels must be in strictly decreasing order

            if levels[level] != 0 and \
                ((level % 2 == 0 and curr.val <= levels[level]) or \
                 (level % 2 != 0 and curr.val >= levels[level])):
                return False
            
            # Update current value for the nodes of the same level
            levels[level] = curr.val
            return dfs(curr.left, level + 1) and dfs(curr.right, level + 1)
        
        return dfs(root, 0)
```
