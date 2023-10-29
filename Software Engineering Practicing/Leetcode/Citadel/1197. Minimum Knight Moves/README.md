## [1197. Minimum Knight Moves](https://leetcode.com/problems/minimum-knight-moves)

```Tag```: ```Breadth-First Search``` ```Dijkstra's Algorithm``` ```Depth-First Search``` ```Dynamic Programming``` ```A* Search Algorithm```

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

![image](https://github.com/quananhle/Python/assets/35042430/3e015ed1-28de-47e0-a515-2309f521dc26)

![image](https://github.com/quananhle/Python/assets/35042430/c90eb26d-f94d-4944-9586-45b750d27fa4)

#### Dijkstra's Algorithm

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
class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        # Memory Limit Exceeded
        DIRECTIONS = [(-2, -1), (-2, 1), (2, -1), (2, 1), (-1, -2), (1, -2), (-1, 2), (1, 2)]
        queue = collections.deque([(0, 0)])
        ans = 0
        visited = set()

        while queue:
            n = len(queue)
            for _ in range(n):
                curr_row, curr_col = queue.popleft()
                if (curr_row, curr_col) == (x, y):
                    return ans
            for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                if not (next_row, next_col) in visited:
                    visited.add((next_row, next_col))
                    queue.append((next_row, next_col))
            ans += 1

        return ans
```

```Python
class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        DIRECTIONS = [(-2, -1), (-2, 1), (2, -1), (2, 1), (-1, -2), (1, -2), (-1, 2), (1, 2)]
        queue = collections.deque([(0, 0)])
        ans = 0
        visited = set()

        while queue:
            n = len(queue)
            for _ in range(n):
                curr_row, curr_col = queue.popleft()
                if (curr_row, curr_col) == (x, y):
                    return ans
                for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                    if not (next_row, next_col) in visited:
                        visited.add((next_row, next_col))
                        queue.append((next_row, next_col))
            ans += 1

        return ans
```

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

#### Bidirectional BFS

![image](https://github.com/quananhle/Python/assets/35042430/ccb24e9c-33c7-45a5-9aaa-f15aafb6118b)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}\bigg(\big(\max(|x|, |y|)\big) ^ 2\bigg)$
- __Space Complexity__: $\mathcal{O}\bigg(\big(\max(|x|, |y|)\big) ^ 2\bigg)$

```Python
class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        DIRECTIONS = [(-2, -1), (-2, 1), (2, -1), (2, 1), (-1, -2), (1, -2), (-1, 2), (1, 2)]
        start_queue = collections.deque([(0, 0, 0)])
        start_distn = {(0, 0): 0}
        finish_queue = collections.deque([(x, y, 0)])
        finish_distn = {(x, y): 0}

        while True:
            curr_row, curr_col, curr_steps = start_queue.popleft()
            if (curr_row, curr_col) in finish_distn:
                return curr_steps + finish_distn[(curr_row, curr_col)]
            
            finish_row, finish_col, finish_steps = finish_queue.popleft()
            if (finish_row, finish_col) in start_distn:
                return finish_steps + start_distn[(finish_row, finish_col)]

            for next_from_start_row, next_from_start_col, next_from_finish_row, next_from_finish_col in [(curr_row + dx, curr_col + dy, finish_row + dx, finish_col + dy) for dx, dy in DIRECTIONS]:
                if not (next_from_start_row, next_from_start_col) in start_distn:
                    start_queue.append((next_from_start_row, next_from_start_col, curr_steps + 1))
                    start_distn[(next_from_start_row, next_from_start_col)] = curr_steps + 1

                if not (next_from_finish_row, next_from_finish_col) in finish_distn:
                    finish_queue.append((next_from_finish_row, next_from_finish_col, finish_steps + 1))
                    finish_distn[(next_from_finish_row, next_from_finish_col)] = finish_steps + 1

        return -1
```

### Depth-First Search

#### Iterative DFS

```Python
class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        DIRECTIONS = [(-2, -1), (-2, 1), (2, -1), (2, 1), (-1, -2), (1, -2), (-1, 2), (1, 2)]
        queue = collections.deque([(0, 0, 0)])
        visited = set()

        while True:
            curr_row, curr_col, curr_steps = queue.popleft()
            if (curr_row, curr_col) == (x, y):
                return curr_steps

            for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                if not (next_row, next_col) in visited:
                    start_queue.append((next_row, next_col, curr_steps + 1))
                    visited.add((next_row, next_col))

        return -1
```


### Dynamic Programming

![image](https://github.com/quananhle/Python/assets/35042430/a00766b7-b743-440e-9062-b91f307aeedf)

![image](https://leetcode.com/problems/minimum-knight-moves/Figures/1197/1197_dfs_base_cases.png)

```Python
class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        @functools.lru_cache(maxsize=None)
        def dfs(x, y):
            if x + y == 0:
                # Base case: (0, 0)
                return 0
            elif x + y == 2:
                # Base case: (1, 1), (0, 2), (2, 0)
                return 2
            else:
                return min(dfs(abs(x - 1), abs(y - 2)), dfs(abs(x - 2), abs(y - 1))) + 1

        return dfs(abs(x), abs(y))
```
