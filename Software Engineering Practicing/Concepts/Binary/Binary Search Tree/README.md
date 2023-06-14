## Template

__Algorithm__

1. Initiate ```stack``` as an empty array.
2. While ```root``` is not null:

    - To build an inorder traversal iteratively, go left as far as you can and add all nodes on the way into stack.

    ```
    stack.append(root)
    root = root.left
    ```

3. Pop the last element from stack ```root = stack.pop()```.

4. Add the conditions and get ```root.val```

5. Go one step right: ```root = root.right```.

### One iterative inorder traversal, apply it to multiple binary search tree questions

#### Question : [Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/)

```Java
public List<Integer> inorderTraversal(TreeNode root) {
    List<Integer> list = new ArrayList<>();
    if(root == null) return list;
    Stack<TreeNode> stack = new Stack<>();
    while(root != null || !stack.empty()){
        while(root != null){
            stack.push(root);
            root = root.left;
        }
        root = stack.pop();
        list.add(root.val);
        root = root.right;
        
    }
    return list;
}
```

Question : [Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)

```Java
public int kthSmallest(TreeNode root, int k) {
    Stack<TreeNode> stack = new Stack<>();
    while(root != null || !stack.isEmpty()) {
        while(root != null) {
            stack.push(root);    
            root = root.left;   
        } 
        root = stack.pop();
        if(--k == 0) break;
        root = root.right;
    }
    return root.val;
}
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        stack = list()
        count = k
        
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if count == 1:
                break
            count -= 1
            root = root.right

        return root.val
```
 
Question : [Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)
 
```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        # Iterative Inorder Traversal
        stack = list()
        node = -sys.maxsize-1
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if root.val <= node:
                return False
            node = root.val
            root = root.right
        return True
```
 
Question : [Inorder Successor in BST](https://leetcode.com/problems/inorder-successor-in-bst/)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def inorderSuccessor(self, root: TreeNode, p: TreeNode) -> Optional[TreeNode]:
        stack = list()
        found = False
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if found:
                return root
            value = root.val
            if value == p.val:
                found = True
            root = root.right
        return root
```

Question : [270. Closest Binary Search Tree Value](https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def closestValue(self, root: Optional[TreeNode], target: float) -> int:
        if not root:
            return None

        difference = float("inf")
        ans = 0
        
        stack = list()
        
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if abs(root.val - target) < difference:
                difference = abs(root.val - target)
                ans = root.val
            root = root.right
        
        return ans
```

Question: [783. Minimum Distance Between BST Nodes](https://leetcode.com/problems/minimum-distance-between-bst-nodes/)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        # Space Optimized Iterative Inorder Traversal
        if not root:
            return 0

        child = None
        stack = list()
        ans = sys.maxsize

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if child:
                ans = min(ans, root.val - child.val)
            child = root
            root = root.right
        
        return ans
```

Question: [Binary Search Tree Iterator](https://leetcode.com/problems/binary-search-tree-iterator/)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class BSTIterator:

    def __init__(self, root: Optional[TreeNode]):
        self.root = self.next = root
        self.stack = list()

    def next(self) -> int:
        node = self.curr
        while node:
            self.stack.append(node)
            node = node.left
        node = self.stack.pop()
        self.next = node.right
        return node.val

    def hasNext(self) -> bool:
        if self.next or self.stack:
            return True
        return False

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator(root)
# param_1 = obj.next()
# param_2 = obj.hasNext()
```
 
Question : [Convert Binary Search Tree to Sorted Doubly Linked List](https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list)

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
        self.head = node
        for next_node in linked_list[1:]:
            node.right = next_node
            next_node.left = node
            node = next_node
            
        node.right = self.head
        self.head.left = node
        return self.head
```

Question: [Minimum Absolute Difference in BST](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/530.%20Minimum%20Absolute%20Difference%20in%20BST)

Given the ```root``` of a Binary Search Tree (BST), return _the minimum absolute difference between the values of any two different nodes in the tree_.

__Example__:
![image](https://assets.leetcode.com/uploads/2021/02/05/bst1.jpg)
```
Input: root = [4,2,6,1,3]
Output: 1
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def getMinimumDifference(self, root: Optional[TreeNode]) -> int:
        stack = list()
        left_child_found = True
        ans = float('inf')

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()

            if left_child_found:
                left_child_found = not left_child_found
            else:
                ans = min(ans, abs(root.val - child))

            child = root.val
            root = root.right
        
        return ans
```
