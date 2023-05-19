## [785. Is Graph Bipartite?](https://leetcode.com/problems/is-graph-bipartite/)

```Tag```: ```Graph``` ```Hungarian Algorithm```

#### Difficulty: Medium

There is an undirected graph with ```n``` nodes, where each node is numbered between ```0``` and ```n - 1```. You are given a 2D array ```graph```, where ```graph[u]``` is an array of nodes that node ```u``` is adjacent to. More formally, for each ```v``` in ```graph[u]```, there is an undirected edge between node ```u``` and node ```v```. The graph has the following properties:

- There are no self-edges (```graph[u]``` does not contain ```u```).
- There are no parallel edges (```graph[u]``` does not contain duplicate values).
- If ```v``` is in ```graph[u]```, then ```u``` is in ```graph[v]``` (the graph is undirected).
- The graph may not be connected, meaning there may be two nodes ```u``` and ```v``` such that there is no path between them.

A graph is __bipartite__ if the nodes can be partitioned into two independent sets __A__ and __B__ such that __every__ edge in the graph connects a node in set ```A``` and a node in set ```B```.

Return _```true``` if and only if it is bipartite_.

![image](https://github.com/quananhle/Python/assets/35042430/c1af7fde-d8db-4245-8279-2792ae6eac8f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/21/bi2.jpg)
```
Input: graph = [[1,2,3],[0,2],[0,1,3],[0,2]]
Output: false
Explanation: There is no way to partition the nodes into two independent sets such that every edge connects a node in one and a node in the other.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/21/bi1.jpg)
```
Input: graph = [[1,3],[0,2],[1,3],[0,2]]
Output: true
Explanation: We can partition the nodes into two sets: {0, 2} and {1, 3}.
```

__Constraints:__

- ```graph.length == n```
- ```1 <= n <= 100```
- ```0 <= graph[u].length < n```
- ```0 <= graph[u][i] <= n - 1```
- ```graph[u]``` does not contain ```u.```
- All the values of ```graph[u]``` are unique.
- If ```graph[u]``` contains ```v```, then ```graph[v]``` contains ```u```.

---

![image](https://leetcode.com/problems/is-graph-bipartite/Figures/785/color.png)

### Depth-First Search

```Python
class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        n = len(graph)
        colors = collections.defaultdict(int)

        def dfs(curr):
            for neighbor in graph[curr]:
                if not neighbor in colors:
                    colors[neighbor] = colors[curr] ^ 1
                    if not dfs(neighbor):
                        return False
                elif colors[neighbor] == colors[curr]:
                    return False

            return True


        for node in range(n):
            if not node in colors:
                colors[node] = 0
                if not dfs(node):
                    return False
        
        return True
```

```Python
class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        n = len(graph)
        colors = [0] * n

        def dfs(node, color):
            # Base case
            if colors[node] != 0:
                return colors[node] == color
            
            colors[node] = color
            for neighbor in graph[node]:
                if not dfs(neighbor, -color):
                    return False
            
            return True

        for curr in range(n):
            if colors[curr] == 0:
                if not dfs(curr, 1):
                    return False
        
        return True
```

### Breadth-First Search

```Python
class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        color = collections.defaultdict(bool)
        for node in range(len(graph)):
            if not node in color:
                stack = [node]
                color[node] = 0
                while stack:
                    node = stack.pop()
                    for neighbor in graph[node]:
                        if not neighbor in color:
                            stack.append(neighbor)
                            color[neighbor] = color[node] ^ 1
                        elif color[neighbor] == color[node]:
                            return False

        return True
```

```Python
class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        color = collections.defaultdict(bool)
        for node in range(len(graph)):
            if not node in color:
                stack = [node]
                color[node] = False
                while stack:
                    node = stack.pop()
                    for neighbor in graph[node]:
                        if not neighbor in color:
                            stack.append(neighbor)
                            color[neighbor] = not color[node]
                        elif color[neighbor] == color[node]:
                            return False

        return True
```

```Python
class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        n = len(graph)
        colors = [0] * n

        for node in range(n):
            if colors[node]:
                continue
            
            queue = collections.deque()
            queue.append(node)
            colors[node] = 1

            while queue:
                curr = queue.popleft()
                for neighbor in graph[curr]:
                    if colors[neighbor] == 0:
                        colors[neighbor] = -colors[curr]
                        queue.append(neighbor)
                    elif colors[neighbor] != -colors[curr]:
                        return False
  
        return True
```
