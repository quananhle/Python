## 1168. Optimize Water Distribution in a Village

```Tag```: ```Depth-First Search``` ```Union-Find```

#### Difficulty: Hard

There are ```n``` houses in a village. We want to supply water for all the houses by building wells and laying pipes.

For each house ```i```, we can either build a well inside it directly with cost ```wells[i - 1]``` (note the ```-1``` due to __0-indexing__), or pipe in water from another well to it. The costs to lay pipes between houses are given by the array ```pipes``` where each __pipes[j] = [house1<sub>j</sub>, house2<sub>j</sub>, cost<sub>j</sub>]__ represents the cost to connect __house1<sub>j</sub>__ and __house2<sub>j</sub>__ together using a pipe. Connections are bidirectional, and there could be multiple valid connections between the same two houses with different costs.

Return _the minimum total cost to supply water to all houses_.

![image](https://user-images.githubusercontent.com/35042430/211473285-880e1841-a37c-4120-8c83-f8039ee0b38c.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/05/22/1359_ex1.png)
```
Input: n = 3, wells = [1,2,2], pipes = [[1,2,1],[2,3,1]]
Output: 3
Explanation: The image shows the costs of connecting houses using pipes.
The best strategy is to build a well in the first house with cost 1 and connect the other houses to it with cost 2 so the total cost is 3.
```

__Example 2:__
```
Input: n = 2, wells = [1,1], pipes = [[1,2,1],[1,2,2]]
Output: 2
Explanation: We can supply water with cost two using one of the three options:
Option 1:
  - Build a well inside house 1 with cost 1.
  - Build a well inside house 2 with cost 1.
The total cost will be 2.
Option 2:
  - Build a well inside house 1 with cost 1.
  - Connect house 2 with house 1 with cost 1.
The total cost will be 2.
Option 3:
  - Build a well inside house 2 with cost 1.
  - Connect house 1 with house 2 with cost 1.
The total cost will be 2.
Note that we can connect houses 1 and 2 with cost 1 or with cost 2 but we will always choose the cheapest option. 
```

__Constraints:__
```
2 <= n <= 104
wells.length == n
0 <= wells[i] <= 105
1 <= pipes.length <= 104
pipes[j].length == 3
1 <= house1j, house2j <= n
0 <= costj <= 105
house1j != house2j
```

---

Since the problem description involves connecting ```houses``` (vertices) using ```pipes``` (edges), we can tell that this problem is a variant of __graph__ problems. More precisely, we can convert it into a standard __minimum spanning tree (MST)__

### Prim's Algorithm with Heap
#### Time Complexity: ```O((N+M)⋅log⁡(N+M)```, iterate through the ```houses``` and ```pipes``` in the input, which takes ```O(N+M)```, ```push()``` in heap costs ```log(N + M)``` time
#### Space Complexity: ```O(N + M)```, extra memory space to build ```graph```

Prim's (also known as Jarník's) algorithm is a greedy algorithm used to find the minimum spanning tree in a weighted and undirected graph.

    The algorithm operates by building the tree one vertex at a time, from an arbitrary starting vertex, at each step adding the cheapest possible connection from any vertex in the tree to a vertex that is not in the tree.

![image](https://leetcode.com/problems/optimize-water-distribution-in-a-village/solutions/1301513/Figures/1168/PrimAlgDemo.gif)

The above illustration demonstrates how Prim's algorithm works. Starting from an arbitrary vertex, Prim's algorithm grows the minimum spanning tree by adding one vertex at a time to the tree. The choice of a vertex is based on the greedy strategy, i.e. the addition of the new vertex incurs the minimum cost.

```Python
class Solution:
    def minCostToSupplyWater(self, n: int, wells: List[int], pipes: List[List[int]]) -> int:
        # Build a bidirectional graph with the adjacency list
        graph = collections.defaultdict(list)
        # To convert problem into the MST problem, add a virtual vertex (index it as 0) together with the additional n edges to each house
        for index, cost in enumerate(wells):
            graph[0].append((cost, index + 1))
        # Since the graph is undirected (i.e. bidirectional), for each pipe,add two entries in the adjacency list, with each end of the pipe as a starting vertex
        for house1, house2, cost in pipes:
            # Add the bidirectional edges to the graph
            graph[house1].append((cost, house2))
            graph[house2].append((cost, house1))
        # Set to maintain all the vertices added to the final minimum spanning tree, during the construction of the tree
        visited = set([0])
        # Heap to maitain the order of edges to be visited starting from the edges originated from the vertex 0
        heapq.heapify(graph[0])
        # Prim's algorithm can use any vertex as a starting point; hence, start from the newly-added virtual vertex
        edges_heap = graph[0]

        total_cost = 0
        while len(visited) < n + 1:
            # Pop an element from the heap containing a vertex along with the cost that is associated with the edge that connecting the vertex to the tree
            cost, next_house = heapq.heappop(edges_heap)
            if not next_house in visited:
                # Add new vertex to the set
                visited.add(next_house)
                # The cost of this vertex is minimal among all choices because it was popped from the heap
                total_cost += cost
                # Find the neighbor houses
                for new_cost, neighbor in graph[next_house]:
                    if not neighbor in visited:
                        heapq.heappush(edges_heap, (new_cost, neighbor))
        # Loop terminates when we have added all the vertices from the graph into the MST
        return total_cost
```

### Kruskal's Algorithm with Union-Find


Similiar to Prim's algorithm, Kruskal's algorithm applies the greedy strategy to incrementally add new edges to the final solution.

![image](https://leetcode.com/problems/optimize-water-distribution-in-a-village/solutions/1301513/Figures/1168/KruskalDemo.gif)

The above animation shows how Kruskal's algorithm grows the minimum spanning tree.

    A major difference between them is that in Prim's algorithm the MST (minimal spanning tree) remains connected as a whole throughout the entire process, while in Kruskal's algorithm, the tree is formed by merging the disjoint components together.
    
![image](https://leetcode.com/problems/optimize-water-distribution-in-a-village/solutions/1301513/Figures/1168/1168_union_find_examples.png)
__Add or Not to Add?__

The above diagram shows three example scenarios and for each scenario, specifies whether a new edge should be added or not. The solid edges have already been added to the MST, while the dashed edges have yet to be decided.

- In the example on the left, we should add the new edge, since the edge bridges the gap between the two disjoint components.
- In the middle example, we should also add the new edge, since it connects to an unseen vertex (i.e. connecting more dots).
- In the example on the right, we should not add the new edge. Because it does not help us to make the current MST more connected, since all vertices are connected already.
    
```Python
class UnionFind:
    def __init__(self, size):
        # container to hold the group id for each member. the index of member starts from 1, add one more element to the container
        self.root = [i for i in range(size + 1)]
        self.rank = [1] * (size + 1)
        self.count = size

    def find(self, x):
        if x == self.root[x]:
            return x
        else:
            self.root[x] = self.find(self.root[x])
            return self.root[x]

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += self.rank[root_x]
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += self.rank[root_y]
            self.count -= 1
            return True
        else:
            return False

class Solution:
    def minCostToSupplyWater(self, n: int, wells: List[int], pipes: List[List[int]]) -> int:
        edges = list()
        for index, weight in enumerate(wells):
            # Add the virtual vertex (index with 0) along with the new edges
            edges.append((weight, 0, index + 1))
        
        # Add the existing edges with weight, origin, destination
        for house1, house2, weight in pipes:
            edges.append((weight, house1, house2))

        # Sort the edges by weight
        edges.sort(key=lambda x: x[0])

        union_find = UnionFind(n)
        total_cost = 0
        # Iterate through the sorted edges
        for cost, house1, house2 in edges:
            # Check if both ends of the edge belong to different groups, add this edge into the final MST            
            if union_find.union(house1, house2):
                total_cost += cost
        return total_cost
```
