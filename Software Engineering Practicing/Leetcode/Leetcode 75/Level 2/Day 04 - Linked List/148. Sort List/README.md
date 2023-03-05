## [148. Sort List](https://leetcode.com/problems/sort-list/)

```Tag```: ```Two Pointers``` ```Stack``` ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list, return _the list after sorting it in __ascending order___.

![image](https://user-images.githubusercontent.com/35042430/222935430-ccdef565-bfa0-40ab-ab35-e7e07d41bc99.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/14/sort_list_1.jpg)
```
Input: head = [4,2,1,3]
Output: [1,2,3,4]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/14/sort_list_2.jpg)
```
Input: head = [-1,5,3,4,0]
Output: [-1,0,3,4,5]
```

__Example 3:__
```
Input: head = []
Output: []
```

__Constraints:__

- The number of nodes in the list is in the range [0, 5 * 10<sup>4</sup>].
- -10<sup>5</sup> <= Node.val <= 10<sup>5</sup>
 
---


__Follow up__: Can you sort the linked list in ```O(n logn)``` time and ```O(1)``` memory (i.e. constant space)?

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def sortList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # Merge Sort
        if not head or not head.next:
            return head
        
        # Slow and fast pointers to get the middle node
        slow, fast = head, head.next
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        # Divide the linked list into two separate lists
        middle = slow.next
        slow.next = None

        # Recursively sort the left and right halves of the linked list
        left = self.sortList(head)
        right = self.sortList(middle)
        
        # Merge the two sorted lists
        sentinel = ListNode(0)
        curr = sentinel
        while left and right:
            if left.val < right.val:
                curr.next = left
                left = left.next
            else:
                curr.next = right
                right = right.next
            curr = curr.next
        # Merge the remaining list
        if not left:
            curr.next = right
        elif not right:
            curr.next = left

        return sentinel.next
```
