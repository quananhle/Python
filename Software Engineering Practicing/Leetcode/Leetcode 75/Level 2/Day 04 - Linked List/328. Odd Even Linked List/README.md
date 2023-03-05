## [328. Odd Even Linked List](https://leetcode.com/problems/odd-even-linked-list/)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Medium

Given the ```head``` of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return _the reordered list_.

The __first__ node is considered __odd__, and the __second__ node is __even__, and so on.

Note that the relative order inside both the even and odd groups should remain as it was in the input.

You must solve the problem in ```O(1)``` extra space complexity and ```O(n)``` time complexity.

![image](https://user-images.githubusercontent.com/35042430/222937512-7490cfc2-5f40-429f-a2c1-6399bcfad2e5.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/10/oddeven-linked-list.jpg)
```
Input: head = [1,2,3,4,5]
Output: [1,3,5,2,4]\
```

__Example 2:__

[!image](https://assets.leetcode.com/uploads/2021/03/10/oddeven2-linked-list.jpg)
```
Input: head = [2,1,3,5,6,4,7]
Output: [2,3,6,7,1,5,4]
```

__Constraints:__

- The number of nodes in the linked list is in the range [0, 10<sup>4</sup>].
- -10<sup>6</sup> <= ```Node.val``` <= 10<sup>6</sup>

---

![image](https://leetcode.com/problems/odd-even-linked-list/Figures/328_Odd_Even.svg)

- __Time complexity__: ```O(n)```, there are total ```n``` nodes and we visit each node once.

- __Space complexity__: ```O(1)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head:
            return head
        
        odd_tail, even_tail = head, head.next
        odd_head, even_head = odd_tail, even_tail

        while even_tail and even_tail.next:
            odd_tail.next = odd_tail.next.next
            odd_tail = odd_tail.next
            even_tail.next = even_tail.next.next
            even_tail = even_tail.next

        odd_tail.next = even_head
        return odd_head
```
