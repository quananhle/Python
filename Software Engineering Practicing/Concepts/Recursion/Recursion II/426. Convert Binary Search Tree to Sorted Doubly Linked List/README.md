## 426. Convert Binary Search Tree to Sorted Doubly Linked List

```Tag```: ```Recursion```

Convert a __Binary Search Tree__ to a sorted __Circular Doubly-Linked List__ in place.

You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.

![image](https://user-images.githubusercontent.com/35042430/218137493-8da2590d-6c62-4669-a7a3-ad1b8fd7a25f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/10/12/bstdlloriginalbst.png)

    Input: root = [4,2,5,1,3]

![image](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturndll.png)

    Output: [1,2,3,4,5]

    Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

![image](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturnbst.png)

__Example 2:__
```
Input: root = [2,1,3]
Output: [1,2,3]
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 2000]```.
- ```-1000 <= Node.val <= 1000```
- All the values of the tree are unique.

---
