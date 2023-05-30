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

![image](https://github.com/quananhle/Python/assets/35042430/bba2da38-8a26-4cdc-a28b-7cc4be45d720)

![image](https://github.com/quananhle/Python/assets/35042430/ddcf16f7-e8e9-4863-ac97-adb74c9433e0)

```Python
class TreeNode:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None


class BSTree:
    def __init__(self):
        self.root = None


    def search(self, root: TreeNode, val: int) -> TreeNode:
        if not root or val == root.val:
            return root
        
        return self.search(root.left, val) if val < root.val else self.search(root.right, val)


    def insert(self, root: TreeNode, val: int) -> TreeNode:
        if not root:
            return TreeNode(val)
        
        if val < root.val:
            root.left = self.insert(root.left, val)
        elif val == root.val:
            return root
        else:
            root.right = self.insert(root.right, val)
        
        return root


    def successor(self, root):
        root = root.right
        while root.left:
            root = root.left
        return root.val


    def predecessor(self, root):
        root = root.left
        while root.right:
            root = root.right
        return root.val


    def delete(self, root: TreeNode, key: int) -> TreeNode:
        if not root:
            return None
        
        if key < root.val:
            root.left = self.delete(root.left, key)
        elif key > root.val:
            root.right = self.delete(root.right, key)
        else:
            if not (root.left or root.right):
                root = None
            elif root.right:
                root.val = self.successor(root)
                root.right = self.delete(root.right, root.val)
            else:
                root.val = self.predecessor(root)
                root.left = self.delete(root.left, root.val)
        
        return root


class Tree:
    def __init__(self):
        self.tree = BSTree()
    
    
    def insert(self, val):
        self.tree.root = self.tree.insert(self.tree.root, val)
    
    
    def delete(self, val):
        self.tree.root = self.tree.delete(self.tree.root, val)

    
    def existed(self, val):
        return (self.tree.search(self.tree.root, val) is not None)


class MyHashSet:

    def __init__(self):
        self.key_range = 769
        self.bucket = [Tree() for _ in range(self.key_range)]
        

    def hash(self, key) -> int:
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
