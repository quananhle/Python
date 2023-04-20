## [662. Maximum Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree/)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the __maximum width__ of the given tree_.

The __maximum width__ of a tree is the maximum __width__ among all levels.

The __width__ of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.

It is __guaranteed__ that the answer will in the range of a 32-bit signed integer.

![image](https://user-images.githubusercontent.com/35042430/233257925-a988d83a-f456-4ead-ba8a-1876cb19beb4.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/05/03/width1-tree.jpg)
```
Input: root = [1,3,2,5,3,null,9]
Output: 4
Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/03/14/maximum-width-of-binary-tree-v3.jpg)
```
Input: root = [1,3,2,5,null,null,9,6,null,7]
Output: 7
Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/05/03/width3-tree.jpg)
```
Input: root = [1,3,2,5]
Output: 2
Explanation: The maximum width exists in the second level with length 2 (3,2).
```

__Constraints:__

- The number of nodes in the tree is in the range ```[1, 3000]```.
- ```-100 <= Node.val <= 100```

---
