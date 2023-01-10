## 133. Clone Graph

```Tag```: ```Hash Table``` ```Depth-First Search``` ```Breadth-First Search``` ```Graph```

#### Difficulty: Medium

Given a reference of a node in a connected undirected graph.

Return a deep copy (clone) of the graph.

Each node in the graph contains a value (```int```) and a list (```List[Node]```) of its neighbors.

```
class Node {
    public int val;
    public List<Node> neighbors;
}
```

__Test case format:__

For simplicity, each node's value is the same as the node's index (1-indexed). For example, the first node with ```val == 1```, the second node with ```val == 2```, and so on. The graph is represented in the test case using an adjacency list.

An __adjacency list__ is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.

The given node will always be the first node with ```val = 1```. You must return the copy of the given node as a reference to the cloned graph.

![image](https://user-images.githubusercontent.com/35042430/209166896-3ffb9763-571c-4efd-a5c1-c97bfd760cc8.png)

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/11/04/133_clone_graph_question.png)
```
Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
```
__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/01/07/graph.png)
```
Input: adjList = [[]]
Output: [[]]
Explanation: Note that the input contains one empty list. The graph consists of only one node with val = 1 and it does not have any neighbors.
```
__Example 3:__
```
Input: adjList = []
Output: []
Explanation: This an empty graph, it does not have any nodes.
```

__Constraints:__
```
The number of nodes in the graph is in the range [0, 100].
1 <= Node.val <= 100
Node.val is unique for each node.
There are no repeated edges and no self-loops in the graph.
The Graph is connected and all nodes can be visited starting from the given node.
```

---

### Depth-First Search

![image](https://leetcode.com/problems/clone-graph/solutions/421214/Figures/133/133_Clone_Graph_3.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""

class Solution:
    def __init__(self):
        self.visited = {}

    def cloneGraph(self, node: 'Node') -> 'Node':
        # Depth-First Search
        #### Time Complexity: O(N+M), where N is a number of nodes (vertices) and M is a number of edges
        #### Space Complexity: O(N), extra space required to build hash map visited
        if not node:
            return node
        # Check if the node was already visited before
        if node in self.visited:
            # Return the clone from the visited dictionary
            return self.visited[node]

        # Create a clone for the given node.
        clone_node = Node(node.val)

        # Add the current node to visited
        self.visited[node] = clone_node

        # Iterate through the neighbors to generate their clones
        if node.neighbors:
            # Prepare a list of cloned neighbors to be added to the cloned node.                    
            clone_node.neighbors = [self.cloneGraph(node) for node in node.neighbors]

        return clone_node
```

### Breadth-First Search

![image](https://leetcode.com/problems/clone-graph/solutions/421214/Figures/133/133_Clone_Graph_4.png)

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""

class Solution:
    def __init__(self):
        self.visited = {}

    def cloneGraph(self, node: 'Node') -> 'Node':
        # Breadth-First Search
        #### Time Complexity: O(N+M), where N is a number of nodes (vertices) and M is a number of edges
        #### Space Complexity: O(N), extra space required to build hash map visited
        if not node:
            return node
        
        visited = dict()

        # Put the first node into the queue
        queue = collections.deque([node])

        # Clone the node and mark as visited
        visited[node] = Node(node.val)

        # Start BFS traversal
        while queue:
            # Pop a node starting from the front of the queue
            n = queue.popleft()
            # Iterate through all the neighbors of the node
            for neighbor in n.neighbors:
                if not neighbor in visited:
                    # Clone the neighbor and mark as visited
                    visited[neighbor] = Node(neighbor.val)
                    # Extend the queue with newly encountered node
                    queue.append(neighbor)
                # Add clone of neighbor to neighbors of the clone node
                visited[n].neighbors.append(visited[neighbor])
        
        return visited[node]
```

```Python
"""
# Definition for a Node.
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""

class Solution:
    def cloneGraph(self, node: 'Node') -> 'Node':
        old_to_new = dict()

        def cloning(node):
            if node in old_to_new:
                return old_to_new[node] 

            copy = Node(node.val)
            old_to_new[node] = copy
            for neighbor in node.neighbors:
                copy.neighbors.append(cloning(neighbor))
            return copy

        return cloning(node) if node else None
        
```
