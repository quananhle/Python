## 1971. Find if Path Exists in Graph

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

#### Difficulty: Easy

There is a __bi-directional graph__ with ```n``` vertices, where each vertex is labeled from ```0``` to ```n - 1``` (inclusive). The edges in the graph are represented as a 2D integer array ```edges```, where each ```edges[i]``` = [u<sub>i</sub>, v<sub>i</sub>] denotes a bi-directional edge between vertex u<sub>i</sub> and vertex v<sub>i</sub>. Every vertex pair is connected by __at most one__ edge, and no vertex has an edge to itself.

You want to determine if there is a valid path that exists from vertex ```source``` to vertex ```destination```.

Given ```edges``` and the integers ```n```, ```source```, and ```destination```, return _```true``` if there is a valid path from source to destination, or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/211609094-c42bb277-a1b0-4647-8872-ca403ca5ce8f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/08/14/validpath-ex1.png)
```
Input: n = 3, edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
Output: true
Explanation: There are two paths from vertex 0 to vertex 2:
- 0 → 1 → 2
- 0 → 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/08/14/validpath-ex2.png)
```
Input: n = 6, edges = [[0,1],[0,2],[3,5],[5,4],[4,3]], source = 0, destination = 5
Output: false
Explanation: There is no path from vertex 0 to vertex 5.
```

__Constraints:__
```
1 <= n <= 2 * 105
0 <= edges.length <= 2 * 105
edges[i].length == 2
0 <= ui, vi <= n - 1
ui != vi
0 <= source, destination <= n - 1
There are no duplicate edges.
There are no self edges.
```

---

### Iterative Depth-First Search

```Python
class Solution:
    def validPath(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        # Iterative Depth-First Search
        #### Time complexity : O(N + M), N number of vertices and M number of edges
        #### Space Complexity: O(N + M), extra memory space needed to build hash map that stores edges and visited set to store vertices
        visited = [False] * n
        visited[source] = True
        # Adjacency List
        graph = collections.defaultdict(set)
        for x, y in edges:
            graph[x].add(y)
            graph[y].add(x)
        stack = [source]

        while stack:
            curr_node = stack.pop()
            for next_node in graph[curr_node]:
                if next_node == destination:
                    return True
                if not visited[next_node]:
                    visited[next_node] = True
                    stack.append(next_node)
        return visited[destination]
```

```Python

```Python
class Solution:
    def validPath(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        # Iterative Depth-First Search
        #### Time complexity : O(N + M), N number of vertices and M number of edges
        #### Space Complexity: O(N + M), extra memory space needed to build hash map that stores edges and visited set to store vertices
        visited = set()
        visited.add(source)
        # Build the adjacency list
        graph = collections.defaultdict(set)
        for x, y in edges:
            graph[x].add(y)
            graph[y].add(x)
        stack = [source]
        # Check if destination in visited
        while stack:
            curr = stack.pop()
            for next in graph[curr]:
                # Reached the destination
                if destination in visited or next == destination:
                    return True
                if not next in visited:
                    visited.add(next)
                    stack.append(next)
        return True if destination in visited else False
```

### Recursive Depth-First Search

```Python
class Solution:
    def validPath(self, n: int, edges: List[List[int]], source: int, destination: int) -> bool:
        # Recursive Depth-First Search
        #### Time complexity : O(N + M), N number of vertices and M number of edges
        #### Space Complexity: O(N + M), extra memory space needed to build hash map that stores edges and visited set to store vertices
        visited = set()
        # Build the adjacency list
        graph = collections.defaultdict(set)
        for x, y in edges:
            graph[x].add(y)
            graph[y].add(x)
        # Check if destination can be reached
        def dfs(curr):
            if curr == destination or destination in visited:
                return True
            if not curr in visited:
                visited.add(curr)
                for next in graph[curr]:
                    if not next in visited:
                        if dfs(next):
                            return True
            return False

        return dfs(source)
```

### Optimized “disjoint set” with Path Compression and Union by Rank

```Python


```
