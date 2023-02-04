## 24. Swap Nodes in Pairs

```Tag```: ```Recursion``` ```Linked List```

#### Difficulty: Medium

Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

![image](https://user-images.githubusercontent.com/35042430/216754297-5a60e8c5-393d-4955-b161-c8ce5259998e.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/03/swap_ex1.jpg)
```
Input: head = [1,2,3,4]
Output: [2,1,4,3]
```

__Example 2:__
```
Input: head = []
Output: []
```

__Example 3:__
```
Input: head = [1]
Output: [1]
```

__Constraints:__

- The number of nodes in the list is in the range ```[0, 100]```.
- ```0 <= Node.val <= 100```

---

### Recursion

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_0.png)

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_1.png)

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_2.png)

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_4.png)

__Time Complexity__: ```O(N)``` where ```N``` is the size of the linked list.

__Space Complexity__: ```O(N)``` stack space utilized for recursion.

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:
        #  Recursive Approach
        if not head:
            return head
            
        def helper(node):
            if not node or not node.next:
                return node
            first, second = node, node.next
            first.next = helper(node.next.next)
            second.next = first
            return second

        return helper(head)
```

### Iterative Approach

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_5.png)

#### Algorithm

1. We iterate the linked list with jumps in steps of two.

2. Swap the pair of nodes as we go, before we jump to the next pair. Let's represent the two nodes to be swapped by ```firstNode``` and ```secondNode```.

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_6.png)

3. Swap the two nodes. The swap step is
```
   firstNode.next = secondNode.next
   secondNode.next = firstNode
```

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_7.png)

4. We also need to assign the ```prevNode```'s next to the head of the swapped pair. This step would ensure the currently swapped pair is linked correctly to the end of the previously swapped list.
```
   prevNode.next = secondNode
```

![image](https://leetcode.com/problems/swap-nodes-in-pairs/solutions/441911/Figures/24/24_Swap_Nodes_8.png)

This is an iterative step, so the nodes are swapped on the go and attached to the previously swapped list. And in the end we get the final swapped list.

__Time Complexity__: ```O(N)``` where ```N``` is the size of the linked list.

__Space Complexity__: ```O(1)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # Iterative Approach
        if not head:
            return head

        stack = [head]
        dummy = prev = ListNode(val=-1, next=head)

        while head and head.next:
            first, second = head, head.next

            prev.next = second
            first.next = second.next
            second.next = first

            prev = first
            head = first.next

        return dummy.next
```
