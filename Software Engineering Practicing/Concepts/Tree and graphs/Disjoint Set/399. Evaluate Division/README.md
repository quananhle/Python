## [399. Evaluate Division](https://leetcode.com/problems/evaluate-division/)

```Tag```: ```Depth-First Search``` ```Union-Find```

#### Difficulty: Medium

You are given an array of variable pairs ```equations``` and an array of real numbers ```values```, where ```equations[i]``` = [A<sub>i</sub>, B<sub>i</sub>] and ```values[i]``` represent the equation A<sub>i</sub> / B<sub>i</sub> = ```values[i]```. Each A<sub>i</sub> or B<sub>i</sub> is a string that represents a single variable.

You are also given some ```queries```, where ```queries[j]``` = [C<sub>j</sub>, D<sub>j</sub>] represents the j<sup>th</sup> query where you must find the answer for C<sub>j</sub> / D<sub>j</sub> = ?.

Return _the answers to all queries_. If a single answer cannot be determined, return ```-1.0```.

__Note__: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

![image](https://user-images.githubusercontent.com/35042430/211466724-c85e2c66-7c24-47a7-8ce0-45f7c72286bf.png)

---

__Example 1:__
```
Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
Explanation: 
Given: a / b = 2.0, b / c = 3.0
queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
return: [6.0, 0.5, -1.0, 1.0, -1.0 ]
```

__Example 2:__
```
Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
Output: [3.75000,0.40000,5.00000,0.20000]
```

__Example 3:__
```
Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
Output: [0.50000,2.00000,-1.00000,-1.00000]
```

__Constraints:__

- ```1 <= equations.length <= 20```
- ```equations[i].length == 2```
- ```1 <= Ai.length, Bi.length <= 5```
- ```values.length == equations.length```
- ```0.0 < values[i] <= 20.0```
- ```1 <= queries.length <= 20```
- ```queries[i].length == 2```
- ```1 <= Cj.length, Dj.length <= 5```
- ```Ai```, ```Bi```, ```Cj```, ```Dj``` consist of lower case English letters and digits.


---

![image](https://leetcode.com/problems/evaluate-division/Figures/399/399_graph_example.png)

### Depth-First Search

#### Time Complexity : $O(M⋅N)$, traverse through the graph of size while traversing through the queries
#### Space Complexity: $O(N)$, extra memory space to build graph

```Python
class Solution:
    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        # Build the adjacency graph
        graph = collections.defaultdict(set)
        for (u, v), val in zip(equations, values):
            graph[u].add((v, val))
            graph[v].add((u, 1 / val))
        
        def dfs(numerator, denominator):
            # Base cases
            if not numerator in graph:
                return -1.0
            elif numerator == denominator:
                return 1.0

            visited.add(numerator)

            for path, val in graph[numerator]:
                # Check if equation and value is already given
                if path == denominator:
                    return val
                else:
                    if not path in visited:
                        output = dfs(path, denominator)
                        if output != -1.0:
                            return val * output
            return -1.0

        res = list()
        for numerator, denominator in queries:
            visited = set()
            ans = dfs(numerator, denominator)
            res.append(ans)
        return res
```

```Python
class Solution:
    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        # Depth-First Search
        visited = set()
        graph = collections.defaultdict(collections.defaultdict)
        # Build the graph out of the list of input equations
        for (dividend, divisor), value in zip(equations, values):
            # Each equation corresponds to two edges in the graph
            graph[dividend][divisor] = value
            graph[divisor][dividend] = 1 / value

        def dfs(curr_node, target_node, acc):
            visited.add(curr_node)
            ret = -1.0
            neighbors = graph[curr_node]
            if target_node in neighbors:
                ret = acc * neighbors[target_node]
            else:
                for neighbor, value in neighbors.items():
                    if neighbor in visited:
                        continue
                    ret = dfs(neighbor, target_node, acc * value)
                    if ret != -1.0:
                        break
            visited.remove(curr_node)
            return ret

        res = list()
        for dividend, divisor in queries:
            # Check if either of the nodes does not exist in the graph
            if not dividend in graph and not divisor in graph:
                ret = -1.0
            # Check if the origin and the destination are the same nodes
            elif dividend == divisor:
                ret = 1.0
            else:
                # Backtracking searching for path between two variables
                ret = dfs(dividend, divisor, 1)
            res.append(ret)

        return res
```

### Optimized “disjoint set” with Path Compression and Union by Rank

```Python
class Solution:
    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        graph = {}

        def find(x):
            if not x in graph:
                graph[x] = (x, 1)
            group_id, node_weight = graph[x]
            if group_id != x:
                new_group_id, group_weight = find(group_id)
                graph[x] = (new_group_id, node_weight * group_weight)
            return graph[x]
        
        def union(dividend, divisor, value):
            dividend_gid, dividend_weight = find(dividend)
            divisor_gid, divisor_weight = find(divisor)
            if dividend_gid != divisor_gid:
                # Merge the two groups together by attaching the dividend group to the one of divisor            
                graph[dividend_gid] = (divisor_gid, divisor_weight * value / dividend_weight)     
        
        # Build the union group
        for (dividend, divisor), value in zip(equations, values):
            union(dividend, divisor, value)
        
        res = list()
        for (dividend, divisor) in queries:
            if not dividend in graph or not divisor in graph:
                res.append(-1.0)
            else:
                dividend_gid, dividend_weight = find(dividend)
                divisor_gid, divisor_weight = find(divisor)
                if dividend_gid != divisor_gid:
                    res.append(-1.0)
                else:
                    res.append(dividend_weight / divisor_weight)
        return res
```

```Python
class UnionFind:
    def __init__(self, size):
        self.root = collections.defaultdict(int)
        self.rank = collections.defaultdict(lambda: 1)
        self.size = size
    
    def find(self, x):
        if not x in self.root:
            self.root[x] = x
        if x != self.root[x]:
            self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x, y, val):
        root_x = self.find(x)
        root_y = self.find(y)
        ratio = self.rank[y] * val / self.rank[x]
        for node, root in self.root.items():
            if root_x == root:
                self.root[node] = root_y
                self.rank[node] *= ratio
            self.size -= 1
        
    def get_size(self):
        return self.size
    
    def connected(self, x, y):
        return self.find(x) == self.find(y)
    

class Solution:
    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        res = list()
        n = len(equations)
        uf = UnionFind(n)
        
        graph = collections.defaultdict(set)
        for (u, v), val in zip(equations, values):
            uf.union(u, v, val)
        
        for x, y in queries:
            if not x in uf.rank or not y in uf.rank or not uf.connected(x, y):
                res.append(-1.0)
            else:
                res.append(uf.rank[x] / uf.rank[y])
        
        return res
```
 
