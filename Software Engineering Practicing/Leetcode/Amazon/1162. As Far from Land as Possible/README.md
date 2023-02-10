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

#### Mark the grid

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

#### Visited Hash Set

![image](https://leetcode.com/problems/as-far-from-land-as-possible/solutions/3043174/Figures/1162/1162A.png)

__Algorithm__

1. Iterate over the matrix and insert the land cell coordinates into the queue. Initialize a variable ```distance``` as ```-1``` to store the current step of BFS. Also, create a ```visited``` set to mark the water cells as visited so that we don't revisit them again.

        Note: The visited set can be avoided by updating the original matrix grid but changing the input parameter is not considered under good practices.

2. Perform BFS: Traverse the current elements in the ```queue```, and for each element, check the coordinates in the four directions if they are water cells (```0```). If yes, insert them into the ```queue``` and change them to land cell (```1```) in the ```visited``` set.

3. After each level is traversed, i.e., the inner while loop completes, increment the variable distance.

4. Repeat the above until the ```queue``` becomes empty.

5. Return ```distance```. If it is equal to ```0```, it means there was no water cell, and the BFS finished after the first step itself, hence returning ```-1```. When the matrix doesn't have any land cell, the while loop will not start at all, and hence distance will have its initial value (```-1```).

```Python
class Solution:
    def maxDistance(self, grid: List[List[int]]) -> int:
        # Breadth-First Search
        ROWS, COLS = len(grid), len(grid[0])
        # Four directions: Up, Down, Left and Right.        
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        visited = set()
        distance = 0

        # Insert all the land cells into the queue
        queue = collections.deque()
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col] == 1:
                    visited.add((row, col))
                    queue.append((row, col))

        # Edge cases: grid has no land or no water
        if not queue or ROWS * COLS == len(queue): # no land or all land
            return -1

        while queue:
            size = len(queue)
            # Iterate over all the current cells in the queue
            while size > 0:
                row, col = queue.popleft()
                # From the current land cell, traverse to all the four directions 
                for x, y in DIRECTIONS:
                    new_row, new_col = row + x, col + y
                    # Check if the new cell is within the grid boundary and the cell is not land
                    if not (0 <= new_row < ROWS and 0 <= new_col < COLS and not (new_row, new_col) in visited):
                        continue
                    # If neighbor cell is water, convert it to land and add it to the queue.
                    visited.add((new_row, new_col))
                    queue.append((new_row, new_col))

                size -= 1

            # After each iteration of queue elements, increment distance by 1 as traversing to next neighbor cells
            distance += 1

        return distance - 1
```


