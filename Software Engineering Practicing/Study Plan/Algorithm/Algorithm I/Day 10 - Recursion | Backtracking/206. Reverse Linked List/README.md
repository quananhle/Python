## [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list)

```Tag```: ```Two Pointers``` ```Linked List``` ```Recusion```

#### Difficulty: Easy

Given the ```head``` of a singly linked list, reverse the list, and return _the reversed list_.

![image](https://github.com/quananhle/Python/assets/35042430/30cc9bb1-2023-482b-a627-ab4a674239d2)

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

__Follow up__: A linked list can be reversed either iteratively or recursively. Could you implement both?

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

There are two nodes which we should keep track of: ```the original head node``` and ```the new head node```.

Therefore, we need to use two pointers in one linked list at the same time. One pointer ```head``` always points at our ```original head node``` while another pointer ```curHead``` always points at our ```newest head node```.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/15/screen-shot-2018-04-14-at-181603.png)

1. First, we use a temporary pointer ```p``` to indicate the next node of the head node. And link the "next" field of ```head``` to the "next" field of ```p```.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/15/screen-shot-2018-04-14-at-182107.png)

2. Then, we link the "next" field of ```p``` to the ```curHead```.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/14/screen-shot-2018-04-14-at-182301.png)

3. Now our linked list actually looks like the picture below. And we set ```curHead``` to be ```p```.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/15/screen-shot-2018-04-14-at-182507.png)

By this way, we successfully move node 15 to the head of the list. And we can repeat this process until the next node of ```head``` is null.

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
    #### Time Complexity: O(N), traverse through the entire linked list
    #### Space Complexity: O(1), contanst memory space for pointers
        curr = head
        prev = None
        while curr:
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
        return prev
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
        tail = None

        while curr:
            curr.next, tail, curr = tail, curr, curr.next
        
        return tail
```

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
