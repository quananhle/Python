## [705. Design HashSet](https://leetcode.com/problems/design-hashset)

```Tag```: ```Design``` ```Linked List``` ```Binary Search Tree```

#### Difficulty: Easy

Design a ```HashSet``` without using any built-in hash table libraries.

Implement ```MyHashSet``` class:

- ```void add(key)``` Inserts the value ```key``` into the HashSet.
- ```bool contains(key)``` Returns whether the value ```key``` exists in the HashSet or not.
- ```void remove(key)``` Removes the value ```key``` in the ```HashSet```. If ```key``` does not exist in the ```HashSet```, do nothing.

![image](https://github.com/quananhle/Python/assets/35042430/cd58dd09-44cb-453a-82c4-1e9aea472642)

---

__Example 1:__
```
Input
["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
[[], [1], [2], [1], [3], [2], [2], [2], [2]]
Output
[null, null, null, true, false, null, true, null, false]

Explanation
MyHashSet myHashSet = new MyHashSet();
myHashSet.add(1);      // set = [1]
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(1); // return True
myHashSet.contains(3); // return False, (not found)
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(2); // return True
myHashSet.remove(2);   // set = [1]
myHashSet.contains(2); // return False, (already removed)
```

__Constraints:__

- ```0 <= key <= 10^6```
- At most $10^4$ calls will be made to ```add```, ```remove```, and ```contains```.

---

### Linked List

![image](https://github.com/quananhle/Python/assets/35042430/b56a7c2c-cf9b-4909-a8d5-8b2518c69fef)

![image](https://github.com/quananhle/Python/assets/35042430/f1146a59-0908-4190-b499-3bd1d43261bc)

```Python
class Node:
    def __init__(self, val, next=None):
        self.val = val
        self.next = next

class LinkedList():
    def __init__(self):
        self.head = Node(0)
    
    def insert(self, val):
        if not self.existed(val):
            new_node = Node(val, self.head.next)
            self.head.next = new_node
    
    def delete(self, val):
        prev = self.head
        curr = self.head.next
        while curr:
            if curr.val == val:
                prev.next = curr.next
                return
            prev = curr
            curr = curr.next
    
    def existed(self, val):
        curr = self.head.next
        while curr:
            if curr.val == val:
                return True
            curr = curr.next
        return False

class MyHashSet:

    def __init__(self):
        self.key_range = 769    # prime number and big enough to pass the test cases
        self.bucket = [LinkedList() for _ in range(self.key_range)]

    def hash(self, key):
        return key % self.key_range

    def add(self, key: int) -> None:
        index = self.hash(key)
        self.bucket[index].insert(key)

    def remove(self, key: int) -> None:
        index = self.hash(key)
        self.bucket[index].delete(key)        

    def contains(self, key: int) -> bool:
        index = self.hash(key)
        return self.bucket[index].existed(key)


# Your MyHashSet object will be instantiated and called as such:
# obj = MyHashSet()
# obj.add(key)
# obj.remove(key)
# param_3 = obj.contains(key)
```

### Binary Search Tree

```Python

```
