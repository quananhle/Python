## One iterative inorder traversal, apply it to multiple tree questions

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

## Introduction to the Height-Balanced BST

![IMAGE](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/01/25/balanced_bst.png)
