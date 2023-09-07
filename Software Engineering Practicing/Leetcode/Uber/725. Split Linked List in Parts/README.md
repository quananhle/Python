## [725. Split Linked List in Parts](https://leetcode.com/problems/split-linked-list-in-parts)

```Tag```:

#### Difficulty: Medium

Given the ```head``` of a singly linked list and an integer ```k```, split the linked list into ```k``` consecutive linked list parts.

The length of each part should be as equal as possible: no two parts should have a size differing by more than one. This may lead to some parts being null.

The parts should be in the order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal to parts occurring later.

Return _an array of the ```k``` parts_.

![image](https://github.com/quananhle/Python/assets/35042430/e3e43e89-455a-4807-bc64-fde659f0c787)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/06/13/split1-lc.jpg)
```
Input: head = [1,2,3], k = 5
Output: [[1],[2],[3],[],[]]
Explanation:
The first element output[0] has output[0].val = 1, output[0].next = null.
The last element output[4] is null, but its string representation as a ListNode is [].
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/06/13/split2-lc.jpg)
```
Input: head = [1,2,3,4,5,6,7,8,9,10], k = 3
Output: [[1,2,3,4],[5,6,7],[8,9,10]]
Explanation:
The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.
```

__Constraints:__

- The number of nodes in the list is in the range $[0, 1000]$.
- $0 \le Node.val \le 1000$
- $1 \le k \le 50$

---


