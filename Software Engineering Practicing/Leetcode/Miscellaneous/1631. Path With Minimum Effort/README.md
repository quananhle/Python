## [1631. Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Priority Queue``` ```Union-Find``` ```Binary Search Tree``` ```Dijkstra's Algorithm``` ```Backtracking``` ```Graph```

#### Difficulty: Medium

You are a hiker preparing for an upcoming hike. You are given ```heights```, a 2D array of size ```rows x columns```, where ```heights[row][col]``` represents the height of cell ```(row, col)```. You are situated in the top-left cell, ```(0, 0)```, and you hope to travel to the bottom-right cell, ```(rows-1, columns-1)``` (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.

A route's effort is the __maximum absolute difference__ in heights between two consecutive cells of the route.

Return _the minimum effort required to travel from the top-left cell to the bottom-right cell_.

![image](https://github.com/quananhle/Python/assets/35042430/219e158f-bdc2-486b-bb6e-b92c40f8900d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/04/ex1.png)
```
Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
Output: 2
Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/04/ex2.png)
```
Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
Output: 1
Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/10/04/ex3.png)
```
Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
Output: 0
Explanation: This route does not require any effort.
```

__Constraints:__

- $rows == heights.length$
- $columns == heights[i].length$
- $1 \le rows, columns \le 100$
- $1 \le heights[i][j] \le 10^{6}$

---

![image](https://leetcode.com/problems/path-with-minimum-effort/Figures/5548/minEffortOverview.png)

### Brute Force with Backtracking (Time Limit Exceeded)

The backtracking algorithms consists of the following steps,

- __Choose__: Choose the potential candidate. For any given cell A, we must choose the adjacent cells in all 4 directions (up, down, left, right) as a potential candidate.
- __Constraint__: Define a constraint that must be satisfied by the chosen candidate. In this case, a chosen cell is valid if it is within the boundaries of the matrix and it is not visited before.
- __Goal__: We must define the goal that determines if we have found the required solution and we must backtrack. Here, our goal is achieved once we have reached the destination cell. On reaching the destination cell, we must track the maximum absolute difference in that path and backtrack.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(3^{m \cdot n})$.
- __Space Complexity__: $\mathcal{O}(m \cdot n)$

```Python
class Solution:
    def minimumEffortPath(self, heights: List[List[int]]) -> int:
        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1,0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        curr_max = math.inf

        def dfs(row, col, max_difference):
            nonlocal curr_max
            # Base case
            if row == ROWS - 1 and col == COLS - 1:
                curr_max = min(curr_max, max_difference)
                return max_difference

            visited.add((row, col))
            min_effort = math.inf

            for next_row, next_col in [(dx + row, dy + col) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and not (next_row, next_col) in visited):
                    continue
                current_difference = abs(heights[next_row][next_col] - heights[row][col])
                max_current_difference = max(max_difference, current_difference)
                if max_current_difference < curr_max:
                    effort = dfs(next_row, next_col, max_current_difference)
                    min_effort = min(min_effort, effort)

            # Backtracking
            visited.remove((row, col))
            return min_effort

        return dfs(0, 0, 0)
```

### Dijkstra's Algorithm with Priority Queue

![image](https://github.com/quananhle/Python/assets/35042430/8298ad20-36ca-4668-81b0-8d63684e0fdd)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n \log(m \cdot n))$.
- __Space Complexity__: $\mathcal{O}(m \cdot n)$;

```Python
class Solution:
    def minimumEffortPath(self, heights: List[List[int]]) -> int:
        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1,0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        ans = math.inf

        queue = [(0, 0, 0)]
        efforts = [[math.inf] * COLS for _ in range(ROWS)]
        efforts[0][0] = 0

        while queue:
            effort, row, col = heapq.heappop(queue)
            if row == ROWS - 1 and col == COLS - 1:
                return effort
            visited.add((row, col))
            for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and not (next_row, next_col) in visited):
                    continue
                max_effort = max(abs(heights[row][col] - heights[next_row][next_col]), efforts[row][col])
                if efforts[next_row][next_col] > max_effort:
                    efforts[next_row][next_col] = max_effort
                    heapq.heappush(queue, (max_effort, next_row, next_col))

        return -1
```

### Union Find - Disjoint Set

__Algorithm__

- Initially, each cell is a disconnected component, so we initialize each cell as a parent of itself. Also we flatten a 2D matrix into a 1D matrix of size ```ROWS * COLS``` and each cell ```(row, col)``` in a 2D matrix can be stored at ```(row * COLS + col)``` in a 1D matrix.
The below figure illustrates this idea.

![image](https://leetcode.com/problems/path-with-minimum-effort/Figures/5548/flatten2DMatrix2.png)

We also build an ```edge_list``` which consists of the absolute difference between every adjacent cell in the matrix. We also sort the edge list in non-decreasing order of difference. The below example illustrates the edge list of given heights matrix ```[[1,2,2],[3,8,2],[5,3,5]]``` sorted by difference.

![image](https://leetcode.com/problems/path-with-minimum-effort/Figures/5548/unionFindEdgeList.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n \log(m \cdot n))$.
For every edge, we ```find``` the parent of each cell and perform the ```union``` (Union Find). For ```n``` elements, the time complexity of ```Union Find``` is $\log n$. Thus for $m \cdot n$ cells, the time taken to perform ```Union Find``` would be $\log m \cdot n$.
- __Space Complexity__: $\mathcal{O}(m \cdot n)$;

```Python
class UnionFind:

    def __init__(self, size: int) -> None:
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.size = size
    
    def find(self, x: int) -> int:
        if x != self.root[x]:
            self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x: int, y: int) -> bool:
        root_x, root_y = self.find(x), self.find(y)
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
    
    def get_size(self) -> int:
        return self.size
    
    def compare(self, x: int, y: int) -> bool:
        return self.find(x) == self.find(y)

class Solution:
    def minimumEffortPath(self, heights: List[List[int]]) -> int:
        ROWS, COLS = len(heights), len(heights[0])
        if ROWS == 1 and COLS == 1:
            return 0

        DIRECTIONS = [(1,0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        curr_max = math.inf

        edge_list = list()
        for row in range(ROWS):
            for col in range(COLS):
                if row > 0:
                    difference = abs(heights[row][col] - heights[row - 1][col])
                    edge_list.append((difference, row * COLS + col, (row - 1) * COLS + col))
                if col > 0:
                    difference = abs(heights[row][col] - heights[row][col - 1])
                    edge_list.append((difference, row * COLS + col, row * COLS + col - 1))
        
        edge_list.sort()
        uf = UnionFind(ROWS * COLS)

        for difference, x, y in edge_list:
            uf.union(x, y)
            if uf.find(0) == uf.find(ROWS * COLS - 1):
                return difference

        return -1
```

---

### Binary Search with BFS

Our aim to find the minimum effort required to travel from source cell to destination cell. We know from the given constraints that the maximum height could be $10^6 (1000000)$. So we know that our required absolute difference values would between $0$ and $10^6$. We could use Binary Search and reduce our search space by half.

Given the lower bound as $0$ and upper bound as $10^6$, we could repeatedly calculate the middle value. Let this middle value be ```mid```. We could divide our search space based on the following condition,
- If there exists a path from the source cell to the destination cell with the effort less than the value ```mid```, we know that the required minimum effort value lies between lower bound ```0``` and ```mid```.
- Similarly, if there doesn't exist any path from a source cell to destination cell with the effort less than the value ```mid```, we know that the required minimum effort value lies between ```mid``` and upper bound $10^6$.

To find if there exists a path from the source cell to the destination cell for a given mid value, we could use simple graph traversal.

```Python

```

### Binary Search with DFS

```Python

```
