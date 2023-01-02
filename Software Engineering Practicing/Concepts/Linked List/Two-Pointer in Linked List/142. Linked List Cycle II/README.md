## 142. Linked List Cycle II

```Tag```: ```Hash Set``` ```Math```

#### Difficulty: Medium

Given the ```head``` of a linked list, return _the node where the cycle begins. If there is no cycle, return ```null```_.

![image](https://user-images.githubusercontent.com/35042430/210283133-57767f64-e80a-4ccf-a7ef-613d1465721b.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)
```
Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)
```
Input: head = [1,2], pos = 0
Output: tail connects to node index 0
Explanation: There is a cycle in the linked list, where tail connects to the first node.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)
```
Input: head = [1], pos = -1
Output: no cycle
Explanation: There is no cycle in the linked list.
```

__Constraints:__
```
The number of the nodes in the list is in the range [0, 104].
-105 <= Node.val <= 105
pos is -1 or a valid index in the linked-list.
```

---

### Hash Set

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def detectCycle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        visited = set()
        curr = head
        while curr:
            if curr in visited:
                return curr
            visited.add(curr)
            curr = curr.next
        return None
```

### Floyd's Tortoise and Hare

![image](https://user-images.githubusercontent.com/35042430/210283411-1e8b3484-9b54-41ca-b6dd-f788fe2b4055.png)
![image](https://user-images.githubusercontent.com/35042430/210283424-82430abb-0a84-4636-b9ed-0d9e603f708e.png)
![image](https://user-images.githubusercontent.com/35042430/210283436-a31da7e3-e4e8-41af-96a1-da40e28b6e81.png)

```Python

```
