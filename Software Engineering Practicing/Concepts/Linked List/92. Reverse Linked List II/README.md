## [92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)

```Tag```: ```Linked List``` ```Stack``` ```Slicing```

#### Difficulty: Medium

Given the ```head``` of a singly linked list and two integers ```left``` and ```right``` where ```left <= right```, reverse the nodes of the list from position ```left``` to position ```right```, and return _the reversed list_.

![image](https://github.com/quananhle/Python/assets/35042430/9b0aa32c-6fd9-4e46-95bb-15d58670b114)

---

__Example 1__:

![image](https://assets.leetcode.com/uploads/2021/02/19/rev2ex2.jpg)
```
Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]
```

__Example 2:__
```
Input: head = [5], left = 1, right = 1
Output: [5]
```

__Constraints:__

- The number of nodes in the list is ```n```.
- ```1 <= n <= 500```
- ```-500 <= Node.val <= 500```
- ```1 <= left <= right <= n```
 
---

### Stack

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        if not head:
            return head

        stack = list()
        while head:
            stack.append(head.val)
            head = head.next
        
        res = stack[:left-1] + stack[left-1:right][::-1] + stack[right:]

        sentinel = curr = ListNode(res[0])
        for val in res[1:]:
            curr.next = ListNode(val)
            curr = curr.next

        return sentinel
```

### Recursion

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        self.tail = None

        def reverse(head, n):
            if n == 1:
                self.tail = head.next
                return head

            tail = reverse(head.next, n - 1)
            head.next.next = head
            head.next = self.tail
            return tail

        if left == 1:
            return reverse(head, right)

        head.next = self.reverseBetween(head.next, left-1, right-1)
        return head      
```

__Follow up__: Could you do it in one pass?

### Recursion

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/recursion-1.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/recursion-2.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/recursion-3.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/recursion-4.png)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        if not head:
            return None

        self.l, self.r = head, head
        self.stop = False

        def helper(r, start, end):
            # Base case
            if end == 1:
                return
            
            # Keep moving right pointer r to the right until reaching end boundary
            r = r.next

            # Keep moving left pointer l to the right until reaching start boundary
            if start > 1:
                self.l = self.l.next

            helper(r, start - 1, end - 1)

            if self.l == r or r.next == self.l:
                self.stop = True

            if not self.stop:
                self.l.val, r.val = r.val, self.l.val
                self.l = self.l.next

        helper(self.r, left, right)
        return head 
```

### Iteration

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/iterative-1.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/iterative-2.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/iterative-3.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/iterative-4.png)

![image](https://leetcode.com/problems/reverse-linked-list-ii/Figures/92/iterative-5.png)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        if not head:
            return None
        
        curr, prev = head, None
        # Move the two pointers until reaching the starting point of the sublist
        while left > 1:
            prev = curr
            curr = curr.next
            left -= 1
            right -= 1
        
        tail, conn = curr, prev
        # Reverse the nodes
        while right:
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
            right -= 1
        
        if conn:
            conn.next = prev
        else:
            head = prev
        tail.next = curr
        
        return head
```
