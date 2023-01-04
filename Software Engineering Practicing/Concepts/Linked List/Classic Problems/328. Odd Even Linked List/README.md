## 328. Odd Even Linked List

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given the ```head``` of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

The first node is considered __odd__, and the second node is __even__, and so on.

Note that the relative order inside both the even and odd groups should remain as it was in the input.

You must solve the problem in ```O(1)``` extra space complexity and ```O(n)``` time complexity.

![image](https://user-images.githubusercontent.com/35042430/210615097-0904f926-59b0-4340-95d5-90f0e1bec733.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/10/oddeven-linked-list.jpg)
```
Input: head = [1,2,3,4,5]
Output: [1,3,5,2,4]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/10/oddeven2-linked-list.jpg)
```
Input: head = [2,1,3,5,6,4,7]
Output: [2,3,6,7,1,5,4]
```

__Constraints:__
```
The number of nodes in the linked list is in the range [0, 104].
-106 <= Node.val <= 106
```

---

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head:
            return None
        odd, even = head, head.next
        even_head = even
        while even and even.next:
            odd.next = even.next
            odd = odd.next
            even.next = odd.next
            even = even.next
        odd.next = even_head
        return head
```
