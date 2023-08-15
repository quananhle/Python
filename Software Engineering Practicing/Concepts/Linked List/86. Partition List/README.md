## [86. Partition List](https://leetcode.com/problems/partition-list/)

```Tag```: ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list and a value ```x```, partition it such that all nodes __less than__ ```x``` come before nodes __greater than or equal to__ ```x```.

You should preserve the original relative order of the nodes in each of the two partitions.

![image](https://github.com/quananhle/Python/assets/35042430/3b810ef5-c261-4095-841a-6d132408ec0d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/04/partition.jpg)
```
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]
```

__Example 2:__
```
Input: head = [2,1], x = 2
Output: [1,2]
```

__Constraints:__

- The number of nodes in the list is in the range ```[0, 200]```.
- $-100 \le Node.val \le 100$
- $-200 \le x \le 200$

---

### Two Pointers

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:
        before_x = before_head = ListNode(0)
        after_x = after_head = ListNode(0)

        curr = head
        while curr:
            if curr.val < x:
                before_x.next = curr
                before_x = before_x.next
            else:
                after_x.next = curr
                after_x = after_x.next
            
            curr = curr.next
        
        after_x.next = None
        before_x.next = after_head.next

        return before_head.next
```

