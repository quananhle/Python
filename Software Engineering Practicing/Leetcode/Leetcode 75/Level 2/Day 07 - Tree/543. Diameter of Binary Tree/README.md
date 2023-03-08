## [543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the length of the diameter of the tree_.

The __diameter__ of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the ```root```.

The length of a path between two nodes is represented by the number of edges between them.

![image](https://user-images.githubusercontent.com/35042430/223796156-b895d3ba-272f-4e67-901e-cac3e9490424.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg)
```
Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
```

__Example 2:__
```
Input: root = [1,2]
Output: 1
```

__Constraints:__

- The number of nodes in the tree is in the range [1, 10<sup>4</sup>].
- ```-100 <= Node.val <= 100```

---
