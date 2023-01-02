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

__Constraints:__
```
0 <= index, val <= 1000
Please do not use the built-in LinkedList library.
At most 2000 calls will be made to get, addAtHead, addAtTail, addAtIndex and deleteAtIndex.
```

---
