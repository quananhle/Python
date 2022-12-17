## 286. Walls and Gates

```Tag```: ```Queue``` ```Breadth-First Search``` ```BFS```

#### Difficulty: Medium

You are given an ```m x n``` grid ```rooms``` initialized with these three possible values.

- ```-1``` A wall or an obstacle.
- ```0``` A gate.
- ```INF``` Infinity means an empty room. We use the value 2<sup>31</sup> - 1 = ```2147483647``` to represent ```INF``` as you may assume that the distance to a gate is less than ```2147483647```.

Fill each empty room with the distance to its _nearest gate_. If it is impossible to reach a gate, it should be filled with ```INF```.

![image](https://user-images.githubusercontent.com/35042430/208265729-88eaf4b6-a639-43ae-a638-8050e64bfa9e.png) 

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/03/grid.jpg)
```
Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
```
__Example 2:__

```
Input: rooms = [[-1]]
Output: [[-1]]
```

__Constraints:__

```
m == rooms.length
n == rooms[i].length
1 <= m, n <= 250
rooms[i][j] is -1, 0, or 231 - 1.
```

---

### For shortest-path problems:

- If graph weights are __equal__: ```Bellman-Ford```, ```Dijkstra's algorithms``` and ```BFS traversal``` are all solutions but the ```BFS``` is the most efficient
- If graph weights are different and all are __positive__: ```Bellman-Ford``` and ```Dijkstra's algorithms``` are solutions but the ```Dijkstra's``` is the most efficient
- If graph weights are different and could be __positive/negative__: ```Bellman-Ford``` algorithms is the only solution betweem the 3 algorithm mentioned here.

### Breadth-First Search

```Python
class Solution:
    def wallsAndGates(self, rooms: List[List[int]]) -> None:
        """
        Do not return anything, modify rooms in-place instead.
        """
        # Breadth-First Search
        #### Time Complexity: O(M*N), breadth-first search takes at most M * N steps to reach all rooms
        #### Space Complexity: O(M*N)

        ROWS, COLS = len(rooms), len(rooms[0])
        DIRECTIONS = [(1,0), (-1,0), (0,1), (0,-1)]
        # Get the coordinators of gates in rooms and store them in queue
        queue = [(i, j) for i, row in enumerate(rooms) for j, e in enumerate(row) if e == 0]
        # Check every gate
        for i, j in queue:
            # Find the possible directions from the gate
            for row, col in (i+1, j), (i-1, j), (i, j+1), (i, j-1):
                # If not reached the borders of grid and is at an empty room
                if not (0 <= row < ROWS and 0 <= col < COLS and rooms[row][col] == 2147483647):
                    continue
                # Start from the gate = 0, accumulate 1 to every cell from the gate
                rooms[row][col] = 1 + rooms[i][j]
                # Add the cell to queue
                queue.append((row, col))
```

```Python
class Solution:
    def wallsAndGates(self, rooms: List[List[int]]) -> None:
        """
        Do not return anything, modify rooms in-place instead.
        """
        # Breadth-First Search
        #### Time Complexity: O(M*N), breadth-first search takes at most M * N steps to reach all rooms
        #### Space Complexity: O(M*N)
        if not rooms:
            return

        visited = set()
        ROWS, COLS = len(rooms), len(rooms[0])
        DIRECTIONS = [(1,0),(0,1),(-1,0),(0,-1)]
        queue = collections.deque()

        for row in range(ROWS):
            for col in range(COLS):
                if rooms[row][col] == 0:
                    queue.append((row, col))
        
        while queue:
            row, col = queue.popleft()
            for (x, y) in DIRECTIONS:
                if (0 <= row + x < ROWS and 0 <= col + y < COLS) and rooms[row+x][col+y] == 2147483647 and (row + x, col + y) not in visited:
                    rooms[row+x][col+y] = rooms[row][col] + 1
                    visited.add((row+x, col+y))
                    queue.append((row+x, col+y))
```
