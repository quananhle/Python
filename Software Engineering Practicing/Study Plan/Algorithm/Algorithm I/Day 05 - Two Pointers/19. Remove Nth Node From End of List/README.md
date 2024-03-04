## [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list)

```Tag```: ```Two Pointers``` ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list, remove _the n<sup>th</sup> node from the end of the list and return its ```head```_.

![image](https://github.com/quananhle/Python/assets/35042430/69ff9242-469b-44ff-96d2-4ababf938a7c)

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

- The number of nodes in the list is ```sz```.
- $1 \le sz \le 30$
- $0 \le Node.val \le 100$
- $1 \le n \le sz$
 
---

### Two Pointers

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        # Given two nodes, left and right, with a distane between two nodes always maintained at n
        size = 0
        node, curr = head, head
        
        # Calculate the size
        while node:
            node = node.next
            size += 1
        
        # Delete the only node
        if size == 1:
            head = None
            return head
        
        # Delte the first node
        if size == n:
            head = head.next
            return head

        # Traverse to (n + 1)th node    
        k = size - n
        while k > 1:
            curr = curr.next
            k -= 1
        
        curr.next = curr.next.next
        return head
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        size = 1
        curr = head
        
        # Calculate the size
        while curr.next:
            curr = curr.next
            size += 1
        
        # Edge cases: head = [1, 2], n = 2, head = [1], n = 1
        if size == n:
            # Delte the first node or the only node
            return head.next

        prev, curr = head, head.next
        # Walk to the nth node from the end of the list   
        k = size - n - 1
        while k:
            curr = curr.next
            prev = prev.next
            k -= 1
        
        prev.next = curr.next
        return head
```

__Follow up__: Could you do this in one pass?

### ✅ One Pass Two Pointers

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
