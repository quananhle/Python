## 112. Path Sum

```Tag```: ```Recursion```

#### Difficulty: Easy

Given the ```root``` of a binary tree and an integer ```targetSum```, return _```true``` if the tree has a root-to-leaf path such that adding up all the values along the path equals ```targetSum```_.

A __leaf__ is a __node with no children__.

![image](https://user-images.githubusercontent.com/35042430/214960497-100861d1-ba85-4fda-884e-a103777b69ba.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/18/pathsum1.jpg)
```
Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
Output: true
Explanation: The root-to-leaf path with the target sum is shown.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/01/18/pathsum2.jpg)
```
Input: root = [1,2,3], targetSum = 5
Output: false
Explanation: There two root-to-leaf paths in the tree:
(1 --> 2): The sum is 3.
(1 --> 3): The sum is 4.
There is no root-to-leaf path with sum = 5.
```

__Example 3:__
```
Input: root = [], targetSum = 0
Output: false
Explanation: Since the tree is empty, there are no root-to-leaf paths.
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 5000]```.
- ```-1000 <= Node.val <= 1000```
- ```-1000 <= targetSum <= 1000```

 ---
