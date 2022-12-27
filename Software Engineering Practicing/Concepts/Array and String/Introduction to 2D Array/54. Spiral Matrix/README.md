## 54. Spiral Matrix

```Tag```:

#### Difficulty: Medium

Given an ```m x n``` matrix, return _all elements of the ```matrix``` in spiral order_.

![image](https://user-images.githubusercontent.com/35042430/209489352-7ccb0e0c-7071-4883-99ca-b5c9bae6ce06.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/13/spiral1.jpg)
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,3,6,9,8,7,4,5]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/13/spiral.jpg)
```
Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
```

__Constraints:__

```
m == matrix.length
n == matrix[i].length
1 <= m, n <= 10
-100 <= matrix[i][j] <= 100
```

---

### Set Up Boundaries

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Boundaries
        res = list()
        ROWS, COLS = len(matrix), len(matrix[0])
        left, right, top, bottom = 0, len(matrix[0]) - 1, 0, len(matrix) - 1

        while len(res) < ROWS * COLS:
            # If reached left boundary and top boundary, traverse rightward
            for col in range(left, right + 1):
                res.append(matrix[top][col])
            
            # If reached right boundary and top boundary, traverse downward
            for row in range(top + 1, bottom + 1):
                res.append(matrix[row][right])

            # Make sure moved to the different row
            if top != bottom:
                # If reached right boundary and bottom boundary, traverse backward to leftward
                for col in range(right - 1, left - 1, -1):
                    res.append(matrix[bottom][col])

            # Make sure moved to the different row
            if left != right:
                # If reached left boundary and bottom boundary, traverse upward
                for row in range(bottom - 1, top, -1):
                    res.append(matrix[row][left])
            
            # Update the boundaries
            left += 1
            right -= 1
            top += 1
            bottom -= 1

        return res
```

### Depth-First Search

Must make sure dfs to go all the way up before checking other cells, or only checking right cell after being unable to move up any further

|1|2|3|4|
|--|--|--|--
|5|6|7|8|
|9|10|11|12|
|13|14|15|16

![image](https://user-images.githubusercontent.com/35042430/209625162-71312a0c-a0c9-421d-b5c0-e53152ba89c5.png)
        
```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Depth-First Search
        ROWS, COLS = len(matrix), len(matrix[0])
        res = list()
        visited = set()

        left, right, up, down = False, False, False, False

        def dfs(row, col, dir):
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                return
            visited.add((row, col))
            res.append(matrix[row][col])
            # Make sure to go all the way up until visited row reached
            if dir:
                up = True
                dfs(row - 1, col, up)
            # Traverse rightward
            dfs(row, col + 1, right)
            # Traverse downward
            dfs(row + 1, col, down)
            # Traverse leftward
            dfs(row, col - 1, left)
            # Traverse upward
            dfs(row - 1, col, not down)

        dfs(0, 0, right)
        return res
```

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Depth-First Search
        ROWS, COLS = len(matrix), len(matrix[0])
        res = list()

        def dfs(matrix, row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS and matrix[row][col] != "$"):
                return
            res.append(matrix[row][col])
            # Mark visited cell
            matrix[row][col] = "$"  

            # Only traversing right while at possible top cell
            if row <= col + 1:
                # Traverse rightward                
                dfs(matrix, row, col + 1)  
            # Traverse downward
            dfs(matrix, row + 1, col)
            # Traverse leftward
            dfs(matrix, row, col - 1)
            # Traverse upward
            dfs(matrix, row - 1, col)

        dfs(matrix, 0, 0)
        return res
```

### Breadth-First Search

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Breath-First Search
        DIRECTIONS = [(0,1), (1,0), (0,-1), (-1,0)]     # Rightward, Downward, Leftward, Upward
        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        queue = collections.deque([(0,0)])
        res = list()

        if not matrix:
            return []

        while queue:
            start_row, start_col = queue.popleft()
            if not (0 <= start_row < ROWS and 0 <= start_col < COLS and not (start_row, start_col) in visited):
                continue
            res.append(matrix[start_row][start_col])
            visited.add((start_row, start_col))

            for dx, dy in DIRECTIONS:
                # Always goes in the order of Rightward, Downward, Leftward, Upward
                row, col = start_row + dx, start_col + dy
                while 0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited:
                    res.append(matrix[row][col])
                    visited.add((row, col))

                    """
                       0 1 2
                    0 [1 2 3]
                    1 [4 5 6]
                    2 [7 8 9]

                    - Start with the rightward direction, (0,1)
                    From beginning, (0,0), traverse to the right (0 + 0, 0 + 1). After reaching the last column, exit while loop
                    At the current pos, (0,3), rightward direction, (0,1), update pos (0 - 0, 3 - 1), update start pos
                    - Move to the next direction, downward (1,0)
                    From current pos, (0,2), traverse to the bottom (0 + 1, 2 + 0). After reaching the last row, exit while loop
                    At the current pos, (3,2), downward direction, (1,0), update pos (3 - 1, 2 - 0), update start pos
                    - Move to the next direction, leftward (0,-1)
                    From current pos, (2,2), traverse to the left (2 + 0, 2 - 1). After reaching the first column, exit while loop
                    At the current pos, (2,-1), leftward direction, (0,-1), update pos (2 + 0, -1 - (-1)), update start pos
                    - Move to the next direction, upward (-1,0)
                    From current pos, (2,0), traverse to the top (2 - 1, 0 + 0). After reaching the possible top row and visited cell, exit while loop
                    At the current pos, (0,0), leftward direction, (-1,0), update pos (0 - (-1), 0 - 0), update start pos    
                    """
                    row += dx
                    col += dy
                row -= dx
                col -= dy
                start_row, start_col = row, col

            """
            From the current pos (1,0), check if there is a cell to the right at (1, 0 + 1)
            If there is, append to queue to add to res and find all possible directions from that cell
            """
            # After moving all the way up, check if right cell has been visited
            if not (start_row, start_col + 1) in visited:
                # If not visited, start rightward traversal in the new row
                queue.append((start_row, start_col + 1))

        return res
```
