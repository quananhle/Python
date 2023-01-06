## 61. Rotate List

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given the ```head``` of a linked list, rotate the list to the right by ```k``` places.

![image](https://user-images.githubusercontent.com/35042430/211091227-79a291c0-779d-486a-aea6-76556cefa234.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/13/rotate1.jpg)
```
Input: head = [1,2,3,4,5], k = 2
Output: [4,5,1,2,3]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/13/roate2.jpg)
```
Input: head = [0,1,2], k = 4
Output: [2,0,1]
```

__Constraints:__
```
The number of nodes in the list is in the range [0, 500].
-100 <= Node.val <= 100
0 <= k <= 2 * 109
```

---

![image](https://leetcode.com/problems/rotate-list/solutions/240869/Figures/61/rotate.png)

```k``` could be rewritten as a sum ```k = (k // n) * n + k % n```, where the first term doesn't result in any rotation. Hence one could simply replace ```k``` by ```k % n``` to always have number of rotation places smaller than ```n```.

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        # Base cases
        if not head or not head.next:
            return head
        if not k:
            return head
        # Check if k == size of linked list, a complete rotation. If k >= size, recalculate new k to be < size        
        size = 0
        node = head
        while node:
            size += 1
            node = node.next
        if k >= size:
            k = k % size
        # Base case:
        if k == 0:
            return head        
        
        # Create a copy of the original linked list
        new_node = ListNode(head.val)
        node = head
        sentinel = new_node
        while node.next:
            tmp = ListNode(node.next.val)
            new_node.next = tmp
            new_node = new_node.next
            node = node.next
        
        new_head = head
        new_tail = sentinel
        for _ in range(size - k - 1):
            new_head = new_head.next
        for _ in range(size - k):
            new_tail = new_tail.next
        new_head.next = None
        tail = new_tail
        while tail.next:
            tail = tail.next
        tail.next = head
        for _ in range(size - k):
            sentinel = sentinel.next
        return sentinel
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        # Base cases
        if not head or not head.next:
            return head
        if not k:
            return head
        # Check if k == size of linked list, a complete rotation. If k >= size, recalculate new k to be < size        
        size = 1
        node = head
        while node.next:
            size += 1
            node = node.next
        if k >= size:
            k = k % size
        # Base case:
        if k == 0:
            return head
        
        # Close the linked list to be a circular linked list
        node.next = head

        new_tail = head
        # New tail: (size - k - 1)th node and new head: (size - k) node
        for _ in range(size - k - 1):
            new_tail = new_tail.next
        # Link the tail to the head
        
        new_head = new_tail.next
        # Break the circle
        new_tail.next = None
        return new_head
```
