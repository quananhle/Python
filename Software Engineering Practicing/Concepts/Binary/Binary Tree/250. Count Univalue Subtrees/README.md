## 250. Count Univalue Subtrees

```Tag```: 

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the number of __uni-value__ subtrees_.

A __uni-value subtree__ means all nodes of the subtree have the same value.

![image](https://user-images.githubusercontent.com/35042430/214969844-0780f598-c82f-4bce-adb0-5eebdf5b2d5b.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/21/unival_e1.jpg)
```
Input: root = [5,1,5,5,5,null,5]
Output: 4
```

__Example 2:__
```
Input: root = []
Output: 0
```

__Example 3:__
```
Input: root = [5,5,5,5,5,null,5]
Output: 6
```

__Constraints:__

- The number of the node in the tree will be in the range ```[0, 1000]```.
- ```-1000 <= Node.val <= 1000```

---
