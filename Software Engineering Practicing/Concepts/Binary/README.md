## One iterative inorder traversal, apply it to multiple tree questions

Question : [Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/)

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
 
