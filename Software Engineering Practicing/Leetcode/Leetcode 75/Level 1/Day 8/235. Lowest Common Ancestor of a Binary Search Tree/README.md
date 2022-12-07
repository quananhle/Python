## 235. Lowest Common Ancestor of a Binary Search Tree

#### Difficulty: Medium

Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes ```p``` and ```q``` as the lowest node in ```T``` that has both ```p``` and ```q``` as descendants (where we allow a node to be a descendant of itself).”

![image](https://user-images.githubusercontent.com/35042430/206313647-37857dcb-bdfd-4181-8ee7-717a5dd2dd71.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.pngw)

```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)

```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
Output: 2
Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
```

__Example 3:__
```
Input: root = [2,1], p = 2, q = 1
Output: 2
```

__Constraints:__
```
- The number of nodes in the tree is in the range [2, 105].
- -109 <= Node.val <= 109
- All Node.val are unique.
- p != q
- p and q will exist in the BST.
```
