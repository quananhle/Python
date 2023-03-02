## [54. Spiral Matrix](https://leetcode.com/problems/spiral-matrix/)

```Tag```: ```Matrix``` ```Depth-First Search``` ```Breadth-First Search``` ```Recursion``` ```Stack & Queue```

#### Difficulty: Medium

Given an ```m x n``` matrix, return _all elements of the ```matrix``` in spiral order_.

![image](https://user-images.githubusercontent.com/35042430/222346111-bdfc6bab-e63b-43d5-8f11-5b20b73cb052.png)

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

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= m, n <= 10```
- ```-100 <= matrix[i][j] <= 100```

---

### Recursive Depth-First Search

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # Depth-First Search
        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        res = list()

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
        
        dfs(0, 0, False)
        return res
```

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        ROWS, COLS = len(matrix), len(matrix[0])
        res = list()

        def dfs(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS and  matrix[row][col] != "#"):
                return
            res.append(matrix[row][col])
            matrix[row][col] = "#"  

            # Only traversing right while at possible top cell
            if row <= col + 1:
                # Traverse rightward
                dfs(row, col + 1)
                
            # Traverse downward
            dfs(row + 1, col)
            # Traverse leftward
            dfs(row, col - 1)
            # Traverse upward
            dfs(row - 1, col)

        dfs(0, 0)
        return res
```

#### Iterative Breath-First Search

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
                    From beginning, (0,0), traverse to the right (0 + 0, 0 + 1). After reaching the last column, exit while loop.
                    At the current pos, (0,3), rightward direction, (0,1), update pos (0 - 0, 3 - 1), update start pos.
                    - Move to the next direction, downward (1,0)
                    From current pos, (0,2), traverse to the bottom (0 + 1, 2 + 0). After reaching the last row, exit while loop.
                    At the current pos, (3,2), downward direction, (1,0), update pos (3 - 1, 2 - 0), update start pos.
                    - Move to the next direction, leftward (0,-1)
                    From current pos, (2,2), traverse to the left (2 + 0, 2 - 1). After reaching the first column, exit while loop.
                    At the current pos, (2,-1), leftward direction, (0,-1), update pos (2 + 0, -1 - (-1)), update start pos.
                    - Move to the next direction, upward (-1,0)
                    From current pos, (2,0), traverse to the top (2 - 1, 0 + 0). After reaching the possible top row and visited cell, 
                    exit while loop. At the current pos, (0,0), leftward direction, (-1,0), update pos (0 - (-1), 0 - 0), update start pos.   
                    """
                    row += dx
                    col += dy

                start_row, start_col = row - dx, col - dy

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

