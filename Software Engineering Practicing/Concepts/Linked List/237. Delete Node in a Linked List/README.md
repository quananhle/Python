## 237. Delete Node in a Linked List

```Tag```: ```Linked List```

#### Difficulty: Medium

There is a singly-linked list ```head``` and we want to delete a node ```node``` in it.

You are given the node to be deleted ```node```. You will not be given access to the first node of ```head```.

All the values of the linked list are unique, and it is guaranteed that the given node ```node``` is not the last node in the linked list.

Delete the given node. Note that by deleting the node, we do not mean removing it from memory. We mean:

- The value of the given node should not exist in the linked list.
- The number of nodes in the linked list should decrease by one.
- All the values before ```node``` should be in the same order.
- All the values after ```node``` should be in the same order.

__Custom testing:__

- For the input, you should provide the entire linked list ```head``` and the node to be given ```node```. ```node``` should not be the last node of the list and should be an actual node in the list.
- We will build the linked list and pass the node to your function.
- The output will be the entire list after calling your function.

![image](https://user-images.githubusercontent.com/35042430/211142206-84659b7e-9961-4db2-adb3-24694e759c04.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/01/node1.jpg)
```
Input: head = [4,5,1,9], node = 5
Output: [4,1,9]
Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/01/node2.jpg)
```
Input: head = [4,5,1,9], node = 1
Output: [4,5,9]
Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
```

__Constraints:__
```
The number of the nodes in the given list is in the range [2, 1000].
-1000 <= Node.val <= 1000
The value of each node in the list is unique.
The node to be deleted is in the list and is not a tail node.
```

---

1. Initial Linked List

![image](https://leetcode.com/problems/delete-node-in-a-linked-list/solutions/2506192/Figures/237/Initially.png)

2. Update current node with next node details

![image](https://leetcode.com/problems/delete-node-in-a-linked-list/solutions/2506192/Figures/237/updateValue.png)

3. Update current node next pointer with next node next pointer

![image](https://leetcode.com/problems/delete-node-in-a-linked-list/solutions/2506192/Figures/237/updatePointer.png)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def deleteNode(self, node):
        """
        :type node: ListNode
        :rtype: void Do not return anything, modify node in-place instead.
        """
        #### Time Complexity: O(1)
        #### Space Complexity: O(1)
        next_node = node.next
        node.val = next_node.val
        node.next = next_node.next

        next_node.next = None
        del(next_node)
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def deleteNode(self, node):
        """
        :type node: ListNode
        :rtype: void Do not return anything, modify node in-place instead.
        """
        #### Time Complexity: O(1)
        #### Space Complexity: O(1)
        node.val = node.next.val
        node.next = node.next.next
```
