## [2360. Longest Cycle in a Graph](https://leetcode.com/problems/longest-cycle-in-a-graph/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search``` ```Topological Sorted Order``` ```Kahn's Algorithm```

#### Difficulty: Hard

You are given a __directed__ graph of ```n``` nodes numbered from ```0``` to ```n - 1```, where each node has __at most one__ outgoing edge.

The graph is represented with a given __0-indexed__ array ```edges``` of size ```n```, indicating that there is a directed edge from node ```i``` to node ```edges[i]```. If there is no outgoing edge from node ```i```, then ```edges[i] == -1```.

Return _the length of the longest cycle in the graph_. If no cycle exists, return ```-1```.

A cycle is a path that starts and ends at the same node.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/06/08/graph4drawio-5.png)
```
Input: edges = [3,3,4,2,3]
Output: 3
Explanation: The longest cycle in the graph is the cycle: 2 -> 4 -> 3 -> 2.
The length of this cycle is 3, so 3 is returned.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/06/07/graph4drawio-1.png)
```
Input: edges = [2,-1,3,1]
Output: -1
Explanation: There are no cycles in this graph.
```

__Constraints:__

- ```n == edges.length```
- ```2 <= n <= 10^5```
- ```-1 <= edges[i] < n```
- ```edges[i] != i```

---

### Depth-First Search

We would visit all the nodes in the cycle if we started a graph traversal from any node in the cycle. There is no point in revisiting the nodes in the cycle because they cannot be part of any other cycle.

![image](https://user-images.githubusercontent.com/35042430/227801944-3eb68228-b479-4fa5-b496-cb75e7df84c2.png)

__Algorithm__

1. Initialize an integer ```answer = -1```. This would store the length of the longest cycle in the graph.
2. Initialize another integer ```n = edges.length``` which stores the number of nodes in the graph.
3. Create a ```visited``` hash set to keep track of nodes that have been visited.
4. Iterate through all of the nodes and for each node ```node``` check if it is visited or not. If node ```node``` is not visited, create a hash map ```graph``` where ```graph.get(x)``` would store the distance of node ```x``` from starting node ```node```. Begin the DFS traversal:
    - We use the ```dfs``` function to perform the traversal. For each call, pass node as the parameters. We start with node ```node```.
    - Mark ```node``` as visited and get its neighbor ```neighbor``` using ```edges[node]```.
      - If ```neighbor``` exists and is not visited, we update ```graph[neighbor] = graph[node] + 1``` and recursively call ```dfs``` passing ```neighbor``` as the ```node```.
      - If ```neighbor``` exists and is already visited, we check if it is present in ```graph```. If it is present, it is a formation of cycle. We perform ```answer = max(answer, graph[node] - graph[neighbor] + 1)```. 
      - Otherwise, if it not present in graph, we ignore it as it was visited in a previous DFS traversal.
5. Return ```answer```.

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(n)```

#### Recursive Depth-First Search

```Python
class Solution:
    def longestCycle(self, edges: List[int]) -> int:
        n = len(edges)
        visited = set()
        ans = -1
        
        def dfs(node):
            nonlocal ans
            visited.add(node)
            neighbor = edges[node]
            
            if neighbor != -1 and not neighbor in visited:
                graph[neighbor] = graph[node] + 1
                dfs(neighbor)
            elif neighbor != -1 and neighbor in graph:
                ans = max(ans, graph[node] - graph[neighbor] + 1)

        for node in range(n):
            if not node in visited:
                graph = collections.defaultdict(int)
                graph[node] = 1
                dfs(node)
        
        return ans
```

#### Iterative Depth-First Search

```Python
class Solution:
    def longestCycle(self, edges: List[int]) -> int:
        ans = -1
        curr_time = 1
        n = len(edges)
        visited = [0] * n

        for origin in range(n):
            if visited[origin] > 0:
                continue
            start = curr_time
            curr_node = origin
        
            while curr_node != -1 and visited[curr_node] == 0:
                visited[curr_node] = curr_time
                curr_time += 1
                curr_node = edges[curr_node]
            
            if curr_node != -1 and visited[curr_node] >= start:
                length = curr_time - visited[curr_node]
                ans = max(ans, length)
            
        return ans
```

```Python
class Solution:
    def longestCycle(self, edges: List[int]) -> int:
        n = len(edges)
        visited = set([-1])
        res = -1

        for node in range(n):
            if not node in visited:
                origin = node
                curr_visited = set()
                # Detect cycle
                while not origin in visited:
                    visited.add(origin)
                    curr_visited.add(origin)
                    origin = edges[origin]
                
                # Cycle found, get the size of the cycle 
                if origin in curr_visited:
                    cycle_length = 1
                    node = edges[origin]
                    while node != origin:
                        node = edges[node]
                        cycle_length += 1
                    res = max(res, cycle_length)
        
        return res
```

### Breadth-First Search (Kahn's Algorithm)

![image](https://leetcode.com/problems/longest-cycle-in-a-graph/Figures/2360/2360-1.png)

__Algorithm__

1. Initialize an integer ```n = edges.length``` which stores the number of nodes in the graph.
2. Create an array ```degree``` of length ```n``` where ```degree[x]``` stores the number of edges with one end at node ```x```.
3. Create a ```visited``` hash set to keep track of nodes that have been visited.
4. Initialize a queue of integers ```q``` and start a BFS algorithm moving from the leaf nodes to the parent nodes.
5. Begin the BFS traversal by pushing all of the leaf nodes (```indegree``` equal to ```0```) in the queue.
6. While the queue is not empty;
    - Dequeue the first ```node``` from the queue ```q```.
    - Mark ```node``` as visited.
    - Get the neighbor, ```neighbor```, of ```node``` using ```edges[node]```. If ```neighbor != -1```, we decrement ```indegree[neighbor]``` by ```1```.
    - If ```indegree[neighbor] == 0```, it means that ```neighbor``` behaves as a leaf node, so we push ```neighbor``` in the queue ```q```.
7. Iterate over unvisited nodes and for an unvisited node ```node```:
    - Mark node ```node``` as visited.
    - Fetch neighbor, ```neighbor```, of ```node``` using ```edge[node]``` and create a variable ```count``` to count number of nodes in the cycle. Initialize ```count = 1``` to count node ```node``` itself.
    - Keep moving forward in the cycle until we reach node ```node``` (```neighbor != node```). Mark ```neighbor``` as visited and move to next neighbor ```neighbor = edges[neighbor]```. Also, increment ```count``` by ```1``` for each node that is being visited in the cycle.
    - Update ```answer = max(answer, count)```.
8. Return ```answer```.

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(n)```

```Python
class Solution:
    def longestCycle(self, edges: List[int]) -> int:
        n = len(edges)
        visited = set()
        indegree = [0] * n

        for edge in edges:
            if edge != -1:
                indegree[edge] += 1
        
        # Kahn's Algorithm - begin
        queue = collections.deque()
        for node in range(n):
            if indegree[node] == 0:
                queue.append(node)

        while queue:
            node = queue.popleft()
            visited.add(node)
            neighbor = edges[node]
            if neighbor != -1:
                indegree[neighbor] -= 1
                if indegree[neighbor] == 0:
                    queue.append(neighbor) 
        # Kahn's Algorithm - end

        ans = -1
        for node in range(n):
            if not node in visited:
                neighbor = edges[node]
                count = 1
                visited.add(node)
                while neighbor != node:
                    visited.add(neighbor)
                    count += 1
                    neighbor = edges[neighbor]
                ans = max(ans, count)
        
        return ans
```

### Detect Cycle Linked Lists

```Python
class Solution:
    def longestCycle(self, edges: List[int]) -> int:
        n = len(edges)
        ans = -1
        visited = [0] * n

        def get_length(head):
            if head == -1:
                return -1
            node = head
            size = 1
            while edges[head] != node:
                  size += 1
                  head = edges[head]
            return size
        
        def find_cycle(node):
            if node == -1 or visited[node] == 2:
                return -1
            if visited[node] == 1:
                return node
            visited[node] += 1
            cycle = find_cycle(edges[node])
            visited[node] += 1
            return cycle
        
        for node in range(n):
            if visited[node] == 0:
                cycle = find_cycle(node)
                ans = max(ans, get_length(cycle))

        return ans
```
