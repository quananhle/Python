## 652. Find Duplicate Subtrees

```Tag```: ```Hash Table``` ```Binary Tree```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _all __duplicate subtrees___.

For each kind of duplicate subtrees, you only need to return the root node of any __one__ of them.

Two trees are __duplicate__ if they have the __same structure__ with the __same node values__.

![image](https://user-images.githubusercontent.com/35042430/213800868-d651a08a-834b-4109-9db3-16c185e116af.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/16/e1.jpg)
```
Input: root = [1,2,3,4,null,2,4,null,null,4]
Output: [[2,4],[4]]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/08/16/e2.jpg)
```
Input: root = [2,1,1]
Output: [[1]]
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/08/16/e33.jpg)
```
Input: root = [2,2,2,3,null,3,null]
Output: [[2,3],[3]]
```

__Constraints:__
```
The number of the nodes in the tree will be in the range [1, 5000]
-200 <= Node.val <= 200
```

---

### Hash Map

#### Tree Representation

One may represent a tree with a string. There exist different ways to do so. One of the possible representations of a tree is the following:

  ```(representation of the left subtree) root.val (representation of the right subtree)```. 

It is a recursive representation because the parts in the brackets are representations of smaller subtrees.

![image](https://leetcode.com/problems/find-duplicate-subtrees/solutions/3011042/Figures/652/652_example_1.jpg)

For example, the representation of the tree in the picture is ```((4)2())1(((4)2())3(4))```.


