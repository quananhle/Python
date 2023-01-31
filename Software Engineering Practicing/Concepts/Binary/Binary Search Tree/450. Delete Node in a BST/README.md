## 450. Delete Node in a BST

```Tag```:

#### Difficulty: Medium

Given a ```root``` node reference of a BST and a ```key```, delete the node with the given key in the BST. Return _the __root node reference__ (possibly updated) of the BST_.

Basically, the deletion can be divided into two stages:

- Search for a node to remove.
- If the node is found, delete the node.

![image](https://user-images.githubusercontent.com/35042430/215682882-aa2081be-6e8c-496d-b464-0c27973d4238.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/04/del_node_1.jpg)
```
Input: root = [5,3,6,2,4,null,7], key = 3
Output: [5,4,6,2,null,null,7]
Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.
```

![image](https://assets.leetcode.com/uploads/2020/09/04/del_node_supp.jpg)

__Example 2:__
```
Input: root = [5,3,6,2,4,null,7], key = 0
Output: [5,3,6,2,4,null,7]
Explanation: The tree does not contain a node with value = 0.
```
Example 3:
```
Input: root = [], key = 0
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range [0, 10<sup>4</sup>].
- -10<sup>5</sup> <= Node.val <= 10<sup>5</sup>
- Each node has a unique value.
- ```root``` is a valid binary search tree.
- -10<sup>5</sup> <= key <= 10<sup>5</sup>
 
---

### Iterative Inorder Traversal

__Follow up__: Could you solve it with time complexity O(height of tree)?

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        #### Time Complexity: O(logN), traverse on a BST to find the node to delete
        #### Space Complexity: O(H), recursion stack to keep up to the height of the tree
        if not root:
            return root

        def successor(node):
            node = node.right
            while node.left:
                node = node.left
            return node.val
        
        def predecessor(node):
            node = node.left
            while node.right:
                node = node.right
            return node.val

        # Traverse left
        if root.val > key:
            root.left = self.deleteNode(root.left, key)
        # Traver right
        elif root.val < key:
            root.right = self.deleteNode(root.right, key)
        # Found the node to delete
        else:
            # Node is a leaf
            if not root.left and not root.right:
                root = None
            # Node has a left child
            elif root.left:
                root.val = predecessor(root)
                root.left = self.deleteNode(root.left, root.val)
            # Node has a right child
            else:
                root.val = successor(root)
                root.right = self.deleteNode(root.right, root.val)
        return root
```
