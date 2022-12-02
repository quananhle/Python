## 206. Reverse Linked List

#### Difficulty: Easy

Given the ```head``` of a singly linked list, reverse the list, and _return the reversed list_.

![image](https://user-images.githubusercontent.com/35042430/205354599-f2387f08-b3be-481f-84b3-f2e9ff0b378b.png)

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
