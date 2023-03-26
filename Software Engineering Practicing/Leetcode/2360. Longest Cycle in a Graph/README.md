## [2360. Longest Cycle in a Graph](https://leetcode.com/problems/longest-cycle-in-a-graph/)

```Tag```: ```Graph``` ```Topological Sorted Order``` ```Kahn's Algorithm```

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
