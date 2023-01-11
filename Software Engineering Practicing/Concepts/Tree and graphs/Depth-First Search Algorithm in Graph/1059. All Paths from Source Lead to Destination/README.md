## 1059. All Paths from Source Lead to Destination

```Tag```: ```Depth-First Search``` ```Graph```

#### Difficulty: Medium

Given the ```edges``` of a directed graph where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates there is an edge between nodes a<sub>i</sub> and b<sub>i</sub>, and two nodes ```source``` and ```destination``` of this graph, determine whether or not all paths starting from ```source``` eventually, end at ```destination```, that is:

- At least one path exists from the ```source``` node to the ```destination``` node
- If a path _exists_ from the ```source``` node to a node with no outgoing edges, then that node is equal to ```destination```.
- The number of possible paths from ```source``` to ```destination``` is a finite number.

Return _```true``` __if and only if__ all roads from source lead to destination_.

![image](https://user-images.githubusercontent.com/35042430/211890862-628d407a-f75d-493a-a59c-111ae1492e14.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/03/16/485_example_1.png)
```
Input: n = 3, edges = [[0,1],[0,2]], source = 0, destination = 2
Output: false
Explanation: It is possible to reach and get stuck on both node 1 and node 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/03/16/485_example_2.png)
```
Input: n = 4, edges = [[0,1],[0,3],[1,2],[2,1]], source = 0, destination = 3
Output: false
Explanation: We have two possibilities: to end at node 3, or to loop over node 1 and node 2 indefinitely.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2019/03/16/485_example_3.png)
```
Input: n = 4, edges = [[0,1],[0,2],[1,3],[2,3]], source = 0, destination = 3
Output: true
```

__Constraints:__
```
1 <= n <= 104
0 <= edges.length <= 104
edges.length == 2
0 <= ai, bi <= n - 1
0 <= source <= n - 1
0 <= destination <= n - 1
The given graph may have self-loops and parallel edges.
```

---

As for cycle detection, there are multiple ways one can go about modifying the standard DFS algorithm. We will be following the node-coloring variant of the algorithm. The idea is to do DFS of a given graph and while doing traversal, assign one of the below three colors to every vertex. There are three different colors we can assign a node:

- ```WHITE``` ~ Vertex is not processed yet. Initially, all vertices are WHITE.

- ```GRAY``` ~ Vertex is being processed (DFS for this vertex has started, but not finished which means that all descendants (in DFS tree) of this vertex are not processed yet (or this vertex is in the function call stack).

![image](https://leetcode.com/problems/all-paths-from-source-lead-to-destination/solutions/1007695/Figures/1059/img2.png)
Figure 1. Highlighting an edge to a GRAY node thus creating a cycle in the graph.

- ```BLACK``` ~ Vertex and all its descendants are processed.

![image](https://leetcode.com/problems/all-paths-from-source-lead-to-destination/solutions/1007695/Figures/1059/img1.png)
Figure 2. Highlighting an edge to a BLACK node.

```
While doing DFS, if an edge is encountered from current vertex to a GRAY vertex, then this edge is a back edge and hence there is a cycle. A GRAY node represents a node whose processing is still ongoing. Thus, if a descendent eventually leads back to a node whose processing is ongoing, it ends up creating a cycle in the directed graph and we call the edge leading back to a GRAY node as a backward edge.
```

```Python
class Solution:
    WHITE = 0
    GRAY = 1
    BLACK = 2
    def leadsToDestination(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        graph = collections.defaultdict(set)
        # All nodes are white by default
        visited = ["WHITE"] * n
        for x, y in edges:
            graph[x].add(y)
        
        def dfs(curr):
            '''
            if visited[curr] != "WHITE":
                return visited[curr] == "BLACK"
            '''
            # Check if current node is already visited and it is being revisited
            if visited[curr] == "GRAY":
                # This is a backward edge and hence it creates a loop
                return False
            # Check if current node is already visited and all the paths that lead to it are traversed
            elif visited[curr] == "BLACK":
                # There is no other edge left, return True
                return True            
            # Check if the current node has no path to other node => stuck at the current node
            elif not graph[curr]:
                # True if current node is the destination and False if current node is not the destination
                return curr == destination
            else:
                # Mark the current node as GREY
                visited[curr] = "GRAY"
                # Check the path from the current node
                next_nodes = graph[curr]
                # Loop through all the possible paths from the current node
                for node in next_nodes:
                    # Check if the stuck at the node but not in the destination node
                    if not dfs(node):
                        return False
                visited[curr] = "BLACK"
            # print (visited)
            return True

        return dfs(source)
```

### Recursive Depth-First Search

```Python
class Solution:
    def leadsToDestination(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        # Recursive Depth-First Search
        #### Time Complexity : O(V+E), where V the number of vertices in the graph and E the number of edges in the graph
        #### Space Complexity: O(V+E),  where O(E) is occupied by the adjacency list and O(V) is occupied by the recursion stack
        visited = [None] * n
        # Build the adjacent list
        graph = collections.defaultdict(set)
        for x, y in edges:
            graph[x].add(y)
                
        def dfs(curr):
            # Base cases: Check if the node in the path not visited
            if visited[curr] == "NOT VISITED":
                return True
            # Check if the node is already visited
            elif visited[curr] == "VISITED":
                return False
            # # Check if curr is the destination as it has no path starting from
            elif not graph[curr]:
                # Check if curr is not the destination, path lead to curr does not lead to destination 
                return curr == destination
            else:
                # Mark the current node as visited
                visited[curr] = "VISITED"
                # Check neighbor nodes that the path(s) from curr lead(s) to
                for neighbors in graph[curr]:
                    if not dfs(neighbors):
                        return False
                # Remove visited mark for different path
                visited[curr] = "NOT VISITED"
            return True
        
        return dfs(source)
```

```Python
class Solution:
    def leadsToDestination(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        # Recursive Depth-First Search
        #### Time Complexity : O(V+E), where V the number of vertices in the graph and E the number of edges in the graph
        #### Space Complexity: O(V+E),  where O(E) is occupied by the adjacency list and O(V) is occupied by the recursion stack
        visited = set()
        # Build the adjacency list
        graph = collections.defaultdict(list)
        for x, y in edges:
            graph[x].append(y)

        # Check if there is an edge from destination
        if graph[destination]:
            return False

        def dfs(curr):
            next_nodes = graph[curr]
            for node in next_nodes:
                visited.add(curr)
                if node in visited or not dfs(node):
                    return False
                visited.remove(curr)
            return len(graph[curr]) != 0 or curr == destination

        return dfs(source)
```

### Iterative Depth-First Search

```Python
class Solution:
    def leadsToDestination(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        # Iterative Depth-First Search
        #### Time Complexity : O(V+E), where V the number of vertices in the graph and E the number of edges in the graph
        #### Space Complexity: O(V+E),  where O(E) is occupied by the adjacency list and O(V) is occupied by the recursion stack 
        graph = collections.defaultdict(set)
        for x, y in edges:
            graph[x].add(y)
        
        stack = [(source, [source])]

        while stack:
            curr, path = stack.pop()
            # Check if curr is the destination as it has no path starting from
            if not graph[curr]:
                # Check if curr is not the destination, path lead to curr does not lead to destination
                if curr != destination:
                    return False
            
            for next_node in graph[curr]:
                # Check if there is a loop
                if next_node in path:
                    return False
                else:
                    stack.append((next_node, path + [next_node]))
        return True
```
