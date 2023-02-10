## 426. Convert Binary Search Tree to Sorted Doubly Linked List

```Tag```: ```Recursion``` ```Binary Search Tree``` ```Linked List```

Convert a __Binary Search Tree__ to a sorted __Circular Doubly-Linked List__ in place.

You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.

![image](https://user-images.githubusercontent.com/35042430/218137493-8da2590d-6c62-4669-a7a3-ad1b8fd7a25f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/10/12/bstdlloriginalbst.png)

    Input: root = [4,2,5,1,3]

![image](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturndll.png)

    Output: [1,2,3,4,5]

    Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

![image](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturnbst.png)

__Example 2:__
```
Input: root = [2,1,3]
Output: [1,2,3]
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 2000]```.
- ```-1000 <= Node.val <= 1000```
- All the values of the tree are unique.

---

### Inorder Traversal

![image](https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/solutions/263241/Figures/426/process.png)

#### Iterative Approach

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
"""

class Solution:
    def treeToDoublyList(self, root: 'Optional[Node]') -> 'Optional[Node]':
        if not root:
            return root

        stack = list()
        linked_list = list()

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            linked_list.append(root)
            root = root.right
        
        node = linked_list[0]
        head = node
        for next_node in linked_list[1:]:
            node.right = next_node
            next_node.left = node
            node = next_node
            
        node.right = head
        head.left = node
        return head
```

#### Recursive Approach

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
"""

class Solution:
    def treeToDoublyList(self, root: 'Optional[Node]') -> 'Optional[Node]':
        if not root:
            return root

        linked_list = list()

        def inorder(node):
            if not node:
                return
            
            inorder(node.left)
            linked_list.append(node)
            inorder(node.right)
        
        inorder(root)

        node = linked_list[0]
        self.head = node

        for next_node in linked_list[1:]:
            node.right = next_node
            next_node.left = node
            node = next_node
        
        linked_list[-1].right = self.head
        self.head.left = linked_list[-1]

        return self.head
```
