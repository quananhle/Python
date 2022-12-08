## 200. Number of Islands

#### Difficulty: Medium

Given an ```m x n``` 2D binary grid ```grid``` which represents a map of ```'1'```s (land) and ```'0'```s (water), return _the number of islands_.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

![image](https://user-images.githubusercontent.com/35042430/206580128-1aa4a5fc-b0dd-499f-875f-c1fe534598c4.png)

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
class Solution(object):
    def numIslands(self, grid):
        """
        :type grid: List[List[str]]
        :rtype: int
        """        
        count = 0
        # Depth-First Search
        #### Time Complexity:
        #### Space Complexity:
        ROWS, COLS = len(grid), len(grid[0])
        # Connecting horizontally or vertically
        directions = [(1,0),(0,1),(-1,0),(0,-1)]
        # Track visited cells
        visited = set()
        '''
        # Horizontally, vertically, and diagonally
        directions = [(1,1),(1,0),(1,-1),(0,-1),(-1,-1),(-1,0),(-1,1),(0,1)]
        '''
        
        def traverse(grid, row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS) or grid[row][col] != "1" or (row, col) in visited:
                return
            # Mark the land
            visited.add((row, col))
            # Check surrounding area horizontally and vertically
            [traverse(grid, row + x, col + y) for x, y in directions]
        
        
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == "1" and (row, col) not in visited:
                    traverse(grid, row, col)
                    count += 1
        return count
```

