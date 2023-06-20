## [1466. Reorder Routes to Make All Paths Lead to the City Zero](https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

There are ```n``` cities numbered from ```0``` to ```n - 1``` and ```n - 1``` roads such that there is only one way to travel between two different cities (this network form a tree). Last year, The ministry of transport decided to orient the roads in one direction because they are too narrow.

Roads are represented by connections where ```connections[i]``` = [a<sub>i</sub>, b<sub>i</sub>] represents a road from city a<sub>i</sub> to city b<sub>i</sub>.

This year, there will be a big event in the capital (city ```0```), and many people want to travel to this city.

Your task consists of reorienting some roads such that each city can visit the city ```0```. Return _the minimum number of edges changed_.

It's __guaranteed__ that each city can reach city ```0``` after reorder.

![image](https://user-images.githubusercontent.com/35042430/227409436-7c8356c4-b600-4841-abe6-bb874ad73113.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/05/13/sample_1_1819.png)
```
Input: n = 6, connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
Output: 3
Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/05/13/sample_2_1819.png)
```
Input: n = 5, connections = [[1,0],[1,2],[3,2],[3,4]]
Output: 2
Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
```

__Example 3:__
```
Input: n = 3, connections = [[1,0],[2,0]]
Output: 0
```

__Constraints:__

- 2 <= ```n``` <= 5 * 10<sup>4</sup>
- ```connections.length == n - 1```
- ```connections[i].length == 2```
- 0 <= a<sub>i</sub>, b<sub>i</sub> <= ```n - 1```
- a<sub>i</sub> != b<sub>i</sub>

---

![image](https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/Figures/1466/1466-1.png)

1. __Child__: A node that is one edge further away from a given node in a rooted tree. In the above image, nodes ```3```, ```4``` are children of ```1```, which is called the parent. (When we consider ```0``` as the root)
2. __Descendants__: Descendants of a node are children, children of children, and so on. In the above image, nodes ```3, 4, 6, 7, 9``` are all descendants of ```1```.
3. __Subtree__: A subtree of a node ```T``` is a tree ```S``` consisting of a node ```T``` and all of its descendants in ```T```. The subtree corresponding to the root node is the entire tree.

### Depth-First Search

![image](https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/Figures/1466/1466-2.png)

__Algorithm__

1. Create an integer variable ```count``` to count the number of edges that must be flipped. We initialize it with ```0```.
2. Create an adjacency graph ```graph``` that contains a list of pairs of integers such that ```graph[node]``` contains all the neighbors of ```node``` in the form of ```(neighbor, sign)``` where ```neighbor``` is the neighboring node of ```node``` and ```sign``` denotes the direction of the edge i.e., whether its an "original" or "artificial" edge.
3. Start a ```DFS``` traversal.
    - We use a function ```dfs``` to perform the traversal. For each call, pass ```node, parent, adj``` as the parameters. We start with node ```0``` and parent as ```-1```.
    - Iterate over all the children of the ```node``` (nodes that share an edge) using ```graph[node]```. For every ```child, sign``` in ```graph[node]```, check if ```child``` is equal to ```parent```. If ```child``` is equal to ```parent```, we will not visit it again.
    - If ```child``` is not equal to ```parent```, we perform ```count += sign``` and recursively call the ```dfs``` with ```node = child``` and ```parent = node```. At the end of the ```dfs``` traversal, we have the total edges that are required to be flipped in ```count```.
4. Return ```count```.

```Python
class Solution:
    def minReorder(self, n: int, connections: List[List[int]]) -> int:
        # Depth-First Search

        # Build the adjacency graph
        graph = collections.defaultdict(list)
        for u, v in connections:
            # Pair of neighbors and directions
            graph[u].append((v, True))          # Edge from the root node is True or 1
            graph[v].append((u, False))         # Edge to the root node is False or 0

        def dfs(node, parent):
            for neighbor in graph[node]:
                child, sign = neighbor[0], neighbor[1]
                if child != parent:
                    numbers_of_connected_nodes.append(sign)
                    dfs(child, node)

        numbers_of_connected_nodes = list()
        dfs(0, -1)
        # Count the edges with directions from the root node 0 only
        return sum(numbers_of_connected_nodes)
```

```Python
class Solution:
    def minReorder(self, n: int, connections: List[List[int]]) -> int:
        graph = collections.defaultdict(list)
        connections = set((u, v) for u, v in connections)
        for u, v in connections:
            graph[u].append(v)
            graph[v].append(u)

        def dfs(node):
            nonlocal ans
            for neighbor in graph[node]:
                if not neighbor in visited:
                    if (node, neighbor) in connections:
                        ans += 1
                    visited.add(neighbor)
                    dfs(neighbor)
        
        ans = 0
        visited = set([0])
        dfs(0)
        return ans
```

### Breadth-First Search

```Python
class Solution:
    def minReorder(self, n: int, connections: List[List[int]]) -> int:
        # Breadth-First Search
        graph = collections.defaultdict(list)
        for u, v in connections:
            # Pair of neighbors and directions
            graph[u].append((v, True))          # Edge from the root node is True or 1
            graph[v].append((u, False))         # Edge to the root node is False or 0

        queue = collections.deque([(0, -1)])
        numbers_of_connected_nodes = 0

        while queue:
            node, parent = queue.popleft()
            for neighbor in graph[node]:
                child, sign = neighbor[0], neighbor[1]
                if child != parent:
                    numbers_of_connected_nodes += sign
                    queue.append((child, node))

        return numbers_of_connected_nodes
```

```Python
class Solution:
    def minReorder(self, n: int, connections: List[List[int]]) -> int:
        # Build the adjacency graph
        graph = collections.defaultdict(list)
        connections = set((u, v) for u, v in connections)
        for u, v in connections:
            graph[u].append(v)
            graph[v].append(u)

        queue = collections.deque([0])
        visited = set([0])
        ans = 0

        while queue:
            node = queue.popleft()
            for neighbor in graph[node]:
                if not neighbor in visited:
                    if (node, neighbor) in connections:
                        ans += 1
                    queue.append(neighbor)
                    visited.add(neighbor)
        
        return ans
```
