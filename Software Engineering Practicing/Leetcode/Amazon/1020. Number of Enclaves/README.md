## [1020. Number of Enclaves](https://leetcode.com/problems/number-of-enclaves/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

You are given an ```m x n``` binary matrix ```grid```, where ```0``` represents a sea cell and ```1``` represents a land cell.

A __move__ consists of walking from one land cell to another adjacent (__4-directionally__) land cell or walking off the boundary of the ```grid```.

Return _the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves_.

![image](https://user-images.githubusercontent.com/35042430/230527878-80110fb7-a62e-4053-9427-a426a8812ae9.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/18/enclaves1.jpg)
```
Input: grid = [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
Output: 3
Explanation: There are three 1s that are enclosed by 0s, and one 1 that is not enclosed because its on the boundary.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/18/enclaves2.jpg)
```
Input: grid = [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
Output: 0
Explanation: All 1s are either on the boundary or can reach the boundary.
```

__Constraints:__

- ```m == grid.length```
- ```n == grid[i].length```
- ```1 <= m, n <= 500```
- ```grid[i][j]``` is either ```0``` or ```1```.

---

### Depth-First Search

- __Time complexity:__ ```O(m * n)```
- __Space complexity:__ ```O(m * n)```

#### Hash Set ```visited/seen```

```Python
class Solution:
    def numEnclaves(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0, -1)]
        visited = set()

        def dfs(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS and not grid[row][col] == 0 and not (row, col) in visited):
                return 
            # Only record the land cells in the boundaries
            visited.add((row, col))
            [dfs(row + dx, col + dy) for dx, dy in DIRECTIONS]            

        for row in range(ROWS):
            for col in range(COLS):
                # Check first and last columns and first and last rows
                if row * col == 0 or row == ROWS - 1 or col == COLS - 1:
                    if not (row, col) in visited:
                        dfs(row, col)

        count = 0
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == 1 and not (row, col) in visited:
                    count += 1

        return count
```

#### Modify Input

```Python
class Solution:
    def numEnclaves(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0, -1)]

        def dfs(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS and not grid[row][col] == 0):
                return 
            
            grid[row][col] = 0
            
            [dfs(row + dx, col + dy) for dx, dy in DIRECTIONS]

        for row in range(ROWS):
            for col in range(COLS):
                # Check all the edges
                if row * col == 0 or row == ROWS - 1 or col == COLS - 1:
                    if grid[row][col] == 1:
                        dfs(row, col)
        
        count = 0

        for row in grid:
            count += sum(row)
        
        return count
```

### Breadth-First Search

- __Time complexity:__ ```O(m * n)```
- __Space complexity:__ ```O(m * n)```

```Python
class Solution:
    def numEnclaves(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0, -1)]
        visited = set()

        queue = collections.deque()

        for row in range(ROWS):
            for col in range(COLS):
                # Check first and last columns and first and last rows
                if row * col == 0 or row == ROWS - 1 or col == COLS - 1:
                    if not (row, col) in visited and grid[row][col] == 1:
                        visited.add((row, col))
                        queue.append((row, col))

        while queue:
            curr_row, curr_col = queue.popleft()
            visited.add((curr_row, curr_col))
            for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and not grid[next_row][next_col] == 0 and not (next_row, next_col) in visited):
                    continue
                if grid[next_row][next_col] == 1 and not (next_row, next_col) in visited:
                    queue.append((next_row, next_col))
                    visited.add((next_row, next_col))
        
        count = 0
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == 1 and not (row, col) in visited:
                    count += 1

        return count
```

```Python
class Solution:
    def numEnclaves(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0, -1)]
        visited = set()

        queue = collections.deque()

        def bfs(row, col):
            while queue:
                curr_row, curr_col = queue.popleft()
                visited.add((curr_row, curr_col))
                for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                    if not (0 <= next_row < ROWS and 0 <= next_col < COLS):
                        continue
                    elif grid[next_row][next_col] == 1 and not (next_row, next_col) in visited:
                        queue.append((next_row, next_col))
                        visited.add((next_row, next_col))

        for row in range(ROWS):
            for col in range(COLS):
                # Check first and last columns and first and last rows
                if row * col == 0 or row == ROWS - 1 or col == COLS - 1:
                    if not (row, col) in visited and grid[row][col] == 1:
                        queue.append((row, col))
                        bfs(row, col)

        count = 0
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == 1 and not (row, col) in visited:
                    count += 1

        return count
```
