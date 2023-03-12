## [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

```Tag```: ```Linked List``` ```Priority Queue``` ```Divide & Conquer```

#### Difficulty: Hard

You are given an array of ```k``` linked-lists ```lists```, each linked-list is sorted in ascending order.

_Merge all the linked-lists into one sorted linked-list and return it_.

![image](https://user-images.githubusercontent.com/35042430/224527113-16a2065e-2e16-4c20-872e-904a4de6a0b5.png)

---

__Example 1:__
```
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6
```

__Example 2:__
```
Input: lists = []
Output: []
```

__Example 3:__
```
Input: lists = [[]]
Output: []
```

__Constraints:__

- ```k == lists.length```
- 0 <= ```k``` <= 10<sup>4</sup>
- ```0 <= lists[i].length <= 500```
- -10<sup>4</sup> <= ```lists[i][j]``` <= 10<sup>4</sup>
- ```lists[i]``` is sorted in __ascending order__.
- The sum of ```lists[i].length``` will not exceed 10<sup>4</sup>.

---

### Brute Force (Stack & Sort)

- __Time Complexity__: ```O(Nlog⁡N)``` where ```N``` is the total number of nodes.
- __Space Complexity__: ```O(N)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        nodes = list()
        sentinel = head = ListNode(0)
        for ll in lists:
            while ll:
                nodes.append(ll.val)
                ll = ll.next
        
        nodes.sort()
        for node in nodes:
            head.next = ListNode(node)
            head = head.next
        
        return sentinel.next
```

### Priority Queue (Heap)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        head = curr = ListNode(0)
        queue = list()
        for ll in lists:
            while ll:
                heapq.heappush(queue, ll.val)
                ll = ll.next
        
        while queue:
            node = heapq.heappop(queue)
            curr.next = ListNode(node)
            curr = curr.next
        
        return head.next
```

```Python

```
