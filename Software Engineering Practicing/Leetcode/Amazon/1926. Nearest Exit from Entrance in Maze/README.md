## 1926. Nearest Exit from Entrance in Maze

#### Difficulty: Medium

You are given an ```m x n``` matrix ```maze``` __(0-indexed)__ with empty cells (represented as ```'.'```) and walls (represented as ```'+'```). You are also given the ```entrance``` of the maze, where __entrance = [entrance<sub>row</sub>, entrance<sub>col</sub>]__ denotes the row and column of the cell you are initially standing at.,

In one step, you can move one cell __up__, __down__, __left__, or __right__. You cannot step into a cell with a wall, and you cannot step outside the maze. Your goal is to find the __nearest exit__ from the ```entrance```. An __exit__ is defined as an __empty cell__ that is at the __border__ of the ```maze```. The ```entrance``` __does not count__ as an __exit__.

Return the __number of steps__ in the _shortest path_ from the ```entrance``` to the nearest __exit__, or __-1__ if no such path exists.

#### Example 1:

![image](https://assets.leetcode.com/uploads/2021/06/04/nearest1-grid.jpg)

```
Input: maze = [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], entrance = [1,2]
Output: 1
Explanation: There are 3 exits in this maze at [1,0], [0,2], and [2,3].
Initially, you are at the entrance cell [1,2].
- You can reach [1,0] by moving 2 steps left.
- You can reach [0,2] by moving 1 step up.
It is impossible to reach [2,3] from the entrance.
Thus, the nearest exit is [0,2], which is 1 step away.
```

#### Example 2:

![image](https://assets.leetcode.com/uploads/2021/06/04/nearesr2-grid.jpg)

```
Input: maze = [["+","+","+"],[".",".","."],["+","+","+"]], entrance = [1,0]
Output: 2
Explanation: There is 1 exit in this maze at [1,2].
[1,0] does not count as an exit since it is the entrance cell.
Initially, you are at the entrance cell [1,0].
- You can reach [1,2] by moving 2 steps right.
Thus, the nearest exit is [1,2], which is 2 steps away.
```

#### Example 3:

![image](https://assets.leetcode.com/uploads/2021/06/04/nearest3-grid.jpg)

```
Input: maze = [[".","+"]], entrance = [0,0]
Output: -1
Explanation: There are no exits in this maze.
```

#### Constraints:
```
maze.length == m
maze[i].length == n
1 <= m, n <= 100
maze[i][j] is either '.' or '+'.
entrance.length == 2
0 <= entrancerow < m
0 <= entrancecol < n
entrance will always be an empty cell.
```

---

### Breadth First Search (BFS)

```{Python}
"""
[["+",".","+","+","+","+","+"],["+",".","+",".",".",".","+"],["+",".","+",".","+",".","+"],["+",".",".",".","+",".","+"],["+","+","+","+","+",".","+"]]
[0,1]
[["+","+",".","+"],[".",".",".","+"],["+","+","+","."]]
[1,2]
[["+","+","+"],[".",".","."],["+","+","+"]]
[1,0]
[[".","+"]]
[0,0]
"""
class Solution(object):
    def nearestExit(self, maze, entrance):
        """
        :type maze: List[List[str]]
        :type entrance: List[int]
        :rtype: int
        """
        # Breadth First Search (BFS)
        ## For finding the shortest path in a matrix, Breadth First Search (BFS) is a promising method.
        #### Time complexity:
        #### Space complexity:

        ROWS, COLS = len(maze), len(maze[0])
        start_row, start_col = entrance
        queue = collections.deque([(start_row, start_col, 0)])
        visited = set([(start_row, start_col)])
        directions = [(1,0),(-1,0),(0,1),(0,-1)]

        # # Mark the entrance as visited to differentiate from exit
        # maze[start_row][start_col] = '+'

        while queue:
            row, col, cell = queue.popleft()
            # Check if cell visited and currently standing at the border of the maze
            if cell != 0 and (row + 1 == ROWS or row - 1 == -1 or col + 1 == COLS or col - 1 == -1):
                return cell
            # Search for possible step in neighbor cells from the current position
            for step_row, step_col in directions:
                next_row, next_col = row + step_row, col + step_col
                # If there exists an unvisited empty neighbor that is not border nor a wall
                '''
                if next_row < ROWS and next_row >= 0 and next_col < COLS \
                    and next_col >= 0 and maze[next_row][next_col] != '+' \
                    and (next_row, next_col) not in visited:
                '''
                if ROWS > next_row >= 0 <= next_col < COLS \
                    and maze[next_row][next_col] != '+' and (next_row, next_col) not in visited:
                        # Mark cell as visited and add to queue
                        visited.add((next_row, next_col))
                        queue.append((next_row, next_col, cell+1))
        return -1

        
```
