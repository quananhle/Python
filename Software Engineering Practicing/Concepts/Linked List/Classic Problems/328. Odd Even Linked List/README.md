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

A well-formed ```LinkedList``` need two pointers ```head``` and ```tail``` to support operations at both ends. The variables ```head``` and ```odd``` are the ```head``` pointer and `tail``` pointer of one ```LinkedList``` we call ```oddList```; the variables ```evenHead``` and ```even``` are the ```head``` pointer and ```tail``` pointer of another ```LinkedList``` we call ```evenList```. 
The algorithm traverses the original ```LinkedList``` and put the ```odd``` nodes into the ```oddList``` and the ```even``` nodes into the ```evenList```. To traverse a ```LinkedList``` we need at least one pointer as an iterator for the current node. But here the pointers ```odd``` and ```even``` not only serve as the tail pointers but also act as the iterators of the original list.

![image](https://leetcode.com/problems/odd-even-linked-list/solutions/127831/Figures/328_Odd_Even.svg)

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
        # First node is considered
        odd_tail, even_tail = head, head.next
        odd_head, even_head = odd_tail, even_tail
        while even_tail and even_tail.next:
            # odd_tail.next = even_tail.next
            odd_tail.next = odd_tail.next.next
            odd_tail = odd_tail.next
            # even_tail.next = odd_tail.next
            even_tail.next = even_tail.next.next
            even_tail = even_tail.next
        # Odd nodes list followed by even nodes list
        odd_tail.next = even_head
        return odd_head 
```
