## [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

```Tag```:  ```Depth-First Search``` ```Recursion```

#### Difficulty: Medium

There is an ```m x n``` rectangular island that borders both the __Pacific Ocean__ and __Atlantic Ocean__. The __Pacific Ocean__ touches the island's left and top edges, and the __Atlantic Ocean__ touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an ```m x n``` integer matrix ```heights``` where ```heights[r][c]``` represents the height above sea level of the cell at coordinate ```(r, c)```.

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is __less than or equal__ to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return _a __2D list__ of grid coordinates ```result``` where ```result[i]``` = [r<sub>i</sub>, c<sub>i>/sub>] denotes that rain water can flow from cell (r<sub>i</sub>, c<sub>i>/sub>) to __both__ the __Pacific__ and __Atlantic oceans___.

![image](https://user-images.githubusercontent.com/35042430/224526884-31420b32-4452-4843-8585-9c137763f307.png)
  
---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/06/08/waterflow-grid.jpg)
```
Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
Explanation: The following cells can flow to the Pacific and Atlantic oceans, as shown below:
[0,4]: [0,4] -> Pacific Ocean 
       [0,4] -> Atlantic Ocean
[1,3]: [1,3] -> [0,3] -> Pacific Ocean 
       [1,3] -> [1,4] -> Atlantic Ocean
[1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean 
       [1,4] -> Atlantic Ocean
[2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean 
       [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
[3,0]: [3,0] -> Pacific Ocean 
       [3,0] -> [4,0] -> Atlantic Ocean
[3,1]: [3,1] -> [3,0] -> Pacific Ocean 
       [3,1] -> [4,1] -> Atlantic Ocean
[4,0]: [4,0] -> Pacific Ocean 
       [4,0] -> Atlantic Ocean
Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.
```

__Example 2:__
```
Input: heights = [[1]]
Output: [[0,0]]
Explanation: The water can flow from the only cell to the Pacific and Atlantic oceans.
```

__Constraints:__

- ```m == heights.length```
- ```n == heights[r].length```
- ```1 <= m, n <= 200```
- 0 <= ```heights[r][c]``` <= 10<sup>5</sup>
  
---

### Breadth-First Search
  
```Python
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        PACIFIC = collections.deque()
        ATLANTIC = collections.deque()

        for row in range(ROWS):
            PACIFIC.append((row, 0))
            ATLANTIC.append((row, COLS - 1))
        for col in range(COLS):
            PACIFIC.append((0, col))
            ATLANTIC.append((ROWS - 1, col))

        def bfs(queue):
            reachable = set()
            while queue:
                row, col = queue.popleft()
                reachable.add((row, col))
                for new_row, new_col in ([(row + dx, col + dy) for dx, dy in DIRECTIONS]):
                    if not (0 <= new_row < ROWS and 0 <= new_col < COLS and not (new_row, new_col) in reachable):
                        continue
                    # Check if the water can flow from new cell to old cell to the oceans
                    if heights[new_row][new_col] < heights[row][col]:
                        continue
                    queue.append((new_row, new_col))
            return reachable
            
        return list(bfs(PACIFIC) & bfs(ATLANTIC))
```

```Python
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        if not heights or not heights[0]:
            return list()

        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        pacific = collections.deque()
        atlantic = collections.deque()
        pacific_reachable = [[False] * COLS for _ in range(ROWS)]
        atlantic_reachable = [[False] * COLS for _ in range(ROWS)]

        for row in range(ROWS):
            pacific.append((row, 0))
            pacific_reachable[row][0] = True
            atlantic.append((row, COLS - 1))
            atlantic_reachable[row][COLS - 1] = True

        for col in range(COLS):
            pacific.append((0, col))
            pacific_reachable[0][col] = True
            atlantic.append((ROWS - 1, col))
            atlantic_reachable[ROWS - 1][col] = True
        
        def bfs(queue, reachable):
            while queue:
                row, col = queue.popleft()
                for new_row, new_col in ([(row + dx, col + dy) for dx, dy in DIRECTIONS]):
                    if not (0 <= new_row < ROWS and 0 <= new_col < COLS and not reachable[new_row][new_col]):
                        continue
                    if heights[new_row][new_col] >= heights[row][col]:
                        reachable[new_row][new_col] = True
                        queue.append((new_row, new_col))
        
        bfs(pacific, pacific_reachable)
        bfs(atlantic, atlantic_reachable)

        res = list()
        for row in range(ROWS):
            for col in range(COLS):
                if pacific_reachable[row][col] and atlantic_reachable[row][col]:
                    res.append([row, col])
        
        return res
```

### Depth-First Search

```Python
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        if not heights or not heights[0]:
            return list()

        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        pacific = set()
        atlantic = set()

        def dfs(row, col, reachable):
            reachable.add((row, col))
            for new_row, new_col in ([(row + dx, col + dy) for dx, dy in DIRECTIONS]):
                if not (0 <= new_row < ROWS and 0 <= new_col < COLS and not (new_row, new_col) in reachable):
                    continue
                # Check if the water can flow from new cell to old cell to the oceans
                if heights[new_row][new_col] < heights[row][col]:
                    continue

                dfs(new_row, new_col, reachable)

        for row in range(ROWS):
            dfs(row, 0, pacific)
            dfs(row, COLS - 1, atlantic)

        for col in range(COLS):
            dfs(0, col, pacific)
            dfs(ROWS - 1, col, atlantic)

        return list(pacific & atlantic)
```

```Python
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        if not heights or not heights[0]:
            return list()

        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        pacific = set()
        atlantic = set()

        def dfs(row, col, reachable, prev_height):
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in reachable and heights[row][col] >= prev_height):
                return
                
            reachable.add((row, col))
            [dfs(row + dx, col + dy, reachable, heights[row][col]) for dx, dy in DIRECTIONS]

        for row in range(ROWS):
            dfs(row, 0, pacific, heights[row][0])
            dfs(row, COLS - 1, atlantic, heights[row][COLS - 1])

        for col in range(COLS):
            dfs(0, col, pacific, heights[0][col])
            dfs(ROWS - 1, col, atlantic, heights[ROWS - 1][col])

        res = list()

        for row in range(ROWS):
            for col in range(COLS):
                if (row, col) in pacific and (row, col) in atlantic:
                    res.append([row, col])

        return res
```
