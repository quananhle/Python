## [894. All Possible Full Binary Trees](https://leetcode.com/problems/all-possible-full-binary-trees/)

```Tag```:

#### Difficulty: Medium

Given an integer ```n```, return _a list of all possible full binary trees with ```n``` nodes_. Each node of each tree in the answer must have ```Node.val == 0```.

Each element of the answer is the root node of one possible tree. You may return the final list of trees in any order.

A full binary tree is a binary tree where each node has exactly ```0``` or ```2``` children.

![image](https://github.com/quananhle/Python/assets/35042430/a4751c4e-b796-4528-9399-7c6506c22f9b)

---

__Example 1:__


Input: n = 7
Output: [[0,0,0,null,null,0,0,null,null,0,0],[0,0,0,null,null,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,null,null,null,null,0,0],[0,0,0,0,0,null,null,0,0]]
Example 2:

Input: n = 3
Output: [[0,0,0]]
 

Constraints:

1 <= n <= 20
