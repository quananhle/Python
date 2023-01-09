## 261. Graph Valid Tree

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Disjoin Set``` ```Union-Find```

#### Difficulty: Medium

You have a graph of ```n``` nodes labeled from ```0``` to ```n - 1```. You are given an integer ```n``` and a list of ```edges``` where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates that there is an undirected edge between nodes a<sub>i</sub> and b<sub>i</sub> in the graph.

Return _```true``` if the edges of the given graph make up a valid tree, and ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/211407427-4e6b068c-8f02-4471-9563-18f7a72867bc.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/12/tree1-graph.jpg)
```
Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/12/tree2-graph.jpg)
```
Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
Output: false
```

__Constraints:__
```
1 <= n <= 2000
0 <= edges.length <= 5000
edges[i].length == 2
0 <= ai, bi < n
ai != bi
There are no self-loops or repeated edges.
```

---

### Iterative Depth-First Search

#### Time Complexity : ```O(N + E)```, traverse through stack/queue and edges
#### Space Complexity: ```O(N)```, build stack/queue of size N and adjacency list of size of edges

A graph, ```G```, is a tree iff the following two conditions are met:

- ```G``` is fully connected. In other words, for every pair of nodes in ```G```, there is a path between them.
- ```G``` contains no cycles. In other words, there is exactly one path between each pair of nodes in ```G```.

```Adjacency List```, ```Adjacency Matrix```, ```Linked Representation```

Convert the input into an __adjacency list__

```Java
// Create a new list of lists.
List<List<Integer>> adjacencyList = new ArrayList<>();
// Initialise an empty list for each node.
for (int i = 0; i < n; i++) {
    adjacencyList.add(new ArrayList<>());
}
// Go through the edge list, populating the adjacency list.
for (int[] edge : edges) {
    adjacencyList.get(edge[0]).add(edge[1]);
    adjacencyList.get(edge[1]).add(edge[0]);
}
```

- An adjacency matrix would be an acceptable, although not ideal, representation for this problem. Often, we'd only use an adjacency matrix if we know that the number of edges is substantially higher than the number of nodes. We have no reason to believe that is the case here.
- A linked representation, where you make actual nodes objects, would be an overly complicated representation and could suggest to an interviewer that you have a limited understanding of adjacency lists and adjacency matrices. They are not commonly used in interview questions.

![image](https://leetcode.com/problems/graph-valid-tree/solutions/539585/Figures/261/trivial_cycles.png)

```Python
class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        # Iterative Depth-First Search
        '''
            0   1   2   3   4
        0   1   1   1   1   0            
        
        1   1   1   0   0   1

        2   1   0   1   0   0

        3   1   0   0   1   0

        4   0   1   0   0   1
        '''
        if len(edges) != n - 1:
            return False
        adjacency_list = [[] for _ in range(n)]
        for x, y in edges:
            adjacency_list[x].append(y)
            adjacency_list[y].append(x)
        self.root = {0:-1}
        stack = [0]
        while stack:
            node = stack.pop()
            for neighbor in adjacency_list[node]:
                # Skip if the node is the root node
                if neighbor == self.root[node]:
                    continue
                if neighbor in self.root:
                    return False
                self.root[neighbor] = node
                stack.append(neighbor)
        return len(self.root) == n
```

### Iterative Breadth-First Search

```Python
class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        # Iterative Depth-First Search
        '''
            0   1   2   3   4
        0   1   1   1   1   0            
        
        1   1   1   0   0   1

        2   1   0   1   0   0

        3   1   0   0   1   0

        4   0   1   0   0   1
        '''
        if len(edges) != n - 1:
            return False
        adjacency_list = [[] for _ in range(n)]
        # Look up the adjacent (immediate neighbors) of x and y node
        for x, y in edges:
            adjacency_list[x].append(y)
            adjacency_list[y].append(x)
        
        parents = {0 : -1}
        queue = collections.deque([0])

        while queue:
            node = queue.popleft()
            for neighbor in adjacency_list[node]:
                if neighbor == parents[node]:
                    continue
                if neighbor in parents:
                    return False
                # Keep track of the root node of the neighbor node
                parents[neighbor] = node
                queue.append(neighbor)
        return len(parents) == n
```

### Advanced graph theory with Iterative Depth-First Search
#### Time Complexity : ```O(N)```, traverse through stack/queue
#### Space Complexity: ```O(N)```, build stack/queue

```Python
class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        # Iterative Depth-First Search
        '''
            0   1   2   3   4
        0   1   1   1   1   0            
        
        1   1   1   0   0   1

        2   1   0   1   0   0

        3   1   0   0   1   0

        4   0   1   0   0   1
        '''
        if len(edges) != n - 1:
            return False
        adjacency_list = [[] for _ in range(n)]
        # Look up the adjacent (immediate neighbors) of x and y node
        for x, y in edges:
            adjacency_list[x].append(y)
            adjacency_list[y].append(x)
        
        seen = {0}
        stack = [0]

        while stack:
            node = stack.pop()
            for neighbor in adjacency_list[node]:
                if neighbor in seen:
                    continue
                seen.add(neighbor)
                stack.append(neighbor)
        return len(seen) == n
```

### Union-Find

```Python
#Union-Find class
class UnionFind:
    def __init__(self, size):
        self.root = [node for node in range(size)]

    # find() traces up the parent links until it finds the root node for x, and returns that root.
    def find(self, x):
        if x != self.root[x]:
            x = self.root[x]
        return x

    # union() check if merge happened then return True, otherwise return False
    def union(self, x, y):
        # Find the root node of x and y in the set
        root_x = self.find(x)
        root_y = self.find(y)
        # Check if x and y are already in the same set
        if root_x == root_y:
            # Return False and check the another edge
            return False
        # Merge the sets containing x and y
        self.root[root_x] = root_y
        return True

class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        # Checking if the graph is fully connected, and if it contains n - 1 edges, then it is a tree
        if len(edges) != n - 1:
            return False
        union_find = UnionFind(n)
        # Check each edge
        for x, y in edges:
            # Check if a merge happens, a cycle found, False
            if not union_find.union(x, y):
                return False
        # If ther is no merge, all nodes in the same set and share the same root node, True
        return True
```

### Optimized “disjoint set” with Path Compression and Union by Rank
#### Time Complexity : ```O(N⋅α(N))```, ```α(N)``` in "practice" it is effectively O(1)
#### Space Compelxity: ```O(N)```, extra memory space needed to build root

```Python
# Union-Find class
class UnionFind:
    def __init__(self, size):
        # Initializing all the sets
        self.root = [node for node in range(size)]
        # Initilize the rank to keep track the size of each set
        self.rank = [1] * size
    
    # Optimized find() method with path compression
    def find(self, x):
        root = x
        # Trace up the parent links until it finds the root node for x
        while root != self.root[root]:
            root = self.root[root]
        print ("self.root: ", self.root)
        # Check the node which is not the root node
        while x != root:
            # Set each node to point directly at x
            self.root[x], x = root, self.root[x]
        print ("Path compression: ", self.root)
        return root

    def union(self, x, y):
        print (x, y)
        # Find the root node of x and y
        root_x = self.find(x)
        root_y = self.find(y)
        print (root_x, root_y)        
        # Check if the root of x and root of y are not in the same set
        if root_x != root_y:
            # Ensure the set with larger size remains the root
            # If the set of root of x has larger size than the set of root of y
            if self.rank[root_x] > self.rank[root_y]:
                # Root of x is the overall root
                self.root[root_y] = root_x
                # Update the size of the set rooted at x the total of 2 sets 
                self.rank[root_x] += self.rank[root_y]
            else:
                # Root of y is the overall root
                self.root[root_x] = root_y
                # Update the size of the set rooted at y the total of 2 sets 
                self.rank[root_y] += self.rank[root_x]
            print (self.rank)
            return True
        else:
            return False

class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        # Checking if the graph is fully connected, and if it contains n - 1 edges, then it is a tree
        if len(edges) != n - 1:
            return False
        union_find = UnionFind(n)
        for row, col in edges:
            if not union_find.union(row, col):
                return False
        return True
```
