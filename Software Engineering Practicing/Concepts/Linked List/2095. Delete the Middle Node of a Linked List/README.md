## [2095. Delete the Middle Node of a Linked List](https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list)

```Tag```: ```Linked List``` ```Two Pointers``` ```Robert W. Floyd's Tortoise and Hare Algorithm```

#### Difficulty: Medium

You are given the ```head``` of a linked list. Delete the middle node, and return _the head of the modified linked list_.

The middle node of a linked list of size ```n``` is the ```⌊n / 2⌋```<sup>th</sup> node from the start using __0-based__ indexing, where ```⌊x⌋``` denotes the largest integer less than or equal to ```x```.

For ```n = 1```, ```2```, ```3```, ```4```, and ```5```, the middle nodes are ```0```, ```1```, ```1```, ```2```, and ```2```, respectively.

![image](https://github.com/quananhle/Python/assets/35042430/e92c86d6-0ed7-4fa1-98fc-43e2385fdc62)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/11/16/eg1drawio.png)
```
Input: head = [1,3,4,7,1,2,6]
Output: [1,3,4,1,2,6]
Explanation:
The above figure represents the given linked list. The indices of the nodes are written below.
Since n = 7, node 3 with value 7 is the middle node, which is marked in red.
We return the new list after removing this node. 
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/11/16/eg2drawio.png)
```
Input: head = [1,2,3,4]
Output: [1,2,4]
Explanation:
The above figure represents the given linked list.
For n = 4, node 2 with value 3 is the middle node, which is marked in red.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/11/16/eg3drawio.png)
```
Input: head = [2,1]
Output: [2]
Explanation:
The above figure represents the given linked list.
For n = 2, node 1 with value 1 is the middle node, which is marked in red.
Node 0 with value 2 is the only node remaining after removing node 1.
```

__Constraints:__

- The number of nodes in the list is in the range ```[1, 10^5]```.
- ```1 <= Node.val <= 10^5```

---

### Two Pass

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(1)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteMiddle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head or not head.next:
            return None

        count = 0
        prev = curr = head

        while curr:
            count += 1
            curr = curr.next

        mid = count // 2

        for _ in range(mid - 1):
            prev = prev.next
        
        prev.next = prev.next.next
        return head
```

### One Pass & Slow and Fast Pointers

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(1)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteMiddle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head or not head.next:
            return None

        prev = head
        slow, fast = head, head
        count = 0

        while fast and fast.next:

            slow, fast = slow.next, fast.next.next
            count += 1
            if count > 1:
                prev = prev.next
                count -= 1

        prev.next = slow.next
        return head
```

### Slow and Fast Pointers

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteMiddle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head or not head.next:
            return None
        
        slow, fast = head, head.next.next

        while fast and fast.next:
            slow, fast = slow.next, fast.next.next
        
        slow.next = slow.next.next
        return head
```
