## [92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)

```Tag```: ```Linked List``` ```Stack``` ```Slicing```

#### Difficulty: Medium

Given the ```head``` of a singly linked list and two integers ```left``` and ```right``` where ```left <= right```, reverse the nodes of the list from position ```left``` to position ```right```, and return _the reversed list_.

![image](https://user-images.githubusercontent.com/35042430/223356659-b9f3fb4f-4f0f-4692-8e4b-bfdc0043a771.png)

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

```Python

```
