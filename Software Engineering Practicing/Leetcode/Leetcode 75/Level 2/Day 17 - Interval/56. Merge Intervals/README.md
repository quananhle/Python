## [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/?envType=study-plan&id=level-2)

```Tag```: ```String & Array``` ```Sorting``` ```Union-Find```

#### Difficulty: Medium

Given an array of ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>], merge all overlapping intervals, and return _an array of the non-overlapping intervals that cover all the intervals in the input_.

![image](https://user-images.githubusercontent.com/35042430/226142064-d05d537d-bc61-4e46-b8f2-8b9fa6c69776.png)

---

__Example 1:__
```
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
```

__Example 2:__
```
Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
```

__Constraints:__

- ```1 <= intervals.length <= 10^4```
- ```intervals[i].length == 2```
- 0 <= start<sub>i</sub> <= end<sub>i</sub> <= 10<sup>4</sup>

---

### Sorting

![image](https://leetcode.com/problems/merge-intervals/Figures/56/sort.png)

- __Time complexity__: ```O(nlogn)```
- __Space complexity__: ```O(nlogn)```

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        res = list()
        for interval in intervals:
            curr_lower = interval[0]
            curr_upper = interval[1]
            # Check if the ouput array is empty
            if not res:
                res.append(interval)
            else:
                last_lower = res[-1][0]
                last_upper = res[-1][1]
                # Check the upper boundary of the leftmost interval in output array is smaller than the lower boundary of the current interval
                if last_upper < curr_lower:
                # Insert the interval into the final input array
                    res.append(interval)
                # Otherwise, the upper boundary of the leftmost interval in output array is larger than the lower boundary of the current interval
                else:
                    # Merge the intervals
                    merged_interval = [min(last_lower, curr_lower), max(last_upper, curr_upper)]
                    res[-1] = merged_interval
        return res
```

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        res = list()
        for interval in intervals:
            if not res or res[-1][1] < interval[0]:
                res.append(interval)
            else:
                res[-1] = [res[-1][0], max(res[-1][1], interval[1])]
        return res
```

### Graph

#### Connected Components

If we draw a graph (with intervals as nodes) that contains undirected edges between all pairs of intervals that overlap, then all intervals in each connected component of the graph can be merged into a single interval.

![image](https://leetcode.com/problems/merge-intervals/Figures/56/component.png)

- __Time complexity__: O(n<sup>2</sup>)
- __Space complexity__: O(n<sup>2</sup>)

```Python
class Solution:
    def get_components(self, graph, intervals):
        visited = set()
        components = 0
        nodes = collections.defaultdict(list)

        def mark_visited(start):
            stack = [start]
            while stack:
                node = tuple(stack.pop())
                if not node in visited:
                    visited.add(node)
                    nodes[components].append(node)
                    stack.extend(graph[node])
        for interval in intervals:
            if not tuple(interval) in visited:
                mark_visited(interval)
                components += 1
        
        return nodes, components

    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        def check_overlap(a, b):
            return a[0] <= b[1] and b[0] <= a[1]

        def build_graph(intervals):
            graph = collections.defaultdict(list)
            # Build the adjacency list
            for idx, interval in enumerate(intervals):
                for i in range(idx + 1, len(intervals)):
                    if check_overlap(interval, intervals[i]):
                        graph[tuple(interval)].append(intervals[i])
                        graph[tuple(intervals[i])].append(interval)
            return graph

        def merge_nodes(nodes):
            min_start = min(node[0] for node in nodes)
            max_end = max(node[1] for node in nodes)
            return [min_start, max_end]

        graph = build_graph(intervals)
        nodes, components = self.get_components(graph, intervals)
        return [merge_nodes(nodes[comp]) for comp in range(components)]
```

#### Union-Find

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        
    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def merge(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
            elif self.rank[root_x] > self.rank[root_y]:
                self.root[root_y] = root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += 1

class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        n = len(intervals)
        uf = UnionFind(n)
        
        intervals = sorted(intervals, key=lambda x:x[0])
        
        for i in range(n):
            for j in range(i + 1, n):
                if intervals[i][1] >= intervals[j][0]:
                    uf.merge(i, j)
                else:
                    break
        
        m = {}
        for i in range(n):
            p = uf.find(i)
            if p in m:
                m[p] = [min(m[p][0], intervals[i][0]), max(m[p][1], intervals[i][1])]
            else:
                m[p] = intervals[i]
                
        return list(m.values())
```
