## [802. Find Eventual Safe States](https://leetcode.com/problems/find-eventual-safe-states/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search``` ```Topological Sort``` ```Kahn's Algorithm```

#### Difficulty: Medium

There is a directed graph of ```n``` nodes with each node labeled from ```0``` to ```n - 1```. The graph is represented by a __0-indexed__ 2D integer array graph where ```graph[i]``` is an integer array of nodes adjacent to node ```i```, meaning there is an edge from node ```i``` to each node in ```graph[i]```.

A node is a terminal node if there are no outgoing edges. A node is a safe node if every possible path starting from that node leads to a terminal node (or another safe node).

Return _an array containing all the safe nodes of the graph_. The answer should be sorted in ascending order.

![image](https://github.com/quananhle/Python/assets/35042430/3a54c546-0755-4efc-841c-ebff74ec79f0)

---

__Example 1:__
```
Illustration of graph
Input: graph = [[1,2],[2,3],[5],[0],[5],[],[]]
Output: [2,4,5,6]
Explanation: The given graph is shown above.
Nodes 5 and 6 are terminal nodes as there are no outgoing edges from either of them.
Every path starting at nodes 2, 4, 5, and 6 all lead to either node 5 or 6.
```

__Example 2:__
```
Input: graph = [[1,2,3,4],[1,2],[3,4],[0,4],[]]
Output: [4]
Explanation:
Only node 4 is a terminal node, and every path starting at node 4 leads to node 4.
```

__Constraints:__

- $n == graph.length$
- $1 <= n <= 10^{4}$
- $0 <= graph[i].length <= n$
- $0 <= graph[i][j] <= n - 1$
- ```graph[i]``` is sorted in a strictly increasing order.
- The graph may contain self-loops.
- The number of edges in the graph will be in the range $[1, 4 * 10^{4}]$.

---

### Topological Sort using Kahn's Algorithm

![image](https://leetcode.com/problems/find-eventual-safe-states/Figures/802/802-1.png)

__Algorithm__

1. Create an integer ```n``` equal to the length of ```graph``` to get the number of nodes in the given ```graph```.
2. Create an array ```indegree``` of length n where ```indegree[x]``` stores the number of ```edges``` entering node ```x```.
We create an adjacency list adj in which adj[x] contains all the nodes with an incoming edge from node x, i.e., neighbors of node x. We create this adjacency list by iterating over graph and adding the reverse edges. For a node i which originally has outgoing edges to nodes in graph[i], we push i into adj[node] to add a reverse edge from node to i.
Initialize a queue of integers q and start a BFS algorithm moving from the leaf nodes to the parent nodes.
Begin the BFS traversal by pushing all of the leaf nodes (indegree equal to 0) in the queue.
Create a boolean array safe of size n to track the safe nodes in the graph.
While the queue is not empty;
Dequeue the first node from the queue.
Mark node as safe.
For each neighbor (nodes that have an incoming edge from node) of node, we decrement indegree[neighbor]by 1 to delete the node -> neighbor edge.
If indegree[neighbor] == 0, it means that neighbor behaves as a leaf node, so we push neighbor in the queue.
Create an answer array safeNodes of size n. Iterate over all the nodes from 0 to n - 1 and add all the safe nodes in safeNodes.
Return safeNodes.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m+n)$
- __Space Complexity__: $\mathcal{O}(m+n)$

```Python
class Solution:
    def eventualSafeNodes(self, graph: List[List[int]]) -> List[int]:
        n = len(graph)
        indegree = [0] * n
        adj = collections.defaultdict(list)

        for edge in range(n):
            for node in graph[edge]:
                adj[node].append(edge)
                indegree[edge] += 1

        queue = collections.deque()
        for node in range(n):
            if indegree[node] == 0:
                queue.append(node)

        visited = set()
        
        while queue:
            node = queue.popleft()
            visited.add(node)

            for next in adj[node]:
                indegree[next] -= 1
                if indegree[next] == 0:
                    queue.append(next)

        res = list()
        for node in range(n):
            if node in visited:
                res.append(node)
            
        return res
```

```Python
class Solution:
    def eventualSafeNodes(self, graph: List[List[int]]) -> List[int]:
        n = len(graph)
        adj = collections.defaultdict(list)
        indegree = collections.defaultdict(int)

        for edge in range(n):
            for node in graph[edge]:
                # Record the outgoing path of each node
                adj[node].append(edge)
                # Count the number of incoming paths
                indegree[edge] += 1
            
        queue = collections.deque()
        for node in range(n):
            # Add nodes that have the outgoing paths to the queue
            if not node in indegree:
                queue.append(node)
        
        visited = set()
        while queue:
            node = queue.popleft()
            visited.add(node)

            for neighbor in adj[node]:
                indegree[neighbor] -= 1

                if indegree[neighbor] == 0:
                    queue.append(neighbor)
                
        res = list()
        for node in range(n):
            if node in visited:
                res.append(node)
            
        return res
```

---

### Depth-First Search

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m+n)$
- __Space Complexity__: $\mathcal{O}(m+n)$

```Python
class Solution:
    def eventualSafeNodes(self, graph: List[List[int]]) -> List[int]:
        n = len(graph)
        adj = collections.defaultdict(list)

        indegree = [0] * n
        visited = set()
        
        def dfs(curr):
            if indegree[curr]:
                return True
            
            if curr in visited:
                return False
            
            visited.add(curr)
            indegree[curr] += 1

            for next in graph[curr]:
                if dfs(next):
                    return True
                
            indegree[curr] -= 1
            return False
                
        res = list()
        for node in range(n):
            if not dfs(node):
                res.append(node)
        
        return res
```

```Python
class Solution:
    def eventualSafeNodes(self, graph: List[List[int]]) -> List[int]:
        n = len(graph)
        adj = collections.defaultdict(list)

        indegree = set()
        visited = set()
        
        def dfs(curr):
            if curr in indegree:
                return True
            
            if curr in visited:
                return False
            
            visited.add(curr)
            indegree.add(curr)

            for next in graph[curr]:
                if dfs(next):
                    return True
                
            indegree.remove(curr)
            return False
                
        res = list()
        for node in range(n):
            if not dfs(node):
                res.append(node)
        
        return res
```
