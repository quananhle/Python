## 141. Linked List Cycle

```Tag```: ```Two Pointer Technique```

#### Difficulty: Easy

Given ```head```, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the ```next``` pointer. Internally, ```pos``` is used to denote the index of the node that tail's ```next``` pointer is connected to. Note that ```pos``` is not passed as a parameter.

Return _```true``` if there is a cycle in the linked list. Otherwise, return ```false```_.

![image](https://user-images.githubusercontent.com/35042430/210279241-1f1baa9d-828b-439f-a605-1655cf66a205.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)
```
Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)
```
Input: head = [1,2], pos = 0
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)
```
Input: head = [1], pos = -1
Output: false
Explanation: There is no cycle in the linked list.
```

__Constraints:__
```
The number of the nodes in the list is in the range [0, 104].
-105 <= Node.val <= 105
pos is -1 or a valid index in the linked-list.
```

---

### Hash Set

```Python

```

__Follow up:__ Can you solve it using O(1) (i.e. constant) memory?
