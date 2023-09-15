## [1584. Min Cost to Connect All Points](https://leetcode.com/problems/min-cost-to-connect-all-points)

```Tag```: ```Kruskal's Algorithm``` ```Prim's Algorithm``` ```Union-Find```

#### Difficulty: Medium

You are given an array ```points``` representing integer coordinates of some points on a 2D-plane, where ```points[i]``` = $[x_{i}, y_{i}]$.

The cost of connecting two points $[x_{i}, y_{i}]$ and $[x_{i}, y_{i}]$ is the __manhattan distance__ between them: $|x_{i} - x_{j}| + |y_{i} - y_{j}|$, where ```|val|``` denotes the absolute value of ```val```.

Return _the minimum cost to make all points connected_. All points are connected if there is __exactly one__ simple path between any two points.

![image](https://github.com/quananhle/Python/assets/35042430/cfe2fe6c-0a67-482f-973b-daf95705ff5f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/26/d.png)
```
Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
Output: 20
Explanation:
```

![image](https://assets.leetcode.com/uploads/2020/08/26/c.png)

```
We can connect the points as shown above to get the minimum cost of 20.
Notice that there is a unique path between every pair of points.
```

__Example 2:__
```
Input: points = [[3,12],[-2,5],[-4,1]]
Output: 18
```

__Constraints:__

- $1 \le points.length \le 1000$
- $-10^{6} \le x_{i}, y_{i} \le 10^{6}$
- All pairs $(x_{i}, y_{i})$ are distinct.

---

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/Slide1.PNG)

### Kruskal's Algorithm

Kruskal's algorithm is a greedy algorithm for building a minimum spanning tree in a weighted and undirected graph.

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/kruskal.gif)

The union-find data structure has two primary functions:

- ```find(a)```: Function which returns the ID of the group in which node ```a``` belongs.
- ```union(a, b)```: Function to merge the groups of node ```a``` and ```b```. If they already belong to the same group, we don't do anything and return ```false``` to signify the edge between ```a``` and ```b``` was not added. Otherwise, we return ```true```.

While there are several ways to implement union-find, in this approach, we will implement union-find by rank with path compression.

So, after sorting all the edges in increasing order, we will try to connect the end nodes of each edge one by one.
First, we need to check if these two nodes are already connected. To do so, we can use the ```find``` function. If they are already connected by some other path, then adding this edge will form a cycle; thus, we will omit this edge from the MST. If the nodes are not connected, we can use the ```union``` function to connect them. We will perform the ```find``` check inside the ```union``` function to keep our code clean.

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/Slide2.PNG)

We can make a small optimization here. Instead of iterating over the whole array, when we connect ```(n-1)``` edges, we can skip the remaining edges because the MST is complete. The MST becomes complete as soon as it contains ```(n-1)``` edges because a tree with ```n``` nodes will always have ```(n-1)``` edges.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2 \cdot \log(N))$.
![image](https://github.com/quananhle/Python/assets/35042430/fa1a40f3-d0a8-4a97-9002-45ca2d6c7932)
- __Space Complexity__: $\mathcal{O}(N^{2})$.
![image](https://github.com/quananhle/Python/assets/35042430/73db18c1-b224-4bd1-9e1d-9d8fdb048862)

```Python
# Optimized “disjoint set” with Path Compression and Union by Rank
class UnionFind:

    def __init__(self, size: int) -> None:
        self.root = [i for i in range(size)]
        self.rank = [1] * size 
        self.size = size
    
    def find(self, x: int) -> int:
        if x != self.root[x]:
            self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x: int, y: int) -> bool:
        root_x = self.find(x)
        root_y = self.find(y)
        # If x and y are not belong to same group.
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
            elif self.rank[root_x] > self.rank[root_y]:
                self.root[root_y] = root_x
            else:
                self.root[root_x] = root_y
                self.rank[root_y] += 1
            self.size -= 1
            return True
        return False
    
    def get_size(self) -> int:
        return self.size

    def compare(self, x: int, y: int) -> bool:
        return self.find(x) == self.find(y)


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        uf = UnionFind(n)
        all_edges = list()

        # Storing all edges of the graph to make the problem become regular undirected weight graph problem
        for curr in range(n):
            for next in range(curr + 1, n):
                # Get weight
                manhattan_distance = abs(points[curr][0] - points[next][0]) + abs(points[curr][1] - points[next][1])
                all_edges.append((manhattan_distance, curr, next))
        
        all_edges.sort()

        ans = 0
        # Edges used to break out early once all nodes are connected
        edges_used = 0

        for weight, x, y in all_edges:
            if uf.union(x, y):
                ans += weight
                edges_used += 1
                # If n - 1 edges are made, all nodes are connected
                if edges_used == n - 1:
                    break
                
        return ans
```

```Python
# Optimized “disjoint set” with Path Compression and Union by Rank

class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.size = size
    
    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        # x and y already belong to same group
        if root_x == root_y:
            return False

        if self.rank[root_x] < self.rank[root_y]:
            self.root[root_x] = root_y
            self.rank[root_y] += root_x
        else:
            self.root[root_y] = root_x
            self.rank[root_x] += root_y
        self.size -= 1

        return True

    def get_count(self):
        return self.size


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        uf = UnionFind(n)
        all_edges = list()

        # Storing all edges of the graph to make the problem become regular undirected weight graph problem
        for curr in range(n):
            for next in range(curr + 1, n):
                # Get weight
                manhattan_distance = abs(points[curr][0] - points[next][0]) + abs(points[curr][1] - points[next][1])
                all_edges.append((manhattan_distance, curr, next))
        
        all_edges.sort()

        ans = 0
        # Edges used to break out early once all nodes are connected
        edges_used = 0

        for weight, x, y in all_edges:
            if uf.union(x, y):
                ans += weight
                edges_used += 1
                # If n - 1 edges are made, all nodes are connected
                if edges_used == n - 1:
                    break
                
        return ans
```

### Prim's Algorithm

Prim's algorithm is also a greedy algorithm for building a minimum spanning tree in a weighted and undirected graph.

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/prims.gif)

In this algorithm, we can pick any node to start with. Then we will choose the lowest-weighted edge that connects a node present in the MST to a node not present in the MST. We could keep all of the edges in an array and then sort them. But then, for each new node that we add to the MST, we would have to add the new node's edges to the array and sort the array again. This would be a costly operation when done repeatedly.

A more efficient way to track which edges are available and which of these edges has the lowest weight is to use a min-heap data structure. A min-heap is a tree-like data structure that always stores the minimum valued element (edge weight here) at the root and where insertion and removal of elements (edges) take logarithmic time.

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/Slide2.PNG)

```Python
class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        h = [(0, 0)]
        seen = set()
        ans = 0
        # Edges used to break out early once all nodes are connected
        edges_used = 0

        while edges_used < n:
            weight, curr = heapq.heappop(h)

            if curr in seen:
                continue
            
            seen.add(curr)
            ans += weight
            edges_used += 1

            for next in range(n):
                if not next in seen:
                    next_weight = abs(points[curr][0] - points[next][0]) + abs(points[curr][1] - points[next][1])
                    heapq.heappush(h, (next_weight, next))
                
        return ans
```
