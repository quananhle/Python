## [1836. Remove Duplicates From an Unsorted Linked List](https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/)

```Tag```: ```Linked List``` ```Stack``` ```Two Pointers```

#### Difficulty: Medium

Given the ```head``` of a linked list, find all the values that appear __more than once__ in the list and delete the nodes that have any of those values.

Return _the linked list after the deletions_.

![image](https://user-images.githubusercontent.com/35042430/228045740-2ab371e8-9bc5-4c3d-94bb-c510c3accc2f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/21/tmp-linked-list.jpg)
```
Input: head = [1,2,3,2]
Output: [1,3]
Explanation: 2 appears twice in the linked list, so all 2's should be deleted. After deleting all 2's, we are left with [1,3].
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/04/21/tmp-linked-list-1.jpg)
```
Input: head = [2,1,1,2]
Output: []
Explanation: 2 and 1 both appear twice. All the elements should be deleted.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/04/21/tmp-linked-list-2.jpg)
```
Input: head = [3,2,2,1,3,2,4]
Output: [1,4]
Explanation: 3 appears twice and 2 appears three times. After deleting all 3's and 2's, we are left with [1,4].
```

__Constraints:__

- The number of nodes in the list is in the range ```[1, 10^5]```
- ```1 <= Node.val <= 10^5```

---

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicatesUnsorted(self, head: ListNode) -> ListNode:
        if not head:
            return None
        
        # Convert linked list to stack
        curr = head
        stack = list()
        while curr:
            stack.append(curr.val)
            curr = curr.next
        
        # Calculate the frequency of elements in stack
        freq = collections.defaultdict()
        for val in stack:
            freq[val] = 1 + freq.get(val, 0)

        # Build a duplicates removed stack
        stack = list()
        for key, val in freq.items():
            if val > 1:
                continue
            stack.append(key)

        # Rebuild the new linked list
        sentinel = ListNode()
        curr = sentinel
        for val in stack:
            curr.next = ListNode(val)
            curr = curr.next
        
        return sentinel.next
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicatesUnsorted(self, head: ListNode) -> ListNode:
        if not head:
            return None
        
        freq = collections.defaultdict(int)
        curr = head

        # Calculate the frequency of nodes in linked list
        while curr:
            freq[curr.val] += 1
            curr = curr.next
        
        # Traverse the linked list and delete the duplicates along the way
        sentinel = ListNode()
        sentinel.next = head
        prev = sentinel

        while head:
            if freq[head.val] > 1:
                prev.next = head.next
            else:
                prev = prev.next
            head = head.next
        
        return sentinel.next
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicatesUnsorted(self, head: ListNode) -> ListNode:
        if not head:
            return None
        
        freq = collections.defaultdict(int)
        curr = head

        # Calculate the frequency of nodes in linked list
        while curr:
            freq[curr.val] += 1
            curr = curr.next
        
        # Traverse the linked list and delete the duplicates along the way
        sentinel = ListNode(0, head)
        prev = sentinel

        while prev.next:
            if freq[prev.next.val] > 1:
                prev.next = prev.next.next
            else:
                prev = prev.next
        
        return sentinel.next
```
