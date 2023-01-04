## 21. Merge Two Sorted Lists

#### Difficulty: Easy

You are given the heads of two sorted linked lists ```list1``` and ```list2```.

Merge the two lists in a one __sorted__ list. The list should be made by splicing together the nodes of the first two lists.

Return _the head of the merged linked list_.

![image](https://user-images.githubusercontent.com/35042430/205335285-3cc8b493-ba4d-4a36-b369-f0f7b566955f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg)
```
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]
```

__Example 2:__
```
Input: list1 = [], list2 = []
Output: []
```

__Example 3:__
```
Input: list1 = [], list2 = [0]
Output: [0]
```

__Constraints:__
```
The number of nodes in both lists is in the range [0, 50].
-100 <= Node.val <= 100
Both list1 and list2 are sorted in non-decreasing order.
```

---

### Iteration

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeTwoLists(self, list1, list2):
        """
        :type list1: Optional[ListNode]
        :type list2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        # Iteration
        #### Time Complexity: O(N + M), traverse through size N of list1 and size M of list2
        #### Space Complexity: O(1), only allocate few pointers, require no extra space
        # maintain an unchanging reference to node ahead of the return node.
        head = merged_list = ListNode()
        while list1 and list2:
            # Check if node value of list1 smaller than or equal to node value of list2
            if list1.val <= list2.val:
                # head points to list1 node
                head.next = list1
                # list1 tail points to next node of list1
                list1 = list1.next
            else:
                head.next = list2
                list2 = list2.next
            head = head.next
        # At least one of list1 and list2 can still have nodes at this point, so connect the non-null list to the end of the merged list.            
        if list1:
            head.next = list1
        else:
            head.next = list2
        # omit the first node of merged_list as it has default val
        return merged_list.next
```

### Recursion

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeTwoLists(self, list1, list2):
        """
        :type list1: Optional[ListNode]
        :type list2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
         # Recursion
        #### Time Complexity: O(N + M), traverse through size N of list1 and size M of list2
        #### Space Complexity: O(N + M), recursion call does not return until the end of list1 and list2
        if not list1:
            return list2
        elif not list2:
            return list1
        elif list1.val <= list2.val:
            list1.next = self.mergeTwoLists(list1.next, list2)
            return list1
        else:
            list2.next = self.mergeTwoLists(list1, list2.next)
            return list2
```        
