## [938. Range Sum of BST](https://leetcode.com/problems/range-sum-of-bst)

```Tag```: ```Binary Search Tree``` ```Depth-First Search``` ```Recursion```

#### Difficulty: Easy

Given the ```root``` node of a binary search tree and two integers ```low``` and ```high```, return the sum of values of all nodes with a value in the __inclusive range__ ```[low, high]```.

![image](https://github.com/quananhle/Python/assets/35042430/dd5331c9-c010-406b-9e49-ee61011c4a28)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/05/bst1.jpg)

```
Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/05/bst2.jpg)

```
Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
Output: 23
Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.
```

__Constraints:__


- The number of nodes in the tree is in the range $[1, 2 * 10^4]$.
- $1 \le Node.val \le 10^5$
- $1 \le low \le high \le 10^5$
- All ```Node.val``` are unique.

---

### Inorder Traversal

#### Recursive Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def rangeSumBST(self, root, low, high):
        """
        :type root: TreeNode
        :type low: int
        :type high: int
        :rtype: int
        """
        res = list()
        def dfs(node):
            if node:
                if low < node.val:
                    dfs (node.left)
                if high > node.val:
                    dfs (node.right)
                if low <= node.val <= high:
                    res.append(node.val)
        dfs(root)
        return sum(res)
```

#### Iterative Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def rangeSumBST(self, root, low, high):
        """
        :type root: TreeNode
        :type low: int
        :type high: int
        :rtype: int
        """
        ans = 0
        stack = [root]
        while stack:
            node = stack.pop()
            if node:
                if low <= node.val <= high:
                    ans += node.val
                if low < node.val:
                    stack.append(node.left)
                if high > node.val:
                    stack.append(node.right)
        return ans
```
