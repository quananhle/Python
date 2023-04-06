## [1254. Number of Closed Islands](https://leetcode.com/problems/number-of-closed-islands)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Graph``` ```Union-Find```

#### Difficulty: Medium

Given a 2D ```grid``` consists of ```0```s (land) and ```1```s (water).  An island is a maximal 4-directionally connected group of ```0```s and a closed island is an island totally (all left, top, right, bottom) surrounded by ```1```s.

Return _the number of closed islands_.

![image](https://user-images.githubusercontent.com/35042430/230480118-7b905f6f-9b15-45b7-9758-6d31a0718c29.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/10/31/sample_3_1610.png)
```
Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
Output: 2
Explanation: 
Islands in gray are closed because they are completely surrounded by water (group of 1s).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/10/31/sample_4_1610.png)
```
Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
Output: 1
```

__Example 3:__
```
Input: grid = [[1,1,1,1,1,1,1],
               [1,0,0,0,0,0,1],
               [1,0,1,1,1,0,1],
               [1,0,1,0,1,0,1],
               [1,0,1,1,1,0,1],
               [1,0,0,0,0,0,1],
               [1,1,1,1,1,1,1]]
Output: 2
```

__Constraints:__

- ```1 <= grid.length, grid[0].length <= 100```
- ```0 <= grid[i][j] <=1```
 
 ---

### Depth-First Search

- __Time complexity:__ ```O(m * n)```
- __Space complexity:__ ```O(m * n)```

#### Hash Set ```seen/visited```

```Python
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        visited = set()
        count = 0

        def dfs(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return False

            # Check if current cell is already visited or is water
            if (row, col) in visited or grid[row][col] == 1:
                return True

            visited.add((row, col))

            # Check 4-directionally connected neighbors of the current cell
            left = dfs(row + 1, col)
            right = dfs(row, col + 1)
            up = dfs(row - 1, col)
            down = dfs(row, col - 1)

            # Check if the current cell is totally surrounded by water
            return left and right and up and down

        for row in range(ROWS):
            for col in range(COLS):
                # Check if the land is never been visited before and is surrounded by water 4-directionally
                if not (row, col) in visited and grid[row][col] == 0 and dfs(row, col):
                        count += 1
    
        return count
```

```Python
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        count = 0        

        def dfs(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return False

            if grid[row][col] == 1 or (row, col) in visited:
                return True
            
            visited.add((row, col))
            is_closed = True

            for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not dfs(next_row, next_col):
                    is_closed = False
            
            return is_closed

        for row in range(ROWS):
            for col in range(COLS): 
                if grid[row][col] == 0 and not (row, col) in visited and dfs(row, col):
                    count += 1
        
        return count
```

#### Modidy Input

```Python
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        count = 0

        def dfs(row, col):
            # Base case
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return False

            # Check if current cell is already visited or is water
            if grid[row][col] == 1:
                return True

            grid[row][col] = 1

            # Check 4-directionally connected neighbors of the current cell
            left = dfs(row + 1, col)
            right = dfs(row, col + 1)
            up = dfs(row - 1, col)
            down = dfs(row, col - 1)

            # Check if the current cell is totally surrounded by water
            return left and right and up and down

        for row in range(ROWS):
            for col in range(COLS):
                # Check if the land is never been visited before and is surrounded by water 4-directionally
                if grid[row][col] == 0 and dfs(row, col):
                        count += 1
    
        return count
```

### Breadth-First Search

- __Time complexity:__ ```O(m * n)```
- __Space complexity:__ ```O(m * n)```

#### Hash Set ```seen/visited```

```Python
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        count = 0

        queue = collections.deque()

        for row in range(ROWS):
            for col in range(COLS):
                if (row, col) in visited or grid[row][col] == 1:
                    continue

                queue.append((row, col))
                is_closed = True

                while queue:
                    curr_row, curr_col = queue.popleft()
                    visited.add((curr_row, curr_col))
                    for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                        if not (0 <= next_row < ROWS and 0 <= next_col < COLS):
                            is_closed = False
                        elif grid[next_row][next_col] == 0 and not (next_row, next_col) in visited:
                            queue.append((next_row, next_col))
                
                if is_closed:
                    count += 1
        
        return count
```

#### Modify Input

```Python
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        count = 0

        queue = collections.deque()

        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == 1:
                    continue
                
                queue.append((row, col))
                is_closed = True

                while queue:
                    curr_row, curr_col = queue.popleft()
                    grid[curr_row][curr_col] = 1
                    for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                        if not (0 <= next_row < ROWS and 0 <= next_col < COLS):
                            is_closed = False
                        elif grid[next_row][next_col] == 0:
                            queue.append((next_row, next_col))
                
                if is_closed:
                    count += 1
        
        return count
```

#### Recursive

```Python
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        count = 0

        def bfs(row, col):
            queue = collections.deque([(row, col)])
            is_closed = True

            while queue:
                curr_row, curr_col = queue.popleft()
                visited.add((curr_row, curr_col))
                for next_row, next_col in [(curr_row + dx, curr_col + dy) for dx, dy in DIRECTIONS]:
                    if not (0 <= next_row < ROWS and 0 <= next_col < COLS):
                        is_closed = False
                    elif grid[next_row][next_col] == 0 and not (next_row, next_col) in visited:
                        queue.append((next_row, next_col))
            
            return is_closed

        for row in range(ROWS):
            for col in range(COLS):
                if not (row, col) in visited and grid[row][col] == 0 and bfs(row, col):
                    count += 1
        
        return count
```

---

### Union-Find

```Python
class UnionFind:

    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [0] * (size)
        self.size = size

    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += root_y
            
            self.size -= 1

    def get_count(self):
        return self.size
    
    def connected(self, x, y):
        return self.find(x) == self.find(y)

class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        m, n = len(grid), len(grid[0])
        uf = UnionFind(m * n)

        def map(row, col):
            return row * n + col
        
        total_islands = 0
        for row in range(m):
            for col in range(n):
                if grid[row][col] == 0:
                    total_islands += 1
                    for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                        if not (0 <= next_row < m and 0 <= next_col < n and grid[next_row][next_col] == 0):
                            continue
                        if uf.find(map(row, col)) != uf.find(map(next_row, next_col)):
                            total_islands -= 1
                            uf.union(map(row, col), map(next_row, next_col))

        # Number of closed islands = total islands - open islands
        open_islands = set()

        for row in range(m):
            if grid[row][0] == 0:
                open_islands.add(uf.find(map(row, 0)))
            if grid[row][n - 1] == 0:
                open_islands.add(uf.find(map(row, n - 1)))
        
        for col in range(n):
            if grid[0][col] == 0:
                open_islands.add(uf.find(map(0, col)))
            if grid[m - 1][col] == 0:
                open_islands.add(uf.find(map(m - 1, col)))

        return total_islands - len(open_islands)
```
