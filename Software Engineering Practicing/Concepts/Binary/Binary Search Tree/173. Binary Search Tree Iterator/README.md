## 173. Binary Search Tree Iterator

```Tag```: ```Binary Search Tree```

#### Difficulty: Medium

Implement the ```BSTIterator``` class that represents an iterator over the in-order traversal of a binary search tree (BST):

- ```BSTIterator(TreeNode root)``` Initializes an object of the ```BSTIterator``` class. The ```root``` of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
- ```boolean hasNext()``` Returns _```true``` if there exists a number in the traversal to the right of the pointer_, otherwise returns ```false```.
- ```int next()``` Moves the pointer to the right, then returns the number at the pointer.

Notice that by initializing the pointer to a non-existent smallest number, the first call to ```next()``` will return the smallest element in the BST.

You may assume that ```next()``` calls will always be valid. That is, there will be at least a next number in the in-order traversal when ```next()``` is called.

![image](https://user-images.githubusercontent.com/35042430/215679907-49d5c483-6191-418c-8f70-ccd7b75bb175.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2018/12/25/bst-tree.png)
```
Input
["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
[[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
Output
[null, 3, 7, true, 9, true, 15, true, 20, false]

Explanation
BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
bSTIterator.next();    // return 3
bSTIterator.next();    // return 7
bSTIterator.hasNext(); // return True
bSTIterator.next();    // return 9
bSTIterator.hasNext(); // return True
bSTIterator.next();    // return 15
bSTIterator.hasNext(); // return True
bSTIterator.next();    // return 20
bSTIterator.hasNext(); // return False
```

__Constraints:__

- The number of nodes in the tree is in the range [1, 10<sup>5</sup>].
- 0 <= Node.val <= 10<sup>6</sup>
- At most 10<sup>5</sup> calls will be made to ```hasNext```, and ```next```.

---

### Iterative Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class BSTIterator:

    def __init__(self, root: Optional[TreeNode]):
        self.root = self.curr = root
        self.stack = list()

    def next(self) -> int:
        node = self.curr
        while node:
            self.stack.append(node)
            node = node.left
        node = self.stack.pop()
        self.curr = node.right
        return node.val

    def hasNext(self) -> bool:
        if self.curr or self.stack:
            return True
        return False

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator(root)
# param_1 = obj.next()
# param_2 = obj.hasNext()
```

__Follow up:__

Could you implement ```next()``` and ```hasNext()``` to run in average ```O(1)``` time and use ```O(h)``` memory, where ```h``` is the height of the tree?
