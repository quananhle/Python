## [138. Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer)

```Tag```: ```Linked List``` ```Hash Table```

#### Difficulty: Medium

A linked list of length ```n``` is given such that each node contains an additional random pointer, which could point to any node in the list, or ```null```.

Construct a deep copy of the list. The deep copy should consist of exactly ```n``` __brand new__ nodes, where each new node has its value set to the value of its corresponding original node. Both the ```next``` and ```random``` pointers of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. __None of the pointers in the new list should point to nodes in the original list__.

For example, if there are two nodes ```X``` and ```Y``` in the original list, where ```X.random --> Y```, then for the corresponding two nodes ```x``` and ```y``` in the copied list, ```x.random --> y```.

Return _the head of the copied linked list_.

The linked list is represented in the input/output as a list of ```n``` nodes. Each node is represented as a pair of ```[val, random_index]``` where:

- ```val```: an integer representing ```Node.val```
- ```random_index```: the index of the node (range from ```0``` to ```n-1```) that the ```random``` pointer points to, or ```null``` if it does not point to any node.
- 
Your code will only be given the ```head``` of the original linked list.

![image](https://user-images.githubusercontent.com/35042430/211053722-da621a7e-1998-4772-89d6-179efffac75a.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/12/18/e1.png)
```
Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/12/18/e2.png)
```
Input: head = [[1,1],[2,1]]
Output: [[1,1],[2,1]]
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2019/12/18/e3.png)
```
Input: head = [[3,null],[3,0],[3,null]]
Output: [[3,null],[3,0],[3,null]]
```

__Constraints:__
```
0 <= n <= 1000
-104 <= Node.val <= 104
Node.random is null or is pointing to some node in the linked list.
```

---

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_1.png)

### Recursive

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution:
    # Recursive
    #### Time Complexity: O(N), where N is the number of nodes in the linked list.
    #### Space Complexity: O(N), extra memory space to keep up the recursion stack and the visited dictionary
    def __init__(self):
        self.visited = dict()
    
    def copyRandomList(self, head: 'Optional[Node]') -> 'Optional[Node]':
        if not head:
            return None
        
        if head in self.visited:
            return self.visited[head]
        
        node = Node(head.val, None, None)

        self.visited[head] = node

        node.next = self.copyRandomList(head.next)
        node.random = self.copyRandomList(head.random)

        return node
```

### Iterative

1. Traverse the linked list starting at ```head``` of the linked list.

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_3.png)

2. Random pointer

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_4.png)

3. Next pointer

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_5.png)

4. Repeat step 2 & step 3

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_6.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution:
    def __init__(self):
        self.visited = dict()

    def get_cloned_node(self, node):
        if node:
            if node in self.visited:
                return self.visited[node]
            else:
                self.visited[node] = Node(node.val, None, None)
                return self.visited[node]
        return None

    def copyRandomList(self, head: 'Optional[Node]') -> 'Optional[Node]':
        # Iterative
        #### Time Complexity: O(N), where N is the number of nodes in the linked list.
        #### Space Complexity: O(N), extra memory space to keep up the recursion stack and the visited dictionary
        if not head:
            return head
        old_node = head
        new_node = Node(old_node.val, None, None)
        self.visited[old_node] = new_node

        while old_node:
            new_node.random = self.get_cloned_node(old_node.random)
            new_node.next = self.get_cloned_node(old_node.next)
            old_node = old_node.next
            new_node = new_node.next
        return self.visited[head]
```

### Iterative with Optimized Space Usage

1. Traverse the original list and clone the nodes as you go and place the cloned copy next to its original node. This new linked list is essentially a interweaving of original and cloned nodes.

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_8_1.png)
![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_8_2.png)

2. Iterate the list having both the new and old nodes intertwined with each other and use the original nodes' random pointers to assign references to random pointers for cloned nodes.

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_9_1.png)

3. Now that the random pointers are assigned to the correct node, the next pointers need to be correctly assigned to unweave the current linked list and get back the original list and the cloned list.

![image](https://leetcode.com/problems/copy-list-with-random-pointer/solutions/169069/Figures/138/138_Copy_List_Random_10.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution:
    def copyRandomList(self, head: 'Optional[Node]') -> 'Optional[Node]':
        # Iterative
        #### Time Complexity: O(N), where N is the number of nodes in the linked list.
        #### Space Complexity: O(1), constant memory space for pointers
        if not head: 
            return head

        sentinel = head
        while sentinel:
            new_node = Node(sentinel.val, None, None)
            # Inserting the clone node next to the origianl node
            new_node.next = sentinel.next
            sentinel.next = new_node
            # Iterate the sentinel node
            sentinel = new_node.next
        sentinel = head
        while sentinel:
            # Use the original nodes random pointers to assign references to random pointers for cloned nodes
            if sentinel.random:
                sentinel.next.random = sentinel.random.next
            # Iterate the sentinel nodes
            sentinel = sentinel.next.next
        old_list = head
        new_list = head.next
        sentinel = head.next
        while old_list:
            # Return the original list
            old_list.next = old_list.next.next
            # Link the new nodes together
            if new_list.next:
                new_list.next = new_list.next.next
            # When no more node to link, point to null
            else:
                new_list.next = None
            # Iterate through the lists
            old_list = old_list.next
            new_list = new_list.next
        return sentinel
```
