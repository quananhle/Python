## 203. Remove Linked List Elements

```Tag```: ```Two Pointers``` ```Linked List```

#### Difficulty: Easy

Given the ```head``` of a linked list and an integer ```val```, remove all the nodes of the linked list that has ```Node.val``` == val, and return _the new head_.

![image](https://user-images.githubusercontent.com/35042430/210450709-d1b616f7-0cb0-47f3-9b47-4989f2fd9506.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/06/removelinked-list.jpg)
```
Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/06/removelinked-list.jpg)
```
Input: head = [], val = 1
Output: []
```

__Example 3:__
```
Input: head = [7,7,7,7], val = 7
Output: []
```

__Constraints:__
```
The number of nodes in the list is in the range [0, 104].
1 <= Node.val <= 50
0 <= val <= 50
```

---

### Two Pointers

If node to be deleted is in the middle of linked list,

- Pick the node-predecessor ```prev``` of the node to delete.

- Set its next pointer to point to the node next to the one to delete.

```Python
prev.next = prev.next.next
```

![image](https://leetcode.com/problems/remove-linked-list-elements/solutions/391977/Figures/203/middle2.png)

When the node or nodes to delete are in the head of linked list, need a new head or sentinel node to point to the head of the linked list before deleting the node or the nodes in the head

![image](https://leetcode.com/problems/remove-linked-list-elements/solutions/391977/Figures/203/head_delete.png)

Their main purpose of the sentinel node is to standardize the situation, for example, make linked list to be never empty and never headless and hence simplify insert and delete.

![image](https://leetcode.com/problems/remove-linked-list-elements/solutions/391977/Figures/203/to_delete2.png)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        # sentinel node as pseudo-head
        sentinel = ListNode(0)
        sentinel.next = head
        # Initialize the prev and curr nodes
        prev, curr = sentinel, head
        while curr:
            # If found the node to delete
            if curr.val == val:
                prev.next = prev.next.next
            else:
                prev = curr
            curr = curr.next
        return sentinel.next
```
