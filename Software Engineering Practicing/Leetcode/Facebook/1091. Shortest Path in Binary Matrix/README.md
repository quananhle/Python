## [1091. Shortest Path in Binary Matrix](https://leetcode.com/problems/shortest-path-in-binary-matrix/)

```Tag```: ```Breadth-First Search``` ```Matrix```

#### Difficulty: Medium

Given an ```n x n``` binary matrix ```grid```, return _the length of the shortest clear path in the matrix_. If there is no clear path, return ```-1```.

A clear path in a binary matrix is a path from the top-left cell (i.e., ```(0, 0)```) to the bottom-right cell (i.e., ```(n - 1, n - 1)```) such that:

- All the visited cells of the path are ```0```.
- All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).

The length of a clear path is the number of visited cells of this path.

![image](https://github.com/quananhle/Python/assets/35042430/8731efb6-b620-45c8-8aa2-e5d046608788)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/18/example1_1.png)
```
Input: grid = [[0,1],[1,0]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/18/example2_1.png)
```
Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
Output: 4
```

__Example 3:__
```
Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
Output: -1
```

__Constraints:__

- ```n == grid.length```
- ```n == grid[i].length```
- ```1 <= n <= 100```
- ```grid[i][j]``` is ```0``` or ```1```

---

### Breadth-First Search

![image](https://leetcode.com/problems/shortest-path-in-binary-matrix/Figures/1091/example_3_solution.png)

![image](https://leetcode.com/problems/shortest-path-in-binary-matrix/Figures/1091/example_4_solution.png)

![image](https://leetcode.com/problems/shortest-path-in-binary-matrix/Figures/1091/cell_options.png)

![image](https://leetcode.com/problems/shortest-path-in-binary-matrix/Figures/1091/implicit_graph.png)

![image](https://github.com/quananhle/Python/assets/35042430/75c3ef81-180a-4ced-aa44-067343c2df41)

#### Hash Set Marked as Visited

```Python
class Solution:
    def shortestPathBinaryMatrix(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        ROWS, COLS = len(grid), len(grid[0])
        ans = 1

        if grid[0][0] == 1 or grid[ROWS - 1][COLS - 1] == 1:
            return -1

        queue = collections.deque([(0, 0)])
        visited = set((0, 0))

        while queue:
            for _ in range(len(queue)):
                row, col = queue.popleft()
                if row == ROWS - 1 and col == COLS - 1:
                    return ans

                for dx, dy in DIRECTIONS:
                    next_row, next_col = row + dx, col + dy
                    if not (0 <= next_row < ROWS and 0 <= next_col < COLS and not (next_row, next_col) in visited and grid[next_row][next_col] == 0):
                        continue
                    queue.append((next_row, next_col))
                    visited.add((next_row, next_col))
            ans += 1

        return -1
```

#### Overwriting Input

Here is some pseudocode.

```Python
while queue is not empty:

    cell = dequeue a cell
    look up distance at grid[cell row][cell col]

    for each open neighbour:
        if this neighbour is the bottom right cell (target):
            return distance + 1
        set grid[neighbour row][neighbour col] = distance + 1
        enqueue neighbour
        
return -1
```

```Python
directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]

define function get_neighbors(row, col):
neighbors = a container to put the neighbors of (row, col) in
    for each (row_direction, col_direction) pair in directions:
        neighbor_row = row + row_direction
        neighbor_col = col + col_direction
        if (neighbor_row, neighbor_col) is NOT over the edge of the grid AND is 0:
            add (neighbor_row, neighbor_col) to neighbors
    return neighbors
```

```Python
class Solution:
    def shortestPathBinaryMatrix(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        DESTINATION_ROW, DESTIONATION_COL = len(grid) - 1, len(grid[0]) - 1

        def get_neighbor(row, col):
            for dx, dy in DIRECTIONS:
                next_row, next_col = row + dx, col + dy
                if not (0 <= next_row <= DESTINATION_ROW and 0 <= next_col <= DESTIONATION_COL and not grid[next_row][next_col]):
                    continue
                yield (next_row, next_col)
        
        if grid[0][0] == 1 or grid[DESTINATION_ROW][DESTIONATION_COL] == 1:
            return -1
        
        queue = collections.deque([(0, 0)])
        grid[0][0] = 1

        while queue:
            row, col = queue.popleft()
            distance = grid[row][col]
            if (row, col) == (DESTINATION_ROW, DESTIONATION_COL):
                return distance
            for next_row, next_col in get_neighbor(row, col):
                grid[next_row][next_col] = distance + 1
                queue.append((next_row, next_col))
            
        return -1
```

```Python
class Solution:
    def shortestPathBinaryMatrix(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        ROWS, COLS = len(grid), len(grid[0])
        
        if grid[0][0] == 1 or grid[ROWS - 1][COLS - 1] == 1:
            return -1
        
        queue = collections.deque([(0, 0)])
        grid[0][0] = 1

        while queue:
            row, col = queue.popleft()
            distance = grid[row][col]
            if (row, col) == (ROWS - 1, COLS - 1):
                return distance
            for dx, dy in DIRECTIONS:
                next_row, next_col = row + dx, col + dy
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and not grid[next_row][next_col]):
                    continue
                grid[next_row][next_col] = distance + 1
                queue.append((next_row, next_col))
            
        return -1
```

