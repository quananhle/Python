## [876. Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Easy

Given the ```head``` of a singly linked list, return _the middle node of the linked list_.

If there are two middle nodes, return __the second middle__ node.

![image](https://github.com/quananhle/Python/assets/35042430/cb12ca79-9b0f-42e9-9b56-9cd30eba0a84)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/07/23/lc-midlist1.jpg)

```
Input: head = [1,2,3,4,5]
Output: [3,4,5]
Explanation: The middle node of the list is node 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/07/23/lc-midlist2.jpg)

```
Input: head = [1,2,3,4,5,6]
Output: [4,5,6]
Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
```

__Constraints:__

```
The number of nodes in the list is in the range [1, 100].
1 <= Node.val <= 100
```

---

### Two Pointers

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def middleNode(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # Brute Force
        #### Time Complexity: O(N), traverse through head to count number of nodes
        #### Space Complexity: O(1), space used by pointers
        size = 0
        node = ll = head
        while node:
            size += 1
            node = node.next
        counter = size // 2
        while counter > 0 and ll:
            counter -= 1
            ll = ll.next
        return ll
```

### Two Pointers Fast & Slow

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def middleNode(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # Two Pointers Fast & Slow
        #### Time Complexity: O(N), traverse through head to count number of nodes
        #### Space Complexity: O(1), space used by pointers

        slow = fast = head
        while fast and fast.next:
            '''
            slow = slow.next; fast = fast.next.next
            '''
            slow, fast = slow.next, fast.next.next
        return slow
```
