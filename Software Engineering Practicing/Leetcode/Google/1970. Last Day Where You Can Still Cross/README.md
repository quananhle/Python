## [1970. Last Day Where You Can Still Cross](https://leetcode.com/problems/last-day-where-you-can-still-cross)

```Tag```: ```Binary Search``` ```Breadth-First Search``` ```Depth-First Search``` ```Union Find```

#### Difficulty: Hard

There is a __1-based__ binary matrix where ```0``` represents land and ```1``` represents water. You are given integers ```row``` and ```col``` representing the number of rows and columns in the matrix, respectively.

Initially on day ```0```, the entire matrix is land. However, each day a new cell becomes flooded with water. You are given a 1-based 2D array ```cells```, where ```cells[i] = [ri, ci]``` represents that on the i<sup>th</sup> day, the cell on the r<sub>i</sub><sup>th</sup> row and c<sub>i</sub><sup>th</sup> column (1-based coordinates) will be covered with water (i.e., changed to ```1```).

You want to find the __last__ day that it is possible to walk from the __top__ to the __bottom__ by only walking on land cells. You can start from __any__ cell in the top row and end at __any__ cell in the bottom row. You can only travel in the four cardinal directions (left, right, up, and down).

Return _the last day where it is possible to walk from the top to the bottom by only walking on land cells_.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/07/27/1.png)
```
Input: row = 2, col = 2, cells = [[1,1],[2,1],[1,2],[2,2]]
Output: 2
Explanation: The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/07/27/2.png)
```
Input: row = 2, col = 2, cells = [[1,1],[1,2],[2,1],[2,2]]
Output: 1
Explanation: The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 1.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/07/27/3.png)
```
Input: row = 3, col = 3, cells = [[1,2],[2,1],[3,3],[2,2],[1,1],[1,3],[2,3],[3,2],[3,1]]
Output: 3
Explanation: The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 3.
```

__Constraints:__

- ```2 <= row, col <= 2 * 10^4```
- ```4 <= row * col <= 2 * 10^4```
- ```cells.length == row * col```
- ```1 <= ri <= row```
- ```1 <= ci <= col```
- All the values of ```cells``` are unique.

---

![image](https://leetcode.com/problems/last-day-where-you-can-still-cross/Figures/1970/intro.png)

### Binary Search + Breadth-First Search

We split the problem into two parts:

- Given a graph, how do we determine if there is a pathway.
- As the water covers one more cell each day, how do we determine which day is the last day that a pathway exists?

1. Dequeue the next cell from the queue.
2. Check if the cell is in the bottom row the grid. If it is, then the grid is connected, and we can still cross it.
3. If the cell is not in the bottom row of the grid, we will mark the it as visited, and enqueue its land neighbors which have not been visited yet.
4. If we complete the BFS without reaching any of the land cells at the bottom, it means that there is no pathway.

![image](https://leetcode.com/problems/last-day-where-you-can-still-cross/Figures/1970/b1.png)

__Algorithm__

1. Initialize the search space by setting the left boundary to ```lo = 1``` and the right boundary to ```hi = n```.
2. Define ```can_cross(row, col, day)``` to check if we can still cross after ```day``` days.

Create an all-zero grid of size row * col.
Set all cells in cells[:day] to 1.
Add all land cells in the first row to an queue queue.
While queue is not empty, deque the first cell (cur_row, cur_col).
If cur_row == row - 1, it means we have reached the bottom row, return True.
Otherwise, we will check if it has unvisited land neighbors, then set their value to -1, and add them into queue.
If we finish the BFS without reaching the bottom row, return False.
While left < right:

Find the middle day mid = right - (right - left) / 2.
Use canCross(row, col, cells, mid) to check if there is a pathway.
If there is a pathway, set left = mid, otherwise, set right = mid - 1.
Return left as the last day when we can still cross.

```Python
class Solution:
    def latestDayToCross(self, row: int, col: int, cells: List[List[int]]) -> int:
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        def bfs(row, col, day):
            grid = [[0] * col for _ in range(row)]
            queue = collections.deque()

            for r, c in cells[:day]:
                grid[r - 1][c - 1] = 1
            
            for i in range(col):
                if not grid[0][i]:
                    queue.append((0, i))
                    grid[0][i] = -1
        
            while queue:
                r, c = queue.popleft()
                if r == row - 1:
                    return True
                for new_row, new_col in [(r + dx, c + dy) for dx, dy in DIRECTIONS]:
                    if not (0 <= new_row < row and 0 <= new_col < col and grid[new_row][new_col] == 0):
                        continue
                    grid[new_row][new_col] = -1
                    queue.append((new_row, new_col))
                
            return False
        
        lo, hi = 1, row * col

        while lo < hi:
            mi = hi - (hi - lo) // 2
            if bfs(row, col, mi):
                lo = mi
            else:
                hi = mi - 1
        
        return lo
```
