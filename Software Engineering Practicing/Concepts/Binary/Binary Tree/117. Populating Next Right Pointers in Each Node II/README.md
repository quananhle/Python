## 117. Populating Next Right Pointers in Each Node II

```Tag```: ```Breadth-First Search``` ```Binary Tree```

#### Difficulty: Medium

You are given a __perfect binary tree__ where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

```C++
struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
```

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to ```NULL```.

Initially, all next pointers are set to ```NULL```.

![image](https://user-images.githubusercontent.com/35042430/215168938-0c17de55-37d9-4ed9-9bea-37053fc9ef0a.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/02/14/116_sample.png)
```
Input: root = [1,2,3,4,5,6,7]
Output: [1,#,2,3,#,4,5,6,7,#]
Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
```

__Example 2:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 6000]```.
- ```-100 <= Node.val <= 100```
 
__Follow-up:__

- You may only use constant extra space.
- The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.

---

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img1.png)

### Level Order Traversal

#### Breadth-First Search

#### Left-to-Right

__Algorithm__

1. Initialize a queue ```queue``` which we will be making use of during our traversal. There are multiple ways to implement the level order traversal especially when it comes to identifying the level of a particular node.

    a. We can add a pair of _(node,level)_ to the queue and whenever we add the children of a node, we add _(node.left, parent_level+1)_ and _(node.right, parent_level+1)_. This approach wouldn't be very efficient for our algorithm since we need all the nodes on the same level and we would need another data structure just for that.

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img2.png)

    b. A more memory efficient way of segregating the same level nodes is to use some demarcation between the levels. Usually, we insert a ```NULL``` entry in the queue which marks the end of the previous level and the start of the next level. This is a great approach but again, it would still consume some memory proportional to the number of levels in the tree.

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img3.png)

    c. The approach we will be using here would have a nested loop structure to get around the requirement of a ```NULL``` pointer. Essentially, at each step, we record the size of the queue and that always corresponds to all the nodes on a particular level. Once we have this ```size```, we only process these many elements and no more. By the time we are done processing size number of elements, the queue would contain all the nodes on the next level. Here's a pseudocode for the same:

```Pseudo
 while (!Q.empty())
 {
     size = Q.size()
     for i in range 0..size
     {
         node = Q.pop()
         Q.push(node.left)
         Q.push(node.right)
     }
 }
 ```
 
2. We start off by adding the root of the tree in the queue. Since there is just one node on the level 0, we don't need to establish any connections and can move onto the while loop.

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img4.png)

3. The first while loop from the pseudocode above essentially iterates over each level one by one and the inner for loop iterates over all the nodes on the particular level. Since we have access to all the nodes on the same level, we can establish the next pointers easily.

4. When we pop a node inside the for loop from the pseudocode above, we add its children at the back of the queue. Also, the element at the head of the queue is the ```next``` element in order, on the current level. So, we can easily establish the new pointers.

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img5.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next
"""

class Solution:
    def connect(self, root: 'Optional[Node]') -> 'Optional[Node]':
        # Breadth-First Search
        #### Time Complexity: O(N), visit every node in the tree only once
        #### Space Complexity: O(N), extra memory space for the queue
        if not root:
            return root
        
        queue = collections.deque([root])

        # Iterate over each level
        while queue:
            # Get level of the tree based on its size
            size = len(queue)
            # Iterate over every node on the current level
            for i in range(size):
                # Pop the node top-down
                node = queue.popleft()
                # Ensure that the last node of the same level does not point to the node of the next level
                if i < size - 1:
                    # Establish next connection to the next right node
                    node.next = queue[0]
                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)
        
        return root
```

### Constant Space ```O(1)``` Using Previously Established Next Pointers

```Pseudo
 leftmost = root
 while (leftmost.left != null)
 {
     head = leftmost
     while (head != null)
     {
         1) Establish Connection 1
         2) Establish Connection 2 using next pointers
         head = head.next
     }
     leftmost = leftmost.left
 }
```

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img6.png)

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img8.png)

```Java
node.left.next = node.right
```

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img9.png)
 
```Java
node.right.next = node.next.left
```

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img7.png)

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img10.png)

![image](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/solutions/441904/Figures/116/img11.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next
"""

class Solution:
    def connect(self, root: 'Optional[Node]') -> 'Optional[Node]':
        # Breadth-First Search
        if not root:
            return root
        
        # Start with the root node. Next pointer of root node points to null
        left_most = root

        # Iterate every level of the tree
        while left_most.left:
            # Initialize a "linked-list" pointer to connect the next pointers
            head = left_most
            # Ensure to iteratete to the right most node
            while head:
                # Establish the next pointer from left child node to the right child node
                head.left.next = head.right
                # Check if head.next is pointing to a node
                if head.next:
                    head.right.next = head.next.left
                # Update the head pointer to the next node to the right of the same level
                head = head.next
            # Move on to the left child
            left_most = left_most.left

        return root
```
