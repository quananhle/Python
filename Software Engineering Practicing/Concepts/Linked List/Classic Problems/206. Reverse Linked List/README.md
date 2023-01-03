## 206. Reverse Linked List

```Tag```: ```Two Pointers``` ```Linked List``` ```Recusion```

#### Difficulty: Easy

Given the ```head``` of a singly linked list, reverse the list, and return _the reversed list_.

![image](https://user-images.githubusercontent.com/35042430/210441445-a85fa43a-846c-464d-9446-f08755497257.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/rev1ex1.jpg)
```
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/19/rev1ex2.jpg)
```
Input: head = [1,2]
Output: [2,1]
```

__Example 3:__
```
Input: head = []
Output: []
```

__Constraints:__
```
The number of nodes in the list is the range [0, 5000].
-5000 <= Node.val <= 5000
```

---

### Iterative

1. Initialize 2 pointers: ```curr``` and ```prev```. ```prev``` will point to null as the tail of the reversed linked list, while ```curr``` will point to the head of the original linked list.
2. We need a pointer to store the ```curr.next``` node before changing the reference,
```Python
tmp = curr.next
```
3. Since a node does not have reference to its ```prev```, we must store its previous element beforehand, so the the ```curr``` node will point to ```prev``` node
```Python
curr.next = prev
```
4. While traversing the list, we can change the current node's next pointer to point to its previous element, so ```prev``` will point to ```curr``` while ```curr``` point to the next node
```Python
prev = curr
curr = curr.next
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        curr = head
        prev = None
        while curr:
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
        return prev
```

Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?

### Recursive

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head or not head.next:
            return head
        new_head = self.reverseList(head.next)
        # Reverse the node
        head.next.next = head
        # Point tail to None
        head.next = None
        return new_head
```
