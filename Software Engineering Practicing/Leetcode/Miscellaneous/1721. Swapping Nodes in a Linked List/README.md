## [1721. Swapping Nodes in a Linked List](https://leetcode.com/problems/swapping-nodes-in-a-linked-list)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Medium

You are given the ```head``` of a linked list, and an integer ```k```.

Return _the ```head``` of the linked list after __swapping__ the values of the ```k```<sup>th</sup> node from the beginning and the ```k```<sup>th</sup> node from the end (the list is __1-indexed__)._

![image](https://github.com/quananhle/Python/assets/35042430/848daf51-cd81-46e5-93a6-728cfc2d65d8)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/21/linked1.jpg)
```
Input: head = [1,2,3,4,5], k = 2
Output: [1,4,3,2,5]
```

__Example 2:__
```
Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
Output: [7,9,6,6,8,7,3,0,9,5]
```

__Constraints:__

- The number of nodes in the list is ```n```.
- ```1 <= k <= n <= 10^5```
- ```0 <= Node.val <= 100```

---

### Approach 1: Three Pass

![image](https://leetcode.com/problems/swapping-nodes-in-a-linked-list/Documents/5652/3PassApproach.svg)

- __Time Complexity__: ```O(n)```, where ```n``` is the length of the Linked List. We are iterating over the Linked List thrice.
- __Space Complexity__: ```O(1)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapNodes(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        def get_size(node):
            if not node:
                return 0
            size = 0
            while node:
                size += 1
                node = node.next
            return size
        
        size = get_size(head)
        left = right = 0
        lprev = rprev = head

        while left < k - 1:
            left += 1
            lprev = lprev.next

        while right < size - k:
            right += 1
            rprev = rprev.next

        lprev.val, rprev.val = rprev.val, lprev.val
        return head
```

### Approach 2: Two Pass

- __Time Complexity__: ```O(n)```, where ```n``` is the length of the Linked List. We are iterating over the Linked List twice.
- __Space Complexity__: ```O(1)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapNodes(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        def get_size(node):
            if not node:
                return 0
            size = 0
            while node:
                size += 1
                node = node.next
            return size
        
        size = get_size(head)
        left = right = 0
        lprev = rprev = head

        while left < k - 1 or right < size - k:
            if left < k - 1:
                left += 1
                lprev = lprev.next
            if right < size - k:
                right += 1
                rprev = rprev.next
        
        lprev.val, rprev.val = rprev.val, lprev.val
        return head
```

---

__Follow up question__: swap the nodes instead of the values

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapNodes(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        def get_size(node):
            if not node:
                return 0
            size = 0
            while node:
                size += 1
                node = node.next
            return size

        size = get_size(head)
        left = right = 0
        sentinel = fast = slow = curr = ListNode(next=head)

        while left < k - 1 or right < size - k:
            if left < k - 1:
                left += 1
                slow = slow.next
            if right < size - k:
                right += 1
                fast = fast.next

        if slow != fast:
            slow.next, fast.next = fast.next, slow.next
            slow.next.next, fast.next.next = fast.next.next, slow.next.next

        return sentinel.next
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapNodes(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        sentinel = fast = slow = curr = ListNode(next=head)

        while k > 1:
            k -= 1
            slow = slow.next    # Now slow is the prev node of the kth node.

        curr = slow.next.next
        while curr:
            fast = fast.next    # Now fast is the prev node of the -kth node.
            curr = curr.next  

        if slow != fast:
            slow.next, fast.next = fast.next, slow.next
            slow.next.next, fast.next.next = fast.next.next, slow.next.next

        return sentinel.next
```
