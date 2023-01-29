## 236. Lowest Common Ancestor of a Binary Tree

```Tag```: ```Backtracking```

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
