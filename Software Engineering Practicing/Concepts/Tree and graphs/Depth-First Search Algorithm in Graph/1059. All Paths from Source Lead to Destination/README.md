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

