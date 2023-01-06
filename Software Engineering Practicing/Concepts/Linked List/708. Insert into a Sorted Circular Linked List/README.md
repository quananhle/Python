## 708. Insert into a Sorted Circular Linked List

```Tag```: ```Linked List```

#### Difficulty: Medium

Given a Circular Linked List node, which is sorted in non-descending order, write a function to insert a value ```insertVal``` into the list such that it remains a sorted circular list. The given node can be a reference to any single node in the list and may not necessarily be the smallest value in the circular list.

If there are multiple suitable places for insertion, you may choose any place to insert the new value. After the insertion, the circular list should remain sorted.

If the list is empty (i.e., the given node is ```null```), you should create a new single circular list and return the reference to that single node. Otherwise, you should return the originally given node.

![image](https://user-images.githubusercontent.com/35042430/210931446-7d5efba2-b01b-41a6-bdcf-0aed7a4e711f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/01/19/example_1_before_65p.jpg)
```
Input: head = [3,4,1], insertVal = 2
Output: [3,4,1,2]
Explanation: In the figure above, there is a sorted circular list of three elements. You are given a reference to the node with value 3, and we need to insert 2 into the list. The new node should be inserted between node 1 and node 3. After the insertion, the list should look like this, and we should still return node 3.
```

![image](https://assets.leetcode.com/uploads/2019/01/19/example_1_after_65p.jpg)

__Example 2:__
```
Input: head = [], insertVal = 1
Output: [1]
Explanation: The list is empty (given head is null). We create a new single circular list and return the reference to that single node.
```

__Example 3:__
```
Input: head = [1], insertVal = 0
Output: [1,0]
```

__Constraints:__
```
The number of nodes in the list is in the range [0, 5 * 104].
-106 <= Node.val, insertVal <= 106
```

---

### Two Pointers

![image](https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/solutions/431630/Figures/708/708_two_pointers.png)

    Case 1). The value of new node sits between the minimal and maximal values of the current list. As a result, it should be inserted within the list.
    
   ![image](https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/solutions/431630/Figures/708/708_case_1.png)
   
    Case 2). The value of new node goes beyond the minimal and maximal values of the current list, either less than the minimal value or greater than the maximal value. In either case, the new node should be added right after the tail node (i.e. the node with the maximal value of the list).
    
   ![image](https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/solutions/431630/Figures/708/708_case_2_1.png)
   ![image](https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/solutions/431630/Figures/708/708_case_2_2.png)
   
    Case 3). Finally, there is one case that does not fall into any of the above two cases. This is the case where the list contains uniform values.
    
   ![image](https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/solutions/431630/Figures/708/708_case_3.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val=None, next=None):
        self.val = val
        self.next = next
"""

class Solution:
    def insert(self, head: 'Optional[Node]', insertVal: int) -> 'Node':
        if not head:
            node = Node(insertVal)
            head = node
            head.next = node
            return node

        sentinel = head
        slow, fast = sentinel, sentinel
        prev, curr = sentinel, sentinel.next
        to_insert = False

        while True:
            if prev.val <= insertVal <= curr.val:
                to_insert = True
            elif prev.val > curr.val:
                if prev.val <= insertVal or insertVal <= curr.val:
                    to_insert = True
                
            if to_insert:
                prev.next = Node(insertVal, curr)
                return head
            
            prev, curr = curr, curr.next
            if prev == head:
                break
        
        prev.next = Node(insertVal, curr)
            
        return head
```
