## 261. Graph Valid Tree

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Disjoin Set``` ```Union-Find```

#### Difficulty: Medium

You have a graph of ```n``` nodes labeled from ```0``` to ```n - 1```. You are given an integer ```n``` and a list of ```edges``` where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates that there is an undirected edge between nodes a<sub>i</sub> and b<sub>i</sub> in the graph.

Return _```true``` if the edges of the given graph make up a valid tree, and ```false``` otherwise_.

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
