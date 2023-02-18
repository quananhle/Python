## 142. Linked List Cycle II

#### Difficulty: Medium

Given the ```head``` of a linked list, return _the node where the cycle begins. If there is no cycle, return ```null```_.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the ```next``` pointer. Internally, ```pos``` is used to denote the index of the node that tail's ```next``` pointer is connected to __(0-indexed)__. It is ```-1``` if there is no cycle. __Note that__ ```pos``` __is not passed as a parameter__.

__Do not modify__ the linked list.

<img width="408" alt="image" src="https://user-images.githubusercontent.com/35042430/205470132-330610ba-1b98-4a00-b58e-4f581033e6c6.png">

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

### HashSet

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # HashSet
        #### Time Complexity: O(N), traverse through the size of input linked-list
        #### Space Complexity: O(N), space required to build the hash set
        """
        visited = set()
        node = head
        while node:
            if node not in visited:
                visited.add(node)
                node = node.next
            else:
                return node
        return None
```

### HashMap

```Python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # HashMap
        #### Time Complexity: O(N), traverse through the size of input linked-list
        #### Space Complexity: O(N), space required to build the hash map
        visited = collections.defaultdict()
        node = head
        idx = 0
        while node:
            if node in visited:
                return node
            else:
                visited[node] = idx
            node = node.next
        else:
            return None
```
