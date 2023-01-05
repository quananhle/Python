## 430. Flatten a Multilevel Doubly Linked List

```Tag```: ```Doubly Linked List``` ```Stack``` ```Depth-First Search``` ```Preorder DFS```

#### Difficulty: Medium

You are given a doubly linked list, which contains nodes that have a next pointer, a previous pointer, and an additional __child pointer__. This child pointer may or may not point to a separate doubly linked list, also containing these special nodes. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure as shown in the example below.

Given the ```head``` of the first level of the list, ```flatten``` the list so that all the nodes appear in a single-level, doubly linked list. Let ```curr``` be a node with a child list. The nodes in the child list should appear __after__ ```curr``` and before ```curr.next``` in the flattened list.

Return _the ```head``` of the flattened list. The nodes in the list must have all of their child pointers set to ```null```_.

![image](https://user-images.githubusercontent.com/35042430/210665736-916356f6-a344-4ba6-bdf2-d691a8370e33.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/11/09/flatten11.jpg)
```
Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
Output: [1,2,3,7,8,11,12,9,10,4,5,6]
Explanation: The multilevel linked list in the input is shown.
After flattening the multilevel linked list it becomes:
```
![image](https://assets.leetcode.com/uploads/2021/11/09/flatten12.jpg)

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/11/09/flatten21.jpg)
```
Input: head = [1,2,null,3]
Output: [1,3,2]
Explanation: The multilevel linked list in the input is shown.
After flattening the multilevel linked list it becomes:
```
![image](https://assets.leetcode.com/uploads/2021/11/24/list.jpg)

__Example 3:__
```
Input: head = []
Output: []
Explanation: There could be empty list in the input.
```

__Constraints:__
```
The number of Nodes will not exceed 1000.
1 <= Node.val <= 105
```

__How the multilevel linked list is represented in test cases:__

We use the multilevel linked list from Example 1 above:
```
 1---2---3---4---5---6--NULL
         |
         7---8---9---10--NULL
             |
             11--12--NULL
```
The serialization of each level is as follows:
```
[1,2,3,4,5,6,null]
[7,8,9,10,null]
[11,12,null]
```
To serialize all levels together, we will add nulls in each level to signify no node connects to the upper node of the previous level. The serialization becomes:
```
[1,    2,    3, 4, 5, 6, null]
             |
[null, null, 7,    8, 9, 10, null]
                   |
[            null, 11, 12, null]
```
Merging the serialization of each level and removing trailing nulls we obtain:
```
[1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
```

---

### Iterative Depth-First Search
#### Time Complexity: O(N), traverse through the entire length of the linked list
#### Space Complexity: O(N), extra memory space required to build stack up to the size of linked list

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val, prev, next, child):
        self.val = val
        self.prev = prev
        self.next = next
        self.child = child
"""

class Solution:
    def flatten(self, head: 'Optional[Node]') -> 'Optional[Node]':
        # Preorder Depth-First Search
        ### Iteration
        if not head:
            return
        
        pseudo_head = Node(0, None, head, None)
        prev_node = pseudo_head

        stack = list()
        stack.append(head)

        while stack:
            curr = stack.pop()
            prev_node.next = curr
            curr.prev = prev_node
            if curr.next:
                stack.append(curr.next)
            if curr.child:
                stack.append(curr.child)
                curr.child = None
            prev_node = curr
        
        pseudo_head.next.prev = None
        return pseudo_head.next
```

### Recursive Depth-First Search

```Python

```
