## [236. Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree)

```Tag```: ```Binary Tree``` ```Backtracking``` ```Recursion```

#### Difficulty: Medium

Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

![image](https://user-images.githubusercontent.com/35042430/215356897-53fc9b21-e3b5-444d-8b1c-a01a9f71ef8d.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
Output: 5
Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
```

__Example 3:__
```
Input: root = [1,2], p = 1, q = 2
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range [2, 10<sup>5</sup>].
- -10<sup>9</sup> <= Node.val <= 10<sup>9</sup>
- All ```Node.val``` are unique.
- ```p != q```
- ```p``` and ```q``` will exist in the tree.

---

### Recursion

![image](https://user-images.githubusercontent.com/35042430/215383286-62467197-b6c8-4fa2-af82-4dde34945c60.png)

Following is the sequence of nodes that are followed in the recursion:

```
1 --> 2 --> 4 --> 8
BACKTRACK 8 --> 4
4 --> 9 (ONE NODE FOUND, return True)
BACKTRACK 9 --> 4 --> 2
2 --> 5 --> 10
BACKTRACK 10 --> 5
5 --> 11 (ANOTHER NODE FOUND, return True)
BACKTRACK 11 --> 5 --> 2
```

2 is the node where we have ```left = True``` and ```right = True``` and hence it is the __lowest common ancestor__.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        # Bottom-Up Recursion
        #### Time Complexity: O(N) where N is the number of nodes in the binary tree
        #### Space Complexity: O(N), extra memory space to keep up the recursion stack
        ans = 0

        def helper(curr):
            nonlocal ans
            if not curr:
                return False
            # Traverse to the bottom left
            left = helper(curr.left)
            # Traverse to the bottom right:
            right = helper(curr.right)
            # Check if the current node is p or q
            '''
            mid = curr == p or curr == q
            '''
            if curr == p or curr == q:
                mid = True
            else:
                mid = False
            # Check if any two of the three flags left, right or mid become True.
            if mid + left + right >= 2:
                ans = curr
            # Check if any of mid or left or right is True, meaning p or q was found, or False, meaning p or q has not been found yet
            return mid or left or right
        
        helper(root)
        return ans
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        # Bottom-Up Recursion
        #### Time Complexity: O(N) where N is the number of nodes in the binary tree
        #### Space Complexity: O(N), extra memory space to keep up the recursion stack
        if not root:
            return None
        if root == p or root == q:
            return root

        left = self.lowestCommonAncestor(root.left, p, q)
        right = self.lowestCommonAncestor(root.right, p, q)

        if not left:
            return right
        if not right:
            return left
        return root
```

### Backtracking

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        # Backtracking
        ### Iterative using Parent Pointers
        #### Time Complexity: O(N) where N is the number of nodes in the binary tree
        #### Space Complexity: O(N), extra memory space to keep up the recursion stack
        stack = [root]
        # Hash map to store the parent pointer for every node, starting from the root node
        parent = {root: None}
        # Keep iterating until both p and q are found
        while p not in parent or q not in parent:
            node = stack.pop()
            # Record the parent pointer while traversing
            if node.left:
                parent[node.left] = node
                stack.append(node.left)
            if node.right:
                parent[node.right] = node
                stack.append(node.right)
        # Once p and q are both found, get the ancestors of p from dictionary and add all ancestors of p to a set 
        ancestors = set()
        while p:
            ancestors.add(p)
            p = parent[p]
        # Traverse upward until parent of q is met in set of ancestors of p
        while q not in ancestors:
            q = parent[q]
        # Return the first ancestor of q in set of ancestors of p is the lower common ancestor
        return q
```

### Backtracking using Flags

#### Algorithm

1. Start with ```root``` node.
2. Put the ```(root, root_state)``` on to the stack. ```root_state``` defines whether one of the children or both children of ```root``` are left for traversal.
3. While the stack is not empty, peek into the top element of the stack represented as ```(parent_node, parent_state)```.
4. Before traversing any of the child nodes of ```parent_node``` we check if the ```parent_node``` itself is one of ```p``` or ```q```.
5. First time we find either of ```p``` or ```q```, set a boolean flag called ```one_node_found``` to ```True```. Also start keeping track of the __lowest common ancestors__ by keeping a note of the top index of the stack in the variable ```LCA_index```. Since all the current elements of the stack are ancestors of the node we just found.
6. The second time ```parent_node == p or parent_node == q``` it means we have found both the nodes and we can return the ```LCA node```.
7. Whenever we visit a ```child``` of a ```parent_node``` we push the ```(parent_node, updated_parent_state)``` onto the stack. We update the state of the parent since a child/branch has been visited/processed and accordingly the state changes.
8. A node finally gets popped off from the stack when the state becomes ```BOTH_FOUND``` implying both left and right subtrees have been pushed onto the stack and processed. If ```one_node_found``` is ```True``` then we need to check if the top node being popped could be one of the ancestors of the found node. In that case we need to reduce ```LCA_index``` by one. Since one of the ancestors was popped off.

![image](https://user-images.githubusercontent.com/35042430/215390906-b8e11209-e336-463e-967b-1498f0e5f170.png)

Whenever both ```p``` and ```q``` are found, ```LCA_index``` would be pointing to an index in the stack which would contain all the common ancestors between ```p``` and ```q```. And the ```LCA_index``` element has the lowest ancestor common between ```p``` and ```q```.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # Three static flags to keep track of post-order traversal
    BOTH_NOT_FOUND = 2
    ONE_FOUND = 1
    BOTH_FOUND = 0
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        # Depth-First Search
        #### Time Complexity: O(N) where N is the number of nodes in the binary tree
        #### Space Complexity: O(N), extra memory space to keep up the recursion stack
        stack = [(root, self.BOTH_NOT_FOUND)]
        one_node_found = False
        LCA_idx = -1
        # Post-order traversal
        while stack:
            parent, state = stack[-1]
            if state != self.BOTH_FOUND:
                if state == self.BOTH_NOT_FOUND:
                    if parent == p or parent == q:
                        # Check if one node has already been found before, both nodes are found
                        if one_node_found:
                            # Return the lowest common ancestor node
                            return stack[LCA_idx][0]
                        # Otherwise, mark one node has been found
                        else:
                            one_node_found = True
                            # Record the current top index of the stack as the LCA index
                            LCA_idx = len(stack) - 1
                    # If both q and p are not found or STATE == BOTH_NOT_FOUND, keep traversing
                    child = parent.left
                # If at least 1 node has been found or state == ONE_FOUND, keep traversing the other subtree
                else:
                    child = parent.right
                # Update the current node state as the node has been found
                stack.pop()
                stack.append((parent, state-1))
                
                # Add the child node to the stack for traversal
                if child:
                    stack.append((child, self.BOTH_NOT_FOUND))
            # Otherwise, both nodes are found or state == BOTH_FOUND
            else:
                # If LCA index equals the length of the stack, update LCA index
                if one_node_found and LCA_idx == len(stack) - 1:
                    LCA_idx -= 1
                stack.pop()
        return None
```
