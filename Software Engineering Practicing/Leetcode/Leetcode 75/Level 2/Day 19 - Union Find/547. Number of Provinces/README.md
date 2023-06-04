## [547. Number of Provinces](https://leetcode.com/problems/number-of-provinces/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

### Difficulty: Medium

There are ```n``` cities. Some of them are connected, while some are not. If city ```a``` is connected directly with city ```b```, and city ```b``` is connected directly with city ```c```, then city ```a``` is connected indirectly with city ```c```.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an ```n x n``` matrix ```isConnected``` where ```isConnected[i][j] = 1``` if the i<sup>th</sup> city and the j<sup>th</sup> city are directly connected, and ```isConnected[i][j] = 0``` otherwise.

Return _the total number of __provinces___.

![image](https://user-images.githubusercontent.com/35042430/211407318-7a2b870e-6643-4c41-8303-736f96aed004.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/24/graph1.jpg)
```
Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/24/graph2.jpg)
```
Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3
```

__Constraints:__
```
1 <= n <= 200
n == isConnected.length
n == isConnected[i].length
isConnected[i][j] is 1 or 0.
isConnected[i][i] == 1
isConnected[i][j] == isConnected[j][i]
```

---

### Depth-First Search

The given matrix can be viewed as the __Adjacency Matrix__ of a graph. By viewing the matrix in such a manner, our problem reduces to the problem of __finding the number of connected components in an undirected graph__.

![image](https://user-images.githubusercontent.com/35042430/211258836-93da295a-a309-4311-a2e2-eb2fcf183d9f.png)

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        # Depth-First Search
        #### Time Complexity: O(N^2), traverse through the entire 2D array
        #### Space Complexity: O(N), extra memory space required to build visited
        ROWS, COLS = len(isConnected), len(isConnected[0])
        visited = [0] * ROWS

        def dfs(row):
            for col in range(COLS):
                if isConnected[row][col] == 1 and visited[col] == 0:
                    visited[col] = 1
                    dfs(col)

        count = 0
        for row in range(ROWS):
            if visited[row] == 0:
                dfs(row)
                count += 1
        return count
```

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        n = len(isConnected)
        graph = collections.defaultdict(list)

        # Build the adjacent graph
        for i in range(n):
            for j in range(n):
                if isConnected[i][j] == 1:
                    graph[i].append(j)
        
        visited = set()
        ans = 0

        def dfs(curr):
            visited.add(curr)
            # Traverse all connected paths from the current node
            for neighbor in graph[curr]:
                if not neighbor in visited:
                    dfs(neighbor)

        for i in range(n):
            if not i in visited:
                ans += 1
                dfs(i)

        return ans
```

### Breadth-First Search

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        # Breath-First Search
        #### Time Complexity: O(N^2), traverse through the entire 2D array
        #### Space Complexity: O(N), extra memory space required to build visited  
        ROWS, COLS = len(isConnected), len(isConnected[0])
        visited = [0] * ROWS
        queue = collections.deque()
        count = 0
        for row in range(ROWS):
            if visited[row] == 0:
                queue.append(row)
                while queue:
                    row = queue.pop()
                    visited[row] = 1
                    for col in range(COLS):
                        if isConnected[row][col] == 1 and visited[col] == 0:
                            queue.append(col)
                count += 1
        return count
```

### Union-Find

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
            # Union Find
            #### Time Complexity: O(N^3), union and find take o(N) time while traversing through the entire 2D array
            #### Space Complexity: O(N), extra memory space required to build root        
            ROWS, COLS = len(isConnected), len(isConnected[0])
            root = [-1] * ROWS

            def find(x):   
                if root[x] == -1:
                    return x
                return find(root[x])

            def union(x, y):
                root_x = find(x)
                root_y = find(y)
                if root_x != root_y:
                    root[root_x] = root_y

            for row in range(ROWS):
                for col in range(COLS):
                    if isConnected[row][col] == 1 and row != col:
                        union(row, col)
            count = 0
            for row in range(ROWS):
                if root[row] == -1:
                    count += 1
            return count
```

### Optimized “disjoint set” with Path Compression and Union by Rank

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
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        if not isConnected or len(isConnected) == 0:
            return 0
        n = len(isConnected)
        uf = UnionFind(n)
        for row in range(n):
            for col in range(row + 1, n):
                if isConnected[row][col] == 1:
                    uf.union(row, col)
        return uf.getCount()
```

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [node for node in range(size)]
        self.rank = [1] * size
        self.count = size

    def find(self, x):
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
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        union_find = UnionFind(len(isConnected))
        for row in range(len(isConnected)):
            for col in range(len(isConnected[0])):
                if isConnected[row][col] == 1:
                    union_find.union(row, col)
        return union_find.get_count()
```
