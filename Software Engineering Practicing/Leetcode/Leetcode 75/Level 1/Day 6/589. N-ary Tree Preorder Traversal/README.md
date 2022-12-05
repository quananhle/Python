## 589. N-ary Tree Preorder Traversal

#### Difficulty: Easy

Given the ```root``` of an n-ary tree, return _the preorder traversal of its nodes' values_.

Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)

![image](https://user-images.githubusercontent.com/35042430/205719633-6246be98-6764-465b-a903-40ccaa39acf4.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
```
Input: root = [1,null,3,2,4,null,5,6]
Output: [1,3,5,6,2,4]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/11/08/sample_4_964.png)
```
Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
```

__Constraints:__
```
The number of nodes in the tree is in the range [0, 104].
0 <= Node.val <= 104
The height of the n-ary tree is less than or equal to 1000.
```

---

### Recursion

```Python
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children
"""
class Solution(object):
    def preorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        res = list()
        if not root:
            return res
        def helper(node):
            res.append(node.val)
            for node in node.children:
                if node:
                    helper(node)
        helper(root)
        return res
```                

