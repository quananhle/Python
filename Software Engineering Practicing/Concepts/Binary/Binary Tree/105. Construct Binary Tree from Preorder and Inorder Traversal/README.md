## 105. Construct Binary Tree from Preorder and Inorder Traversal

```Tag```: ```Recursion``` ```Binary Tree``` ```Hash Map```

#### Difficulty: Medium

Given two integer arrays ```preorder``` and ```inorder``` where ```preorder``` is the preorder traversal of a binary tree and ```inorder``` is the inorder traversal of the same tree, construct and return the _binary tree_.

![image](https://user-images.githubusercontent.com/35042430/215055846-3a6f0fef-df46-4a3d-828c-784202497c8c.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
```

__Example 2:__
```
Input: preorder = [-1], inorder = [-1]
Output: [-1]
```

__Constraints:__

- ```1 <= preorder.length <= 3000```
- ```inorder.length == preorder.length```
- ```-3000 <= preorder[i], inorder[i] <= 3000```
- ```preorder``` and ```inorder``` consist of unique values.
- Each value of ```inorder``` also appears in ```preorder```.
- ```preorder``` is __guaranteed__ to be the preorder traversal of the tree.
- ```inorder``` is __guaranteed__ to be the inorder traversal of the tree.

---
