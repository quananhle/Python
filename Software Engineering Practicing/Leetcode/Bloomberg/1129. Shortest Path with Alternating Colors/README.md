## 1129. Shortest Path with Alternating Colors

```Tag```: ```Graph```

#### Difficulty: Medium

You are given an integer ```n```, the number of nodes in a directed graph where the nodes are labeled from ```0``` to ```n - 1```. Each edge is red or blue in this graph, and there could be self-edges and parallel edges.

You are given two arrays ```redEdges``` and ```blueEdges``` where:

- ```redEdges[i] = [ai, bi]``` indicates that there is a directed red edge from node a<sub>i</sub> to node b<sub>i</sub> in the graph, and
- ```blueEdges[j] = [uj, vj]``` indicates that there is a directed blue edge from node u<sub>j</sub> to node v<sub>j</sub> in the graph.

Return an array ```answer``` of length ```n```, where each ```answer[x]``` is the length of the shortest path from node ```0``` to node ```x``` such that the edge colors alternate along the path, or ```-1``` if such a path does not exist.

---

__Example 1:__
```
Input: n = 3, redEdges = [[0,1],[1,2]], blueEdges = []
Output: [0,1,-1]
```

__Example 2:__
```
Input: n = 3, redEdges = [[0,1]], blueEdges = [[2,1]]
Output: [0,1,-1]
```

__Constraints:__

- ```1 <= n <= 100```
- ```0 <= redEdges.length, blueEdges.length <= 400```
- ```redEdges[i].length == blueEdges[j].length == 2```
- ```0 <= ai, bi, uj, vj < n```

---

### Breadth-First Search

A __breadth-first search__ is a good algorithm to use if we want to find the __shortest path in an unweighted graph__. The property of BFS is that the first time a node is reached during the traversal, it was reached in the __minimum__ possible steps from the source.

The path used in BFS traversal always has the least number of edges. The BFS algorithm does a level-wise iteration of the graph. As a result, it first finds all paths that are one edge away from the source node, followed by all paths that are two edges away from the source node, and so on. This allows BFS to find the shortest path in terms of steps from the source node to any other node. It is implemented with a queue. 

![image](https://leetcode.com/problems/shortest-path-with-alternating-colors/solutions/3049265/Figures/1129/1129-bfs-1.png)

![image](https://leetcode.com/problems/shortest-path-with-alternating-colors/solutions/3049265/Figures/1129/1129-bfs-2.png)

__Algorithm__

1. Create an adjacency list ```graph``` that contains a list of pairs of integers such that ```graph[node]``` contains the neighbors of ```node``` in the form ```(neighbor, color)``` where ```neighbor``` is the neighbor of ```node``` and ```color``` denotes the edge color that connects ```node``` and ```neighbor```. We use the number ```0``` for red and the number ```1``` for blue.
2. Create a ```distance``` array with the value ```math.inf```
3. Create a hash set ```visited``` for ```(node, color)``` indicates whether ```node``` has yet been visited using an edge of ```color```.
4. Create a queue of triplets. It will save three integers per triplet:

        a) the current node, 
        b) the steps taken to visit the node, and 
        c) the color of the previous edge used. 
      
5. While the queue is not empty:
- Remove the first element out of the queue to obtain ```[node, steps, prevColor]```.
- Loop through all ```(neighbor, color)``` pairs in ```graph[node]```. If a neighbor has not yet been visited with a color edge and ```color != last_color```, we visit neighbor with the color edge by pushing ```[neighbor, steps + 1, color]``` in the queue. If this is neighbor's first visit, i.e., ```answer[neighbor] == float("inf")```, we set ```answer[neighbor] = steps + 1```.
6. Return answer.

```Python
class Solution:
    def shortestAlternatingPaths(self, n: int, redEdges: List[List[int]], blueEdges: List[List[int]]) -> List[int]:
        # Breadth-First Search
        visited = set()
        level = 0
        distance = [float("inf")] * n
        # Build adjacency list
        graph = collections.defaultdict(list)
        # 0 - red, 1 - blue
        for e, v in redEdges:
            graph[e].append((v, 0))
        for e, v in blueEdges:
            graph[e].append((v, 1))
        
        queue = collections.deque([(0,0),[0,1]])

        while queue:
            for _ in range(len(queue)):
                node, last_color = queue.popleft()
                distance[node] = min(distance[node], level)

                for neighbor, curr_color in graph[node]:
                    if last_color != curr_color and not (neighbor, curr_color) in visited:
                        visited.add((neighbor, curr_color))
                        queue.append((neighbor, curr_color))
            level += 1
        
        return [dist if dist != math.inf else -1 for dist in distance]
```
