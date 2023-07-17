## [445. Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii)

```Tag```: ```Stack``` ```Linked List```

#### Difficulty: Medium

You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

![image](https://github.com/quananhle/Python/assets/35042430/f5f99783-5ec2-46a8-8d04-3a19eb53d1c3)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/09/sumii-linked-list.jpg)
```
Input: l1 = [7,2,4,3], l2 = [5,6,4]
Output: [7,8,0,7]
```

__Example 2:__
```
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [8,0,7]
```

__Example 3:__
```
Input: l1 = [0], l2 = [0]
Output: [0]
```

---

__Constraints:__

- The number of nodes in each linked list is in the range $[1, 100]$.
- ```0 <= Node.val <= 9```
- It is guaranteed that the list represents a number that does not have leading zeros.

---

Follow up: Could you solve it without reversing the input lists?
