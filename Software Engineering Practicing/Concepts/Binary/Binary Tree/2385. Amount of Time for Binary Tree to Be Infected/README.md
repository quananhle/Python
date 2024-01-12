## [2385. Amount of Time for Binary Tree to Be Infected](https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected)

```Tag```: ```Binary Tree``` ```Breadth-First Search``` ```Graph``` ```Depth-First Search```

#### Difficulty: Medium

You are given the ```root``` of a binary tree with unique values, and an integer ```start```. At minute ```0```, an infection starts from the node with value ```start```.

Each minute, a node becomes infected if:

- The node is currently uninfected.
- The node is adjacent to an infected node.

Return _the number of minutes needed for the entire tree to be infected_.

![image](https://github.com/quananhle/Python/assets/35042430/9696da78-9eef-4fcf-97f3-c0c76e78506f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/06/25/image-20220625231744-1.png)
```
Input: root = [1,5,3,null,4,10,6,9,2], start = 3
Output: 4
Explanation: The following nodes are infected during:
- Minute 0: Node 3
- Minute 1: Nodes 1, 10 and 6
- Minute 2: Node 5
- Minute 3: Node 4
- Minute 4: Nodes 9 and 2
It takes 4 minutes for the whole tree to be infected so we return 4.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/06/25/image-20220625231812-2.png)
```
Input: root = [1], start = 1
Output: 0
Explanation: At minute 0, the only node in the tree is infected so we return 0.
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^5]$.
- $1 \le Node.val \le 10^5$
- Each node has a unique value.
- A node with a value of ```start``` exists in the tree.

---

### Convert to Graph and Breadth-First Search

#### 1. Convert the binary tree to an undirected graph

A tree is a special kind of graph with a root and subtrees. We want to search the graph from any node, not just the root, and be able to traverse to all neighbors, including parents and children. An undirected graph is a set of vertices with edges that connect them. We will use a map to represent our graph, made up of integer vertices, and an adjacency list to record the edges.

We can define a function that converts our binary tree to an undirected graph by traversing the tree and creating a graph. The parameters are the current node and its parent. We traverse the tree with a preorder traversal, visiting first the root, then the left and right child, so we can log the parent of each node and make a connection to it. When we encounter a new right or left child, we add them to the adjacency list.

```Python
def convert(self, current: TreeNode, parent: int, tree_map: Dict[int, Set[int]]):
    if current is None:
        return
    if current.val not in tree_map:
        tree_map[current.val] = set()
    adjacent_list = tree_map[current.val]
    if parent != 0:
        adjacent_list.add(parent)
    if current.left:
        adjacent_list.add(current.left.val)
    if current.right:
        adjacent_list.add(current.right.val)
    self.convert(current.left, current.val, tree_map)
    self.convert(current.right, current.val, tree_map)
```

#### 2. Conduct a Breath First Search (BFS) to find the maximum distance between the start and other vertices.

We can find the maximum distance between the vertex with the value ```start``` and the rest of the vertices in our graph by using a BFS starting with the ```start```.

Standard Breadth-First Search

1. Add the first node to the queue
2. While the queue is not empty:
  - Remove the front node of the queue and mark it as visited.
  - Check whether all adjacent nodes have been visited. If they have not, add them to the queue

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class KeyValueMapping:
    def __init__(self):
        self.node = dict()

class Solution:
    def build_graph(self, curr: TreeNode, prev: TreeNode, tree_map: KeyValueMapping):
        if not curr:
            return
        
        if not curr.val in tree_map.node:
            tree_map.node[curr.val] = set()
        adjacent_list = tree_map.node[curr.val]

        if prev:
            adjacent_list.add(prev.val)
        if curr.left:
            adjacent_list.add(curr.left.val)
        if curr.right:
            adjacent_list.add(curr.right.val)

        self.build_graph(curr.left, curr, tree_map)
        self.build_graph(curr.right, curr, tree_map)


    def amountOfTime(self, root: Optional[TreeNode], start: int) -> int:
        tree_map = KeyValueMapping()
        self.build_graph(root, None, tree_map)

        # Start BFS
        queue = collections.deque([start])
        visited = set([start])
        minute = 0

        while queue:
            size = len(queue)
            while size:
                curr = queue.popleft()
                for next in tree_map.node[curr]:
                    if not next in visited:
                        visited.add(next)
                        queue.append(next)
                size -= 1
            
            minute += 1
        
        return minute - 1
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def tree_to_graph(self, node: TreeNode, parent: int, tree_map: Dict[int, Set[int]]):
        if not node:
            return
        
        if not node.val in tree_map:
            tree_map[node.val] = set()
        adjacent_graph = tree_map[node.val]

        if parent:
            adjacent_graph.add(parent)
        if node.left:
            adjacent_graph.add(node.left.val)
        if node.right:
            adjacent_graph.add(node.right.val)
        
        self.tree_to_graph(node.left, node.val, tree_map)
        self.tree_to_graph(node.right, node.val, tree_map)

    def amountOfTime(self, root: Optional[TreeNode], start: int) -> int:
        # Declare a hash map map to store vertices and their adjacency list for edges.
        '''
        tree_map = collections.defaultdict()
        '''
        tree_map: Dict[int, Set[int]] = {}
        self.tree_to_graph(root, None, tree_map)
        queue = collections.deque([start])
        minute = 0
        visited = {start}

        while queue:
            level = len(queue)
            for _ in range(level):
                curr = queue.popleft()
                for next in tree_map[curr]:
                    if not next in visited:
                        visited.add(next)
                        queue.append(next)
            minute += 1

        return minute - 1   
```

### Depth-First Search

![image](https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/Documents/2385/2385.drawio.svg)

__Algorithm__

1. Declare a variable ```max_distance``` to store maximum distance from the ```start``` node.
2. Define a function ```dfs``` that performs a depth-first search of the tree that returns ```depth``` and calculates and saves ```max_distance```.
    - For each call to ```dfs```, we have a new root and declare a variable ```depth = 0```.
    - If ```root == null```:
        -  Set ```depth = 0``` and return.
    - Recursively call ```dfs``` with ```root.left``` and save in the variable ```left_subtree```.
    - Recursively call ```dfs``` with ```root.right``` and save in the variable ```right_subtree```.
    - If ```root = start``` the root is the start node:
        - Set ```max_distance = max(left_subtree, right_subtree)``` to calcualte the start node's max depth.
        - Set ```depth = -1``` to signify this is the ```start``` node.
    - If the ```left_subtree``` and ```right_subtree``` are both greater than or equal to ```0```, the ```start``` node is not in this subtree:
        - Set ```depth = max(left_subtree, right_subtree) + 1``` to calculate the current root's max depth.
    - Else, the current root's subtree contains the ```start``` node:
        - Define a variable distance as the sum of ```abs(leftDepth)``` and ```abs(rightDepth)```, which is the distance of the furthest node in the other subtree.
        - Set ```max_distance = max(max_distance, distance)``` to update ```max_distance``` if ```distance``` is larger.
        - Set ```depth = min(left_subtree, right_subtree) - 1``` to calculate a negative number that signifies the subtree contains the start node and represents the distance of the ```start``` node from the root.
    - return ```depth```.
3. Call ```dfs(root, start)```.
4. Return ```max_distance```.

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def __init__(self):
        self.max_distance = 0

    def amountOfTime(self, root: Optional[TreeNode], start: int) -> int:
        def dfs(node):
            depth = 0
            if not node:
                return depth
            
            left_subtree = dfs(node.left)
            right_subtree = dfs(node.right)

            if node.val == start:
                self.max_distance = max(left_substree, right_subtree)
                depth -= 1
            elif left_subtree > 0 and right_subtree >= 0:
                depth = max(left_subtree, right_subtree) + 1
            else:
                distance = abs(left_subtree) + abs(right_subtree)
                self.max_distance = max(self.max_distance, distance)
                depth = min(left_subtree, right_subtree) - 1
            
            return depth
        
        dfs(root, start)
        return self.max_distance
```
