## 200. Number of Islands

```Tag```: ```Stack``` ```Depth-First Search```

Given an ```m x n``` 2D binary grid ```grid``` which represents a map of ```'1'```s (land) and ```'0'```s (water), return _the number of islands_.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

![image](https://user-images.githubusercontent.com/35042430/209014236-3bbee08b-3a35-444a-855d-e634cdcaece3.png)

---

__Example 1:__
```
Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1
```

__Example 2:__

```
Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
```

__Constraints:__

```
m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] is '0' or '1'.
```

---

### Depth-First Search

```Python
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        # Depth-First Search
        #### Time Complexity: O(N * M), where M is the number of rows and N is the number of columns.
        #### Space Complexity: O(N * M), in case that the grid map is filled with lands where DFS goes by M×N deep.
        
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]

        island = 0

        def dfs(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS and grid[row][col] == "1"):           
                return
            grid[row][col] = "$"
            '''
            dfs(row + 1, col)
            dfs(row, col + 1)
            dfs(row - 1, col)
            dfs(row, col - 1)
            '''
            [dfs(row + x, col + y) for x, y in DIRECTIONS]
           
        for row in range(ROWS):
            for col in range(COLS):
                # Look for a "land" cell
                if grid[row][col] == "1":
                    # Search for all adjacent "land" cells
                    dfs(row, col)
                    # Island found
                    island += 1
        
        return island
```
