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
