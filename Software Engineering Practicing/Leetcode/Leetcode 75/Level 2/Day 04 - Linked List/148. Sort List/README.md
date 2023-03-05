## [148. Sort List](https://leetcode.com/problems/sort-list/)

```Tag```: ```Linked List``` ```Divide & Conquer``` ```Merge Sort```

#### Difficulty: Medium

Given the ```head``` of a linked list, return _the list after sorting it in __ascending order___.

![image](https://user-images.githubusercontent.com/35042430/222935430-ccdef565-bfa0-40ab-ab35-e7e07d41bc99.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/14/sort_list_1.jpg)
```
Input: head = [4,2,1,3]
Output: [1,2,3,4]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/14/sort_list_2.jpg)
```
Input: head = [-1,5,3,4,0]
Output: [-1,0,3,4,5]
```

__Example 3:__
```
Input: head = []
Output: []
```

__Constraints:__

- The number of nodes in the list is in the range [0, 5 * 10<sup>4</sup>].
- -10<sup>5</sup> <= Node.val <= 10<sup>5</sup>
 
---

### Merge Sort

#### Top-Down Merge Sort

Merge sort is a popularly known algorithm that follows the __Divide and Conquer Strategy__. The divide and conquer strategy can be split into 2 phases:

_Divide phase_: Divide the problem into subproblems.

_Conquer phase_: Repeatedly solve each subproblem independently and combine the result to form the original problem.

The Top Down approach for merge sort recursively splits the original list into sublists of equal sizes, sorts each sublist independently, and eventually merge the sorted lists. Let's look at the algorithm to implement merge sort in Top Down Fashion.

__Algorithm__

- Recursively split the original list into two halves. The split continues until there is only one node in the linked list (Divide phase). To split the list into two halves, we find the middle of the linked list using the Fast and Slow pointer approach as mentioned in [876. Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list/).

- Recursively sort each sublist and combine it into a single sorted list. (Merge Phase). This is similar to the problem [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)

![image](https://leetcode.com/problems/sort-list/Figures/148/topDown_merge_sort.png)

- __Time Complexity__: ```O(nlog⁡n)```
- __Space Complexity__: ```O(log⁡n)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def sortList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # Merge Sort
        if not head or not head.next:
            return head
        
        # Slow and fast pointers to get the middle node
        slow, fast = head, head.next
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        # Divide the linked list into two separate lists
        middle = slow.next
        slow.next = None

        # Recursively sort the left and right halves of the linked list
        left = self.sortList(head)
        right = self.sortList(middle)
        
        # Merge the two sorted lists
        sentinel = ListNode(0)
        curr = sentinel
        while left and right:
            if left.val < right.val:
                curr.next = left
                left = left.next
            else:
                curr.next = right
                right = right.next
            curr = curr.next
        # Merge the remaining list
        if not left:
            curr.next = right
        elif not right:
            curr.next = left

        return sentinel.next
```

__Follow up__: Can you sort the linked list in ```O(n logn)``` time and ```O(1)``` memory (i.e. constant space)?

#### Bottom-Up Merge Sort

![image](https://leetcode.com/problems/sort-list/Figures/148/bottom_up_merge_sort.png)

```Python
class Solution:
    def sortList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        def count(node):
            cnt = 0
            while node:
                cnt += 1
                node = node.next
            return cnt

        def split(node, size):
            # Empty list
            if not node:
                return (None, None)

            prev_slow = node
            prev_fast = node.next if node.next else node
            i = 1
            while i < size and (prev_slow.next or prev_fast.next):
                if prev_slow.next:
                    prev_slow = prev_slow.next
                if prev_fast.next:
                    prev_fast = prev_fast.next.next if prev_fast.next.next else prev_fast.next
                i += 1

            midd = prev_slow.next
            tail = prev_fast.next
            prev_slow.next = None
            prev_fast.next = None

            return (midd, tail)

        def merge(list1, list2):
            head = tail = ListNode
            while list1 and list2:
                if list1.val <= list2.val:
                    tail.next = list1
                    list1 = list1.next
                else:
                    tail.next = list2
                    list2 = list2.next
                tail = tail.next
            
            last = tail
            tail.next = list1 if list1 else list2

            while tail:
                last = tail
                tail = tail.next
            return (head.next, last)


        n = count(head)
        sentinel = ListNode(0, head)
        size = 1
        while size < n:
            start = sentinel.next
            tail = sentinel
            while start:
                mid, end = split(start, size)
                tail.next, tail = merge(start, mid)
                start = end
            size *= 2

        return sentinel.next
```
