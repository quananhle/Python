## 1162. As Far from Land as Possible

```Tag```: ```Breadth-First Search``` ```Dynamic Programming```

#### Difficulty: Medium

Given an ```n x n``` grid containing only values ```0``` and ```1```, where ```0``` represents water and ```1``` represents land, find a water cell such that its distance to the nearest land cell is maximized, and return _the distance_. If no land or water exists in the grid, return ```-1```.

The distance used in this problem is the Manhattan distance: the distance between two cells ```(x0, y0)``` and ```(x1, y1)``` is ```|x0 - x1| + |y0 - y1|```.

![image](https://user-images.githubusercontent.com/35042430/218019593-cdce712a-d2db-4f27-8904-47fb92ce7faf.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/05/03/1336_ex1.JPG)
```
Input: grid = [[1,0,1],[0,0,0],[1,0,1]]
Output: 2
Explanation: The cell (1, 1) is as far as possible from all the land with distance 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/05/03/1336_ex2.JPG)
```
Input: grid = [[1,0,0],[0,0,0],[0,0,0]]
Output: 4
Explanation: The cell (2, 2) is as far as possible from all the land with distance 4.
```

__Constraints:__

- ```n == grid.length```
- ```n == grid[i].length```
- ```1 <= n <= 100```
- ```grid[i][j]``` is ```0``` or ```1```

---

### Breadth-First Search

```Python
class Solution:
    def maxDistance(self, grid: List[List[int]]) -> int:
        # Breadth-First Search
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        distance = 0

        # Add all the land cells into the queue
        queue = collections.deque()
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == 1:
                    queue.append((row, col))

        while queue:
            row, col = queue.popleft()
            for x, y in DIRECTIONS:
                new_row, new_col = row + x, col + y
                if not (0 <= new_row < ROWS and 0 <= new_col < COLS) or grid[new_row][new_col]:
                    continue
                queue.append((new_row, new_col))
                grid[new_row][new_col] = 1 + grid[row][col]
                distance = max(distance, grid[new_row][new_col])

        return distance - 1
```
