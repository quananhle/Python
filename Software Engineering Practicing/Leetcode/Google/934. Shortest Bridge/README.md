## [934. Shortest Bridge](https://leetcode.com/problems/shortest-bridge/)

```Tag```: ```Depth-First-Search``` ```Breadth-First-Search```

#### Difficulty: Medium

You are given an ```n x n``` binary matrix grid where ```1``` represents land and ```0``` represents water.

An __island__ is a 4-directionally connected group of ```1```'s not connected to any other ```1```'s. There are exactly two islands in ```grid```.

You may change ```0```'s to ```1```'s to connect the two islands to form one island.

Return _the smallest number of ```0```'s you must flip to connect the two islands_.

![image](https://github.com/quananhle/Python/assets/35042430/5604500c-fac8-4030-aec7-d8c82931dc20)

---

__Example 1:__
```
Input: grid = [[0,1],[1,0]]
Output: 1
```

__Example 2:__
```
Input: grid = [[0,1,0],[0,0,0],[0,0,1]]
Output: 2
```

__Example 3:__
```
Input: grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
Output: 1
```

__Constraints:__

- ```n == grid.length == grid[i].length```
- ```2 <= n <= 100```
- ```grid[i][j]``` is either ```0``` or ```1```.
- There are exactly two islands in ```grid```.

---

![image](https://leetcode.com/problems/shortest-bridge/Figures/934/intro.png)

### Depth-First Search + Breadth-First Search

![image](https://leetcode.com/problems/shortest-bridge/Figures/934/4.png)

```Python

```

### Breadth-First Search

```Python
class Solution:
    def shortestBridge(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]

        def find_land(grid):
            for x, row in enumerate(grid):
                for y, val in enumerate(row):
                    if val:
                        return (x, y)
        
        start_x, start_y = find_land(grid)
        first_island = collections.deque([(start_x, start_y)])
        queue = collections.deque([(start_x, start_y)])
        visited = defaultdict(lambda:False, dict())
        visited[(start_x, start_y)] = True

        while first_island:
            row, col = first_island.popleft()
            for dx, dy in DIRECTIONS:
                next_row, next_col = dx + row, dy + col
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and grid[next_row][next_col] and not visited[(next_row, next_col)]):
                    continue
                first_island.append((next_row, next_col))
                queue.append((next_row, next_col))
                visited[(next_row, next_col)] = True
            
        ans = 0
        while queue:
            size = len(queue)
            for i in range(size):
                row, col = queue.popleft()
                for dx, dy in DIRECTIONS:
                    next_row, next_col = row + dx, col + dy
                    if not (next_row in range(ROWS) and next_col in range(COLS) and not visited[(next_row, next_col)]):
                        continue
                    if grid[next_row][next_col]:
                        return ans
                    else:
                        queue.append((next_row, next_col))
                        visited[(next_row, next_col)] = True
            ans += 1
        
        return ans
```
