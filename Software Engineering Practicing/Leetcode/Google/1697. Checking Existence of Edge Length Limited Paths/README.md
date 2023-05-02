## [1697. Checking Existence of Edge Length Limited Paths](https://leetcode.com/problems/checking-existence-of-edge-length-limited-paths/)

```Tag```: ```Union Find```

#### Difficulty: Hard

An undirected graph of ```n``` nodes is defined by ```edgeList```, where ```edgeList[i]``` = [u<sub>i</sub>, v<su>i</sub>, dis<sub>i</sub>] denotes an edge between nodes u<sub>i</sub> and v<sub>i</sub> with distance dis<sub>i</sub>. Note that there may be multiple edges between two nodes.

Given an array ```queries```, where ```queries[j]``` = [p<sub>j</sub>, q<sub>j</sub>, limit<sub>j</sub>], your task is to determine for each ```queries[j]``` whether there is a path between p<sub>j</sub> and q<sub>j</sub> such that each edge on the path has a distance strictly less than limit<sub>j</sub> .

Return _a boolean array answer, where ```answer.length == queries.length``` and the j<sup>th</sup> value of answer is ```true``` if there is a path for ```queries[j]``` is ```true```, and ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/235581334-1640db86-f60f-4836-a36d-a6b5179dba83.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/08/h.png)
```
Input: n = 3, edgeList = [[0,1,2],[1,2,4],[2,0,8],[1,0,16]], queries = [[0,1,2],[0,2,5]]
Output: [false,true]
Explanation: The above figure shows the given graph. Note that there are two overlapping edges between 0 and 1 with distances 2 and 16.
For the first query, between 0 and 1 there is no path where each distance is less than 2, thus we return false for this query.
For the second query, there is a path (0 -> 1 -> 2) of two edges with distances less than 5, thus we return true for this query.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/08/q.png)
```
Input: n = 5, edgeList = [[0,1,10],[1,2,5],[2,3,9],[3,4,13]], queries = [[0,4,14],[1,4,13]]
Output: [true,false]
Exaplanation: The above figure shows the given graph.
```

__Constraints:__

- ```2 <= n <= 10^5```
- ```1 <= edgeList.length, queries.length <= 10^5```
- ```edgeList[i].length == 3```
- ```queries[j].length == 3```
- ```0 <= ui, vi, pj, qj <= n - 1```
- ```ui != vi```
- ```pj != qj```
- ```1 <= disi, limitj <= 10^9```
- There may be multiple edges between two nodes.

---

### Union Find

__Algorithm__

1. Create a ```UnionFind``` class:

- It has two arrays: ```group``` and ```rank``` which store the ```group``` and ```rank``` of the tree of index ```i``` respectively.
- And three methods:
  - ```find(node)``` to find the group of ```node```,
  - ```join(node1, node2)``` to include both nodes in the same component, and
  - ```areConnected(node1, node2)``` to check if both nodes belong to the same component.

2. Initialize variables:

- ```uf```, a ```UnionFind``` class's object with ```n``` size:
- ```queriesCount```, an integer variable denoting the size of the ```queries``` array.
- ```answer```, an array with ```queriesCount``` size.
- ```queriesWithIndex```, an array storing all the queries of the ```queries``` array with their original indices.
- ```edgesIndex```, integer variable with initial value ```0```.

3. Sort all edges in the ```edgeList``` array in increasing order of their edge weights.

4. Sort all queries in the ```queriesWithIndex``` array in increasing order of the limit of edge allowed.

5. Iterate on ```queriesWithIndex``` array, for each query:

- Get the nodes ```p``` and ```q```, the limit ```limit``` and the original index ```queryOriginalIndex``` of the current query.
- While ```edgesIndex``` is less than the number of edges and its edge weight is less than ```limit```, join the nodes in the edge using ```UnionFind```'s ```join``` method ```uf.join(node1, node2)``` and increment ```edgesIndex``` by ```1```.
- Check if both nodes ```p```, and ```q``` belong to the same component using ```UnionFind```'s ```uf.areConnected(p, q)``` method. If yes, set ```ans[queryOriginalIndex]``` to ```true```, otherwise to ```false```.

6. Return ```ans```.

```Python
class UnionFind:
    def __init__(self, size: int):
        self.group = [0] * size
        self.rank = [0] * size
        for i in range(size):
            self.group[i] = i

    def find(self, node: int) -> int:
        if self.group[node] != node:
            self.group[node] = self.find(self.group[node])
        return self.group[node]

    def join(self, node1: int, node2: int):
        group1 = self.find(node1)
        group2 = self.find(node2)
        
        # node1 and node2 already belong to same group.
        if group1 == group2:
            return

        if self.rank[group1] > self.rank[group2]:
            self.group[group2] = group1
        elif self.rank[group1] < self.rank[group2]:
            self.group[group1] = group2
        else:
            self.group[group1] = group2
            self.rank[group2] += 1
    
    def are_connected(self, node1: int, node2: int) -> bool:
        return self.find(node1) == self.find(node2)

class Solution:
    def distanceLimitedPathsExist(self, n: int, edge_list: List[List[int]], queries: List[List[int]]) -> List[bool]:
        uf = UnionFind(n)
        queries_count = len(queries)
        answer = [False] * queries_count
        
        # Store original indices with all queries.
        queries_with_index = [[] for _ in range(queries_count)]
        for i in range(queries_count):
            queries_with_index[i] = queries[i]
            queries_with_index[i].append(i)
        
        # Sort all edges in increasing order of their edge weights.
        edge_list.sort(key=lambda x: x[2])
        # Sort all queries in increasing order of the limit of edge allowed.
        queries_with_index.sort(key=lambda x: x[2])
        
        edges_index = 0
        
        # Iterate on each query one by one.
        for [p, q, limit, query_original_index] in queries_with_index:
            # We can attach all edges which satisfy the limit given by the query.
            while edges_index < len(edge_list) and edge_list[edges_index][2] < limit:
                node1 = edge_list[edges_index][0]
                node2 = edge_list[edges_index][1]
                uf.join(node1, node2)
                edges_index += 1
            
            # If both nodes belong to the same component, it means we can reach them. 
            answer[query_original_index] = uf.are_connected(p, q)

        return answer
```
