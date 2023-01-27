## 106. Construct Binary Tree from Inorder and Postorder Traversal

```Tag```:

#### Difficulty: Medium

Given two integer arrays ```inorder``` and ```postorder``` where ```inorder``` is the inorder traversal of a binary tree and ```postorder``` is the postorder traversal of the same tree, construct and return _the binary tree_.

![image](https://user-images.githubusercontent.com/35042430/215049175-6600b2af-c681-4611-b453-43365f5ce78e.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```
Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
Output: [3,9,20,null,null,15,7]
```

__Example 2:__
```
Input: inorder = [-1], postorder = [-1]
Output: [-1]
```

__Constraints:__

- ```1 <= inorder.length <= 3000```
- ```postorder.length == inorder.length```
- ```-3000 <= inorder[i], postorder[i] <= 3000```
- ```inorder``` and ```postorder``` consist of __unique__ values.
- Each value of __postorder__ also appears in __inorder__.
- ```inorder``` is __guaranteed__ to be the inorder traversal of the tree.
- ```postorder``` is __guaranteed__ to be the postorder traversal of the tree.

---
