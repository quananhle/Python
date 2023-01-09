## 323. Number of Connected Components in an Undirected Graph

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

#### Difficulty: Medium

You have a graph of ```n``` nodes. You are given an integer ```n``` and an array ```edges``` where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates that there is an edge between a<sub>i</sub> and b<sub>i</sub> in the graph.

Return _the number of connected components in the graph._

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/14/conn1-graph.jpg)
```
Input: n = 5, edges = [[0,1],[1,2],[3,4]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/14/conn2-graph.jpg)
```
Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
Output: 1
```

__Constraints:__
```
1 <= n <= 2000
1 <= edges.length <= 5000
edges[i].length == 2
0 <= ai <= bi < n
ai != bi
There are no repeated edges.
```

---

### Depth-First Search

```Python
class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        # Depth-First Search
        #### Time Complexity : O((N * N)^2), traverse through the 2D array of size N x N
        #### Space Complexity: O(N^2), extra memory space required to build a 2D array of N rows and N columns
        '''
            0   1   2   3   4
        0   1   1   0   0   0

        1   1   1   1   0   0

        2   0   1   1   0   0

        3   0   0   0   1   1

        4   0   0   0   1   1

        [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]

        '''
        graph = [[0] * n for _ in range(n)]
        for row, col in edges:
            # [[1, 1, 0, 0, 0], [1, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 1], [0, 0, 0, 1, 1]]
            # Mark where there is a link between two nodes or two nodes are directly connected
            graph[row][col] = 1           # [[0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 0, 0]]
            graph[col][row] = 1           # [[0, 0, 0, 0, 0], [1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0]]
            graph[row][row] = 1           # [[1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0], [0, 0, 0, 0, 0]]
            graph[col][col] = 1           # [[0, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1]]
        ROWS, COLS = len(graph), len(graph[0])        
        visited = [0] * ROWS

        def dfs(row):
            for col in range(COLS):
                if graph[row][col] == 1 and visited[col] == 0:
                    visited[col] = 1
                    dfs(col)

        count = 0
        for row in range(ROWS):
            if visited[row] == 0:
                dfs(row)
                count += 1
        return count
```
