## [1319. Number of Operations to Make Network Connected](https://leetcode.com/problems/number-of-operations-to-make-network-connected/)

```Tag```: ```Breadth-First Search``` ```Depth-First Search```

#### Difficulty: Medium

There are ```n``` computers numbered from ```0``` to ```n - 1``` connected by ethernet cables ```connections``` forming a network where ```connections[i]``` = [a<sub>i</sub>, b<sub>i</sub>] represents a connection between computers a<sub>i</sub> and b<sub>i</sub>. Any computer can reach any other computer directly or indirectly through the network.

You are given an initial computer network ```connections```. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected.

Return _the minimum number of times you need to do this in order to make all the computers connected_. If it is not possible, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/227073123-e6f8ef8b-0625-4498-84a8-c2b31fd883a4.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/01/02/sample_1_1677.png)
```
Input: n = 4, connections = [[0,1],[0,2],[1,2]]
Output: 1
Explanation: Remove cable between computer 1 and 2 and place between computers 1 and 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/01/02/sample_2_1677.png)
```
Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]
Output: 2
```

__Example 3:__
```
Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2]]
Output: -1
Explanation: There are not enough cables.
```

__Constraints:__

- ```1 <= n <= 10^5```
- ```1 <= connections.length <= min(n * (n - 1) / 2, 10^5)```
- ```connections[i].length == 2```
- 0 <= a<sub>i</sub>, b<sub>i</sub> < n
- a<sub>i</sub> != b<sub>i</sub>
- There are no repeated connections.
- No two computers are connected by more than one cable.

---

### Depth-First Search

![image](https://leetcode.com/problems/number-of-operations-to-make-network-connected/Figures/1319/1319-1.png)

```Python
class Solution:
    def makeConnected(self, n: int, connections: List[List[int]]) -> int:
        if len(connections) < n - 1:
            return -1

        # Build the adjacency graph
        graph = collections.defaultdict(list)
        for u, v in connections:
            graph[u].append(v)
            graph[v].append(u)

        visited = set()

        def dfs(node):
            visited.add(node)
            for neighbor in graph[node]:
                if not neighbor in visited:
                    visited.add(neighbor)
                    dfs(neighbor)
        
        ans = 0
        for node in range(n):
            if not node in visited:
                ans += 1
                dfs(node)

        # If there are at least n - 1 edges, the solution is the number of connected components minus one. Otherwise, we return -1
        return ans - 1
```

### Breadth-First Search

```Python

```
