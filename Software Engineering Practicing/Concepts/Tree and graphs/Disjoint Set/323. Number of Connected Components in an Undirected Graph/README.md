## 323. Number of Connected Components in an Undirected Graph

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

#### Difficulty: Medium

You have a graph of ```n``` nodes. You are given an integer ```n``` and an array ```edges``` where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates that there is an edge between a<sub>i</sub> and b<sub>i</sub> in the graph.

Return _the number of connected components in the graph._

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/14/conn1-graph.jpg)
```
Input: n = 5, edges = [[0,1],[1,2],[3,4]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/14/conn2-graph.jpg)
```
Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
Output: 1
```

__Constraints:__
```
1 <= n <= 2000
1 <= edges.length <= 5000
edges[i].length == 2
0 <= ai <= bi < n
ai != bi
There are no repeated edges.
```

---

### Recursive Depth-First Search

```Python
class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        # Depth-First Search
        #### Time Complexity : O(N^2), traverse through the 2D array of size N x N
        #### Space Complexity: O(N^2), extra memory space required to build a 2D array of N rows and N columns
        '''
            0   1   2   3   4
        0   1   1   0   0   0

        1   1   1   1   0   0

        2   0   1   1   0   0

        3   0   0   0   1   1

        4   0   0   0   1   1

        [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]

        '''
        graph = [[0] * n for _ in range(n)]
        for row, col in edges:
            # [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]
            # Mark where there is a link between two nodes or two nodes are directly connected
            graph[row][col] = 1           # [[0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 0, 0]]
            graph[col][row] = 1           # [[0, 0, 0, 0, 0], [1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0]]
            graph[row][row] = 1           # [[1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0], [0, 0, 0, 0, 0]]
            graph[col][col] = 1           # [[0, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1]]
        ROWS, COLS = len(graph), len(graph[0])        
        visited = [0] * ROWS

        def dfs(row):
            for col in range(COLS):
                if graph[row][col] == 1 and visited[col] == 0:
                    visited[col] = 1
                    dfs(col)

        count = 0
        for row in range(ROWS):
            if visited[row] == 0:
                dfs(row)
                count += 1
        return count
```

### Iterative Breadth-First Search

```Python
class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        # Breadth-First Search
        #### Time Complexity : O(N^2), traverse through the 2D array of size N x N
        #### Space Complexity: O(N^2), extra memory space required to build a 2D array of N rows and N columns
        '''
            0   1   2   3   4
        0   1   1   0   0   0

        1   1   1   1   0   0

        2   0   1   1   0   0

        3   0   0   0   1   1

        4   0   0   0   1   1

        [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]

        '''
        graph = [[0] * n for _ in range(n)]
        for row, col in edges:
            # [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]
            # Mark where there is a link between two nodes or two nodes are directly connected
            graph[row][col] = 1           # [[0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 0, 0]]
            graph[col][row] = 1           # [[0, 0, 0, 0, 0], [1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0]]
            graph[row][row] = 1           # [[1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0], [0, 0, 0, 0, 0]]
            graph[col][col] = 1           # [[0, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1]]
        ROWS, COLS = len(graph), len(graph[0])        
        visited = [0] * ROWS
        count = 0
        queue = collections.deque()

        for row in range(ROWS):
            print (row, visited[row])
            if visited[row] == 0:
                queue.append(row)
                while queue:
                    row = queue.pop()
                    visited[row] = 1
                    for col in range(COLS):
                        if graph[row][col] == 1 and visited[col] == 0:
                            queue.append(col)
                count += 1
        return count
```

### Union-Find

```Python
# UnionFind class
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        # Use a rank array to record the height of each vertex, i.e., the "rank" of each vertex.
        # The initial "rank" of each vertex is 1, because each of them is
        # a standalone vertex with no connection to other vertices.
        self.rank = [1] * size
        self.count = size

    # The find function here is the same as that in the disjoint set with path compression.
    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]

    # The union function with union by rank
    def union(self, x, y):
        rootX = self.find(x)
        rootY = self.find(y)
        if rootX != rootY:
            if self.rank[rootX] > self.rank[rootY]:
                self.root[rootY] = rootX
            elif self.rank[rootX] < self.rank[rootY]:
                self.root[rootX] = rootY
            else:
                self.root[rootY] = rootX
                self.rank[rootX] += 1
            self.count -= 1

    def getCount(self):
        return self.count

class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        # Depth-First Search
        #### Time Complexity : O(N^3), union and find take o(N) time while traversing through the entire 2D array
        #### Space Complexity: O(N^2), extra memory space required to build a 2D array of N rows and N columns
        '''
            0   1   2   3   4
        0   1   1   0   0   0

        1   1   1   1   0   0

        2   0   1   1   0   0

        3   0   0   0   1   1

        4   0   0   0   1   1

        [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]

        '''
        graph = [[0] * n for _ in range(n)]
        for row, col in edges:
            # [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]
            # Mark where there is a link between two nodes or two nodes are directly connected
            graph[row][col] = 1           # [[0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 0, 0]]
            graph[col][row] = 1           # [[0, 0, 0, 0, 0], [1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0]]
            graph[row][row] = 1           # [[1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0], [0, 0, 0, 0, 0]]
            graph[col][col] = 1           # [[0, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1]]
        ROWS, COLS = len(graph), len(graph[0])        

        uf = UnionFind(ROWS)
        for row in range(ROWS):
            for col in range(row + 1, ROWS):
                if graph[row][col] == 1:
                    uf.union(row, col)
        return uf.getCount()
```

---

### Adjacency List Depth-First Search
#### Time Complexity : ```O(N + E)```, recursive call up to N vertices, and iterate over the edge list of each vertex
#### Space Complexity: ```O(N + E)```, extra memory space required to build adjacency list of N vertices

```Python
class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        # Depth-First Search
        # To look for the neighbors of the node
        count = 0
        adjacency_list = [[] for _ in range(n)]
        for x, y in edges:
            adjacency_list[x].append(y)
            adjacency_list[y].append(x)
        visited = [0] * n

        def dfs(node):
            visited[node] = 1
            for neighbor in range(len(adjacency_list[node])):
                root = adjacency_list[node][neighbor]
                if visited[root] == 0:
                    dfs(root)

        for node in range(n):
            if visited[node] == 0:
                count += 1
                dfs(node)
        return count
```

### Optimized “disjoint set” with Path Compression and Union by Rank
#### Time Complexity : ```O(E⋅α(n))```, iterate through every edge, and perform the ```union``` method which takes ```O(α(n))```, where ```α(n)``` is the __inverse Ackermann__ function
#### Space Complexity: ```O(N)```, extra memory space required to build adjacency list of N nodes

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [node for node in range(size)]
        self.rank = [1] * size
        self.count = size

    def find(self, x):
        '''
        root = x
        while x != self.root[root]:
            root = self.root[root]
        while x != root:
            self.root[x], x = root, self.root[x]
        return root
        '''
        if self.root[x] == x:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += root_y
            self.count -= 1
    
    def get_count(self):
        return self.count

class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        union_find = UnionFind(n)
        for row, col in edges:
            union_find.union(row, col)
        return union_find.get_count()
```
