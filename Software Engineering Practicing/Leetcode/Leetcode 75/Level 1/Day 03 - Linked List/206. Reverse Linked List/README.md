## [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list)

#### Difficulty: Easy

Given the ```head``` of a singly linked list, reverse the list, and _return the reversed list_.

![image](https://github.com/quananhle/Python/assets/35042430/83e0fe6e-6c8a-4148-90b5-a651e225c7d9)

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

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # Iterative
        #### Time Complexity: O(N), traverse through the linked list
        #### Space Complexity: O(1), fixed pointers size
        '''
        head->[1|O->[2|O->[3|O->[4|O->[5|O->None
        '''
        prev = None
        curr = head
        '''
        None
         |
        prev
        head->[1|O->[2|O->[3|O->[4|O->[5|O->None
         |
        curr
        '''
        while curr:
            '''
            tmp_next
               |
            [1|O->[2|O->[3|O->[4|O->[5|O->None
             |
            curr
            tmp_next
               |                  
            [1|O->None
             |
            curr
            prev->[1|O->None
            [2|O->[3|O->[4|O->[5|O->None
             |
            curr
            ========================================
            tmp_next
               |
            [2|O->[3|O->[4|O->[5|O->None
             |
            curr
                  tmp_next
                     |                  
            [2|O->[1|O->None
             |
            curr
            prev->[2|O->[1|O->None
            [3|O->[4|O->[5|O->None
             |
            curr
            ========================================
            tmp_next
               |
            [3|O->[4|O->[5|O->None
             |
            curr
            tmp_next
               |                 
            [3|O->[2|O->[1|O->None
             |
            curr
            prev->[3|O->[2|O->[1|O->None
            [4|O->[5|O->None
             |
            curr
            ========================================
            tmp_next
               |
            [4|O->[5|O->None
             |
            curr
            tmp_next
               |                 
            [4|O->[3|O->[2|O->[1|O->None
             |
            curr
            prev->[4|O->[3|O->[2|O->[1|O->None
            [5|O->None
             |
            curr
            ========================================
            tmp_next
               |
            [5|O->None
             |
            curr
            tmp_next
               |                 
            [5|O->[4|O->[3|O->[2|O->[1|O->None
             |
            curr
            prev->[5|O->[4|O->[3|O->[2|O->[1|O->None
            None
             |
            curr            
            '''
            tmp_next = curr.next
            curr.next = prev
            prev = curr
            curr = tmp_next
        return prev
```

![image](https://assets.leetcode.com/users/images/c93521ec-fc27-4f92-a0eb-1547fde0f4ae_1669983482.3510838.png)

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # Iterative
        #### Time Complexity: O(N), traverse through the linked list
        #### Space Complexity: O(1), fixed pointers size
        if not head or not head.next:
            return head
        prev = None
        is_first_node = True
        while head:
            node = ListNode(head.val)
            if is_first_node:
                is_first_node = False
                prev = node
            else:
                node.next = prev
                prev = node
            head = head.next
        return prev
```

### Recursion

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # Recursion
        #### Time Complexity: O(N), traverse through the linked list
        #### Space Complexity: O(N), recursive call does not return until reaches the end of the linked-list
        if not head or not head.next:
            return head
        prev = self.reverseList(head.next)
        head.next.next = head
        head.next = None
        return prev
```

