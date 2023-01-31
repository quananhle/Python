## 700. Search in a Binary Search Tree

```Tag```: ```Depth-First Search``` ```Binary Search Tree``` ```Recursion```

#### Difficulty: Easy

You are given the ```root``` of a binary search tree (BST) and an integer ```val```.

Find the node in the BST that the node's value equals ```val``` and return _the subtree rooted with that node_. If such a node does not exist, return ```null```.

![image](https://user-images.githubusercontent.com/35042430/215680878-adfe86e7-502f-4f8b-86dc-a2ef4ed99a40.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/12/tree1.jpg)
```
Input: root = [4,2,7,1,3], val = 2
Output: [2,1,3]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/01/12/tree2.jpg)
```
Input: root = [4,2,7,1,3], val = 5
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 5000]```.
- 1 <= Node.val <= 10<sup7</sup>
- ```root``` is a binary search tree.
- 1 <= val <= 10<sup7</sup>

---
 
