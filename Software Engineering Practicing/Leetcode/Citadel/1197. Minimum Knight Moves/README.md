## [1197. Minimum Knight Moves](https://leetcode.com/problems/minimum-knight-moves)

```Tag```: ```Breadth-First Search``` ```Dijkstra's Algorithm``` ```Depth-First Search``` ```Dynamic Programming```

#### Difficulty: Medium

In an __infinite__ chess board with coordinates from ```-infinity``` to ```+infinity```, you have a __knight__ at square ```[0, 0]```.

A knight has ```8``` possible moves it can make, as illustrated below. Each move is two squares in a cardinal direction, then one square in an orthogonal direction.

![image](https://assets.leetcode.com/uploads/2018/10/12/knight.png)

Return _the minimum number of steps needed to move the knight to the square ```[x, y]```. It is guaranteed the answer exists__.

![image](https://github.com/quananhle/Python/assets/35042430/095d0bf8-6807-492a-bb18-f865a8012fa8)

---

__Example 1__:
```
Input: x = 2, y = 1
Output: 1
Explanation: [0, 0] → [2, 1]
```

__Example 2__:
```
Input: x = 5, y = 5
Output: 4
Explanation: [0, 0] → [2, 1] → [4, 2] → [3, 4] → [5, 5]
```

__Constraints__:

- $-300 \le x, y \le 300$
- $0 \le |x| + |y| \le 300$

---

### Breadth-First Search

![image](https://leetcode.com/problems/minimum-knight-moves/Figures/1197/1197_bfs.png)

```Python
class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        DIRECTIONS = [(-2, -1), (-2, 1), (2, -1), (2, 1), (-1, -2), (1, -2), (-1, 2), (1, 2)]
        queue = collections.deque([(0, 0)])
        visited = set()
        ans = 0

        while queue:
            next_queue = list()
            for curr_row, curr_col in queue:
                if (curr_row, curr_col) == (x, y):
                    return ans
                for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                    if not (next_row, next_col) in visited:
                        visited.add((next_row, next_col))
                        next_queue.append((next_row, next_col))
            queue = next_queue
            ans += 1

        return ans
```

### Dijkstra's Algorithm

```
1  function Dijkstra(Graph, source):
2      
3      for each vertex v in Graph.Vertices:
4          dist[v] ← INFINITY
5          prev[v] ← UNDEFINED
6          add v to Q
7      dist[source] ← 0
8      
9      while Q is not empty:
10          u ← vertex in Q with min dist[u]
11          remove u from Q
12          
13          for each neighbor v of u still in Q:
14              alt ← dist[u] + Graph.Edges(u, v)
15              if alt < dist[v]:
16                  dist[v] ← alt
17                  prev[v] ← u
18
19      return dist[], prev[]
```

```
1  S ← empty sequence
2  u ← target
3  if prev[u] is defined or u = source:          // Do something only if the vertex is reachable
4      while u is defined:                       // Construct the shortest path with a stack S
5          insert u at the beginning of S        // Push the vertex onto the stack
6          u ← prev[u]                           // Traverse from target to source
```

```Python

```
