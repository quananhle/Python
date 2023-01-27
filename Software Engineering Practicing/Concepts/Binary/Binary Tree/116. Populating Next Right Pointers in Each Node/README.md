## 116. Populating Next Right Pointers in Each Node

```Tag```: ```Breadth-First Search``` ```Binary Tree```

#### Difficulty: Medium

You are given a __perfect binary tree__ where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

```C++
struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
```

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to ```NULL```.

Initially, all next pointers are set to ```NULL```.

![image](https://user-images.githubusercontent.com/35042430/215168938-0c17de55-37d9-4ed9-9bea-37053fc9ef0a.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/02/14/116_sample.png)
```
Input: root = [1,2,3,4,5,6,7]
Output: [1,#,2,3,#,4,5,6,7,#]
Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
```

__Example 2:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range [0, 2<sup>12</sup> - 1].
- ```-1000 <= Node.val <= 1000```
 
__Follow-up:__

- You may only use constant extra space.
- The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.

---

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img1.png)

### Level Order Traversal

```Python


```
