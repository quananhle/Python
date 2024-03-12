## [1171. Remove Zero Sum Consecutive Nodes from Linked List](https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list)

```Tag```:

#### Difficulty: Medium

Given the head of a linked list, we repeatedly delete consecutive sequences of nodes that sum to 0 until there are no such sequences.

After doing so, return the head of the final linked list.  You may return any such answer.

(Note that in the examples below, all sequences are serializations of ListNode objects.)

![image](https://github.com/quananhle/Python/assets/35042430/6dc9f660-3e4b-4a1e-9a19-b227318264b2)

---

__Example 1:__
```
Input: head = [1,2,-3,3,1]
Output: [3,1]
Note: The answer [1,2,1] would also be accepted.
```

__Example 2:__
```
Input: head = [1,2,3,-3,4]
Output: [1,2,4]
```

__Example 3:__
```
Input: head = [1,2,3,-3,-2]
Output: [1]
```

__Constraints:__

- The given linked list will contain between 1 and 1000 nodes.
- Each node in the linked list has -1000 <= node.val <= 1000.

---

