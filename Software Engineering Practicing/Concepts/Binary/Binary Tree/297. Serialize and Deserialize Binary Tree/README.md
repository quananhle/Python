## 297. Serialize and Deserialize Binary Tree

```Tag```: ```Stack``` ```Queue``` ```String``` ```Binary Tree```

#### Difficulty: Hard

Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

![image](https://user-images.githubusercontent.com/35042430/215418296-bbb0f039-91c7-490b-b9f1-f4a9115772a8.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/15/serdeser.jpg)
```
Input: root = [1,2,3,null,null,4,5]
Output: [1,2,3,null,null,4,5]
```

__Example 2:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range [0, 10<sup>4</sup>].
- ```-1000 <= Node.val <= 1000```

---
