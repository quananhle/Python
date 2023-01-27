## 116. Populating Next Right Pointers in Each Node

```Tag```:

#### Difficulty: Medium

You are given a __perfect binary tree__ where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

```Java
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
