## 102. Binary Tree Level Order Traversal

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the level order traversal of its nodes' values_. (i.e., from left to right, level by level).

![image](https://user-images.githubusercontent.com/35042430/205716493-936130ac-7ba7-451f-af86-ab27ec488698.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
```

__Example 2:__

```
Input: root = [1]
Output: [[1]]
```

__Example 3:__

```
Input: root = []
Output: []
```

__Constraints:__
```
The number of nodes in the tree is in the range [0, 2000].
-1000 <= Node.val <= 1000
```

---

### How to traverse the tree

There are two general _strategies_ to traverse a tree:

- Depth First Search (```DFS```)

In this strategy, we adopt the depth as the priority, so that one would start from a ```root``` and reach all the way down to certain leaf, and then back to ```root``` to reach another branch.

The DFS strategy can further be distinguished as ```preorder```, ```inorder```, and ```postorder``` depending on the relative order among the root node, left node and right node.

- Breadth First Search (```BFS```)

We scan through the tree level by level, following the order of height, from top to bottom. The nodes on higher level would be visited before the ones with lower levels.

![image](https://leetcode.com/problems/binary-tree-level-order-traversal/Figures/145_transverse.png)

### Recursion

The simplest way to solve the problem is to use a recursion. Let's first ensure that the tree is not empty, and then call recursively the function ```helper(node, level)```, which takes the current node and its level as the arguments.

- The output list here is called ```levels```, and hence the current level is just a length of this list ```len(levels)```. Compare the number of a current level ```len(levels)``` with a node level ```level```. If you're still on the previous level - add the new one by adding a new list into ```levels```.

- Append the node value to the last list in ```levels```.

- Process recursively child nodes if they are not ```None``` : ```helper(node.left / node.right, level + 1)```.

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        # Recursion
        #### Time Complexity: O(N), traverse through the tree in linear time
        #### Space Complexity: O(N), space required to store all nodes for output
        levels = list()
        if not root:
            return levels
        def helper(node, level):
            # Start the current level
            if len(levels) == level:
                levels.append([])
            levels[level].append(node.val)
            # Check if there is a left node
            if node.left:
                helper(node.left, level+1)
            # Check if there is a right node
            if node.right:
                helper(node.right, level+1)
        helper(root, 0)
        return levels
```

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        # Recursion
        #### Time Complexity: O(N), traverse through the tree in linear time
        #### Space Complexity: O(N), space required to store all nodes for output
        levels = list()
        if not root:
            return levels
        def helper(node, level):
            if node:
                # Start the current level
                if len(levels) == level:
                    levels.append([])
                levels[level].append(node.val)
                # Check if there is a left node
                helper(node.left, level+1)
                # Check if there is a right node
                helper(node.right, level+1)
        helper(root, 0)
        return levels
```

### Iteration

The zero level contains only one node ```root```. The algorithm is simple :

- Initiate queue with a ```root``` and start from the level number ```0``` : ```level = 0```.

- While queue is not empty :

    - Start the current level by adding an empty list into output structure ```levels```.

    - Compute how many elements should be on the current level : it's a queue length.

    - Pop out all these elements from the queue and add them into the current level.

     - Push their child nodes into the queue for the next level.

    - Go to the next level ```level++```.

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        # Iteration
        #### Time Complexity: O(N), traverse through the tree in linear time
        #### Space Complexity: O(N), space required to store all nodes for output
        levels = list()
        if not root:
            return levels
        queue = [(root, 0)]
        while queue:
            # FIFO/Deque
            curr_node, level = queue.pop(0)
            if len(levels) == level:
                levels.append([])
            levels[level].append(curr_node.val)
            # Check if there is a left node
            if curr_node.left:
                queue.append((curr_node.left, level+1))
            # Check if there is a right node
            if curr_node.right:
                queue.append((curr_node.right, level+1))
        return levels
```

```Python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        levels = list()
        if not root:
            return levels
        level = 0
        queue = deque([root])
        while queue:
            # Start the current level
            levels.append([])
            for i in range(len(queue)):
                # FIFO/Deque                
                node = queue.popleft()
                levels[level].append(node.val)
                # Check if there is a left node                
                if node.left:
                    queue.append(node.left)
                # Check if there is a right node                    
                if node.right:
                    queue.append(node.right)        
            level += 1
        return levels
```
        


