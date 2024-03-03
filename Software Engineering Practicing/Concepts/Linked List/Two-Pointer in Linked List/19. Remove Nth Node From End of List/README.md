## [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list)

```Tag```: ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list, remove the n<sup>th</sup> node from the end of the list and return its head.

![image](https://github.com/quananhle/Python/assets/35042430/05486c13-7bfb-4ec2-b724-eddb3ebcab4c)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)
```
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]
```

__Example 2:__
```
Input: head = [1], n = 1
Output: []
```

__Example 3:__
```
Input: head = [1,2], n = 1
Output: [1]
```

__Constraints:__
```
The number of nodes in the list is sz.
1 <= sz <= 30
0 <= Node.val <= 100
1 <= n <= sz
```

---

### Two Pass Algorithm

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        size = 0
        node, curr = head, head
        # Count the size of the list
        while node:
            node = node.next
            size += 1
        # Check if there is only 1 node in the list
        if size == 1:
            head = None
            return head
        # Check if to delete the first node
        if size == n:
            head = head.next
            return head
        # Traverse to the (n-1)th node
        k = size - n
        while k > 1:
            k -= 1
            curr = curr.next
        '''
        # Check if curr is not the last node
        if curr.next.next:
            curr.next = curr.next.next
        # Otherwise, point to empty
        else:
            curr.next = None
        '''
        curr.next = curr.next.next
        return head
```

__Follow up__: Could you do this in one pass?

### One Pass Algorithm

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        size = 1
        curr, node = head, head
        while node.next:
            node = node.next
            if size > n:
                curr = curr.next
            size += 1
        if size == n:
            return head.next
        else:
            curr.next = curr.next.next
        return head
```
