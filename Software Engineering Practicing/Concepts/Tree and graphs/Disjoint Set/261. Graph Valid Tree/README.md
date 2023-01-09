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

```Python
#Union-Find class
class UnionFind:
    def __init__(self, size):
        self.root = [node for node in range(size)]
        self.rank = [1] * size
    
    def find(self, x):
        root = x
        while root != self.root[root]:
            root = self.root[root]
        while x != root:
            self.root[x], x = root, self.root[x]
        return root

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if self.rank[root_x] > self.rank[root_y]:
                self.root[root_y] = root_x
                self.rank[root_x] += self.rank[root_y]
            else:
                self.root[root_y] = root_x
                self.rank[root_y] += self.rank[root_x]
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
