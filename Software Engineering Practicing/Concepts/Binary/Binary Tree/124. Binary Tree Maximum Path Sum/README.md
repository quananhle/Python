## [124. Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum/)

```Tag```: ```Binary Tree``` ```Depth-First Search```

#### Difficulty: Hard

A __path__ in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence __at most once__. Note that the path does not need to pass through the root.

The __path sum__ of a path is the sum of the node's values in the path.

Given the ```root``` of a binary tree, return _the maximum path sum of any non-empty path_.

![image](https://user-images.githubusercontent.com/35042430/223816007-f7eeaeb1-355a-472f-90dc-6095bb18b707.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/13/exx1.jpg)
```
Input: root = [1,2,3]
Output: 6
Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/13/exx2.jpg)
```
Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
```

__Constraints:__

- The number of nodes in the tree is in the range [1, 3 * 10<sup>4</sup>].
- ```-1000 <= Node.val <= 1000```

---

