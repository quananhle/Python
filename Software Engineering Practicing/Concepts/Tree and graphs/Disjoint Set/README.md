# Disjoint Set

The main idea of a ```disjoint set``` is to have all connected vertices have the same parent node or root node, whether directly or indirectly connected. To check if two vertices are connected, we only need to check if they have the same root node.

The two most important functions for the ```disjoint set``` data structure are the ```find``` function and the ```union``` function. The ```find``` function locates the root node of a given vertex. The ```union``` function connects two previously unconnected vertices by giving them the same root node. There is another important function named ```connected```, which checks the “connectivity” of two vertices. The ```find``` and ```union``` functions are essential for any question that uses the “disjoint set” data structure.

## Implementation of the Optimized “disjoint set” with Path Compression and Union by Rank

```Python
# UnionFind class
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        # Use a rank array to record the height of each vertex, i.e., the "rank" of each vertex.
        # The initial "rank" of each vertex is 1, because each of them is
        # a standalone vertex with no connection to other vertices.
        self.rank = [1] * size

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

    def connected(self, x, y):
        return self.find(x) == self.find(y)
```

## Tips for using the “disjoint sets” data structure

The code for the disjoint set is highly modularized. You might want to become familiar with the implementation. I would highly recommend that you understand and memorize the implementation of ```“disjoint set with path compression and union by rank”```.

Finally, we strongly encourage you to solve the exercise problems using the above-mentioned implementation of the “disjoint set” data structure. Some of these problems can be solved using other data structures and algorithms, but we highly recommend that you practice solving them using the “disjoint set” data structure.
