## 707. Design Linked List

```Tag```: ```Singly Linked List``` ```Doubly Linked List```

#### Difficulty: Medium

Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
A node in a singly linked list should have two attributes: ```val``` and ```next```. ```val``` is the value of the current node, and ```next``` is a pointer/reference to the next node.
If you want to use the doubly linked list, you will need one more attribute ```prev``` to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

Implement the ```MyLinkedList``` class:

- ```MyLinkedList()``` Initializes the ```MyLinkedList``` object.
- ```int get(int index)``` Get the value of the index<sup>th</sup> node in the linked list. If the index is invalid, return ```-1```.
- ```void addAtHead(int val)``` Add a node of value ```val``` before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
- ```void addAtTail(int val)``` Append a node of value ```val``` as the last element of the linked list.
- ```void addAtIndex(int index, int val)``` Add a node of value ```val``` before the index<sup>th</sup> node in the linked list. If ```index``` equals the length of the linked list, the node will be appended to the end of the linked list. If ```index``` is greater than the length, the node __will not be inserted__.
- ```void deleteAtIndex(int index)``` Delete the index<sup>th</sup> node in the linked list, if the index is valid.
 
![image](https://user-images.githubusercontent.com/35042430/210198540-827fa2b9-44a5-4585-866e-a74d4115c734.png)

---

__Example 1:__
```
Input
["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
[[], [1], [3], [1, 2], [1], [1], [1]]
Output
[null, null, null, null, 2, null, 3]

Explanation
MyLinkedList myLinkedList = new MyLinkedList();
myLinkedList.addAtHead(1);
myLinkedList.addAtTail(3);
myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
myLinkedList.get(1);              // return 2
myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
myLinkedList.get(1);              // return 3
```

__Constraints:__
```
0 <= index, val <= 1000
Please do not use the built-in LinkedList library.
At most 2000 calls will be made to get, addAtHead, addAtTail, addAtIndex and deleteAtIndex.
```

---

### Singly Linked List

![image](https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/singly4.png)
```Python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
class MyLinkedList:
    def __init__(self):
        self.size = 0
        self.head = ListNode(0)  # sentinel node as pseudo-head
```
![image](https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/singly_insert.png)
![image](https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/singly_insert_head.png)
```Python
to_add.next = pred.next
pred.next = to_add
```
![image](https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/singly_delete.png)
```Python
# delete pred.next 
pred.next = pred.next.next
```
![image](https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/singly_get.png)
```Python
# index steps needed 
# to move from sentinel node to wanted index
for _ in range(index + 1):
    curr = curr.next
return curr.val
```

```Python
class ListNode:
    def __init__(self, val):
        self.val = val
        self.next = None

class MyLinkedList:

    def __init__(self):
        self.size = 0
        self.head = ListNode(0)     # sentinel node as pseudo-head

    def get(self, index: int) -> int:
        if index < 0 or index >= self.size:
            return -1
        curr = self.head
        while index >= 0:
            curr = curr.next
            index -= 1
        return curr.val
        
    def addAtHead(self, val: int) -> None:
        self.addAtIndex(0, val)
        
    def addAtTail(self, val: int) -> None:
        self.addAtIndex(self.size, val)
                
    #  Add a node of value val before the indexeth node in the linked lis
    def addAtIndex(self, index: int, val: int) -> None:
        if index > self.size:
            return
        self.size += 1
        self.node = ListNode(val)
        prev = self.head
        while index:
            prev = prev.next
            index -= 1
        self.node.next = prev.next
        prev.next = self.node


    def deleteAtIndex(self, index: int) -> None:
        if index >= self.size or index < 0:
            return
        self.size -= 1
        curr = self.head
        prev = self.head
        for _ in range(index + 1):
            curr = curr.next
        for _ in range(index) :
            prev = prev.next
        prev.next = curr.next
        
# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList()
# param_1 = obj.get(index)
# obj.addAtHead(val)
# obj.addAtTail(val)
# obj.addAtIndex(index,val)
# obj.deleteAtIndex(index)
```

### Doubly Linked List

https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/dll.png
```Python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
        self.prev = None
        
class MyLinkedList:
    def __init__(self):
        self.size = 0
        # sentinel nodes as pseudo-head and pseudo-tail
        self.head, self.tail = ListNode(0), ListNode(0) 
        self.head.next = self.tail
        self.tail.prev = self.head
```
https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/dll_get2.png
```Python
to_add.prev = pred
to_add.next = succ
pred.next = to_add
succ.prev = to_add
```
https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/dll_insert2.png
```Python
pred.next = succ
succ.prev = pred
```
https://leetcode.com/problems/design-linked-list/solutions/398730/Figures/707/dll_delete2.png
```Python
# choose the fastest way: to move from the head
# or to move from the tail
if index + 1 < self.size - index:
    curr = self.head
    for _ in range(index + 1):
        curr = curr.next
else:
    curr = self.tail
    for _ in range(self.size - index):
        curr = curr.prev
```

```Python
class ListNode:
    def __init__(self, val):
        self.val = val
        self.next = None
        self.prev = None

class MyLinkedList:

    def __init__(self):
        self.size = 0
        self.head = ListNode(0)     # sentinel node as pseudo-head
        self.tail = ListNode(0)     # sentinel node as pseudo-tail
        self.head.next = self.tail
        self.tail.prev = self.head

    def get(self, index: int) -> int:
        if index < 0 or index >= self.size:
            return -1
        # Choose the fastest route: from the head or from the tail
        # Check if index is the first half of the linked list
        if index + 1 < self.size - index:
            curr = self.head
            # Traverse to the current index from the sentinel node
            for _ in range(index + 1):
                curr = curr.next
        # Index is in the latter half of the linked list
        else:
            curr = self.tail
            for _ in range(self.size - index):
                curr = curr.prev
        return curr.val
        
    def addAtHead(self, val: int) -> None:
        pred, succ = self.head, self.head.next
        self.size += 1
        to_add = ListNode(val)
        to_add.prev = pred
        to_add.next = succ
        pred.next = to_add
        succ.prev = to_add
        
    def addAtTail(self, val: int) -> None:
        succ, pred = self.tail, self.tail.prev
        self.size += 1
        to_add = ListNode(val)
        to_add.prev = pred
        to_add.next = succ
        pred.next = to_add
        succ.prev = to_add


    #  Add a node of value val before the indexeth node in the linked lis
    def addAtIndex(self, index: int, val: int) -> None:
        if index > self.size:
            return

        # Choose the fastest route: from the head or from the tail
        # Check if index is the first half of the linked list
        if index < self.size - index:
            pred = self.head
            # Traverse to the node before the index
            for _ in range(index):
                pred = pred.next
            succ = pred.next
        # Index is in the latter half of the linked list        
        else:
            succ = self.tail
            for _ in range(self.size - index):
                succ = succ.prev
            pred = succ.prev

        self.size += 1
        to_add = ListNode(val)
        to_add.next = succ
        to_add.prev = pred
        succ.prev = to_add
        pred.next = to_add

    def deleteAtIndex(self, index: int) -> None:
        if index >= self.size or index < 0:
            return
        # Choose the fastest route: from the head or from the tail
        # Check if index is the first half of the linked list
        if index < self.size - index:
            pred = self.head
            # Traverse to the node before the index
            for _ in range(index):
                pred = pred.next
            succ = pred.next.next
        # Index is in the latter half of the linked list        
        else:
            succ = self.tail
            for _ in range(self.size - index - 1):
                succ = succ.prev
            pred = succ.prev.prev

        self.size -= 1

        succ.prev = pred
        pred.next = succ

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList()
# param_1 = obj.get(index)
# obj.addAtHead(val)
# obj.addAtTail(val)
# obj.addAtIndex(index,val)
# obj.deleteAtIndex(index)
```
