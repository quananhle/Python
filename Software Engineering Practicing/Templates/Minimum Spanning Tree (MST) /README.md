## [1584. Min Cost to Connect All Points](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Microsoft/1584.%20Min%20Cost%20to%20Connect%20All%20Points)

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
