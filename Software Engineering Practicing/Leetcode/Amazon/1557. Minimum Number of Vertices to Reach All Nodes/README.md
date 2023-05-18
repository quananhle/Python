## [1557. Minimum Number of Vertices to Reach All Nodes](https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/)

```Tag```: ```Graph``` ```Hash Map``` ```Hash Set```

#### Difficulty: Medium

Given a __directed acyclic graph__, with ```n``` vertices numbered from ```0``` to ```n-1```, and an array edges where ```edges[i]``` = [from<sub>i</sub>, to<sub>i</sub>] represents a directed edge from node from<sub>i</sub> to node to<sub>i</sub>.

Find _the smallest set of vertices from which all nodes in the graph are reachable_. It's guaranteed that a unique solution exists.

Notice that you can return the vertices in any order.

![image](https://github.com/quananhle/Python/assets/35042430/c65c284d-dc3b-441b-8799-919c1cbcc8ba)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/07/07/untitled22.png)
```
Input: n = 6, edges = [[0,1],[0,2],[2,5],[3,4],[4,2]]
Output: [0,3]
Explanation: It's not possible to reach all the nodes from a single vertex. From 0 we can reach [0,1,2,5]. From 3 we can reach [3,4,2,5]. So we output [0,3].
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/07/07/untitled.png)
```
Input: n = 5, edges = [[0,1],[2,1],[3,1],[1,4],[2,4]]
Output: [0,2,3]
Explanation: Notice that vertices 0, 3 and 2 are not reachable from any other node, so we must include them. Also any of these vertices can reach nodes 1 and 4.
```

__Constraints:__

- ```2 <= n <= 10^5```
- ```1 <= edges.length <= min(10^5, n * (n - 1) / 2)```
- ```edges[i].length == 2```
- ```0 <= fromi, toi < n```
- ```All pairs (from<sub>i</sub>, to<sub>i</sub>) are distinct.

---

![image](https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/Figures/1557/1557A.png)

From this discussion, one thing is clear: any vertex that has an edge in-coming from some other vertex should not be part of the answer.

- __Time complexity__: ```O(N + E)```
- __Space complexity__: ```O(N)```

### Hash Map

```Python
class Solution:
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        graph = collections.defaultdict(int)
        for u, v in edges:
            graph[v] += 1
        return [node for node in range(n) if not node in graph]
```

### Hash Set

```Python
class Solution:
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        graph = set()
        for _, v in edges:
            graph.add(v)
        return [node for node in range(n) if not node in graph]
```

### One Liner

```Python
class Solution:
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        return set(range(n)) - set(v for _, v in edges)
```

### Boolean List

```Python
class Solution:
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        graph = [False for _ in range(n)]
        for _, v in edges:
            graph[v] = True
        return [node for node in range(n) if not graph[node]]
```
