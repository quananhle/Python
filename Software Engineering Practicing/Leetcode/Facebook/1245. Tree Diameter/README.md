## [1245. Tree Diameter](https://leetcode.com/problems/tree-diameter)

```Tag```: ```Graph``` ```Breadth-First Search``` ```Depth-First Search```

#### Difficulty: Medium

The __diameter__ of a tree is the __number of edges__ in the longest path in that tree.

There is an undirected tree of ```n``` nodes labeled from ```0``` to ```n - 1```. You are given a 2D array ```edges``` where ```edges.length == n - 1``` and $edges[i] = [a_i, b_i]$ indicates that there is an undirected edge between nodes $a_i$ and $b_i$ in the tree.

Return _the __diameter__ of the tree_.

![image](https://github.com/quananhle/Python/assets/35042430/d859f0cb-5017-4411-ac37-ea2be34e35cf)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/01/19/tree1.jpg)
```
Input: edges = [[0,1],[0,2]]
Output: 2
Explanation: The longest path of the tree is the path 1 - 0 - 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/01/19/tree2.jpg)
```
Input: edges = [[0,1],[1,2],[2,3],[1,4],[4,5]]
Output: 4
Explanation: The longest path of the tree is the path 3 - 2 - 1 - 4 - 5.
```

__Constraints:__

- $n == edges.length + 1$
- $1 \le n \le 10^4$
- $0 \le a_i, b_i \lt n$
- $a_i \neq b_i$

---

### Breadth-First Search

```Python
class Solution:
    def treeDiameter(self, edges: List[List[int]]) -> int:
        adjacent_graph = collections.defaultdict(set)
        for v, e in edges:
            adjacent_graph[v].add(e)
            adjacent_graph[e].add(v)

        def bfs(start):
            visited = set()
            visited.add(start)
            queue = collections.deque([start])
            distance = -1
            last_node = None
            while queue:
                next_queue = collections.deque()
                while queue:
                    curr = queue.popleft()
                    for next in adjacent_graph[curr]:
                        if not next in visited:
                            visited.add(next)
                            next_queue.append(next)
                            last_node = next
                distance += 1
                queue = next_queue
            
            return last_node, distance

        farthest_node, _ = bfs(0)
        another_farthest_node, distance = bfs(farthest_node)
        return distance
```
