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
