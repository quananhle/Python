## [1669. Merge In Between Linked Lists](https://leetcode.com/problems/merge-in-between-linked-lists)

```Tag```: ```Linked List```

#### Difficulty: Medium

You are given two linked lists: ```list1``` and ```list2``` of sizes ```n``` and ```m``` respectively.

Remove ```list1```'s nodes from the $a^{th}$ node to the $b^{th}$ node, and put ```list2``` in their place.

The blue edges and nodes in the following figure indicate the result:

![image](https://assets.leetcode.com/uploads/2020/11/05/fig1.png)

_Build the result list and return its head_.

![image](https://github.com/quananhle/Python/assets/35042430/518678e1-a28b-485e-991b-260ad1e2794b)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2024/03/01/ll.png)
```
Input: list1 = [10,1,13,6,9,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
Output: [10,1,13,1000000,1000001,1000002,5]
Explanation: We remove the nodes 3 and 4 and put the entire list2 in their place. The blue edges and nodes in the above figure indicate the result.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/05/merge_linked_list_ex2.png)
```
Input: list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 = [1000000,1000001,1000002,1000003,1000004]
Output: [0,1,1000000,1000001,1000002,1000003,1000004,6]
Explanation: The blue edges and nodes in the above figure indicate the result.
```

__Constraints:__

- $3 \le list1.length \le 10^4$
- $1 \le a \le b \lt list1.length - 1$
- $1 \le list2.length \le 10^4$

---
