## 103. Binary Tree Zigzag Level Order Traversal

```Tag```: ```Binary Tree```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the zigzag level order traversal of its nodes' values_. (i.e., from left to right, then right to left for the next level and alternate between).

![image](https://user-images.githubusercontent.com/35042430/219906380-80d3dff1-02dd-4ca5-b15a-ebe727931741.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]
```

__Example 2:__
```
Input: root = [1]
Output: [[1]]
```

__Example 3:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 2000]```.
- ```-100 <= Node.val <= 100```

---

