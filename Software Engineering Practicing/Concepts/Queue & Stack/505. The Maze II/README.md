## [505. The Maze II](https://leetcode.com/problems/the-maze-ii)

```Tag```: ```Breadth-First Search``` ```Depth-First Search``` ```Dijkstra's Algorithm``` ```Priority Queue``` ```A* Search Algorithm```

#### Difficulty: Medium

There is a ball in a ```maze``` with empty spaces (represented as ```0```) and walls (represented as ```1```). The ball can go through the empty spaces by rolling __up, down, left or right__, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

Given the ```m x n``` ```maze```, the ball's ```start``` position and the destination, where $start = [start_{row}, start_{col}]$ and $destination = [destination_{row}, destination_{col}]$, return _the shortest distance for the ball to stop at the ```destination```_. If the ball cannot stop at ```destination```, return ```-1```.

The distance is the number of empty spaces traveled by the ball from the ```start``` position (excluded) to the ```destination``` (included).

You may assume that the borders of the maze are all walls (see examples).

![image](https://github.com/quananhle/Python/assets/35042430/80c348a5-af4e-4517-b032-323ad1c8374d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/31/maze1-1-grid.jpg)
```
Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
Output: 12
Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.
The length of the path is 1 + 1 + 3 + 1 + 2 + 2 + 2 = 12.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/31/maze1-2-grid.jpg)
```
Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [3,2]
Output: -1
Explanation: There is no way for the ball to stop at the destination. Notice that you can pass through the destination but you cannot stop there.
```

__Example 3:__
```
Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
Output: -1
```

__Constraints:__

- $m == maze.length$
- $n == maze[i].length$
- $1 \le m, n \le 100$
- $maze[i][j]$ is ```0``` or ```1```.
- $start.length == 2$
- $destination.length == 2$
- $0 \le start_{row}, destination_{row} \lt m$
- $0 \le start_{col}, destination_{col} \lt n$
- Both the ball and the destination exist in an empty space, and they will not be in the same position initially.
- The ```maze``` contains at least ```2``` empty spaces.

---

### Breadth-First Search

It should be noted that the ball will continue to roll in the same direction until it hits a wall. We can only change the direction of the ball once it hits a wall and comes to a halt.

```Python
class Solution:
    def shortestDistance(self, maze: List[List[int]], start: List[int], destination: List[int]) -> int:
        ROWS, COLS = len(maze), len(maze[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        visited = dict()
        start, destination = tuple(start), tuple(destination)

        queue = collections.deque([(0, start)])

        while queue:
            n = len(queue)
            for _ in range(n):
                distance, curr = queue.popleft()

                # Check if the current position is previously visited from a shorter distance, no further search needed from this point
                if curr in visited and visited[curr] <= distance:
                    continue

                # Keep track of the distance to the current position
                visited[curr] = distance

                for dx, dy in DIRECTIONS:
                    curr_row, curr_col = curr
                    new_distance = 0
                    # Ball keeps moving to any direction in empty spaces
                    while 0 <= curr_row + dx < ROWS and 0 <= curr_col + dy < COLS and maze[curr_row + dx][curr_col + dy] == 0:
                        curr_row += dx
                        curr_col += dy
                        new_distance += 1

                    queue.append((new_distance + distance, (curr_row, curr_col)))

        return visited[destination] if destination in visited else -1
```

### Dijkstra's algorithm

```Python
class Solution:
    def shortestDistance(self, maze: List[List[int]], start: List[int], destination: List[int]) -> int:
        ROWS, COLS = len(maze), len(maze[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        start, destination = tuple(start), tuple(destination)

        h = [(0, start)]

        while h:
            distance, curr = heapq.heappop(h)

            # Check if visiting destination, return the distance directly since Dijkstra's algorithm guarantees nodes appearing in shortest distance ordering.
            if curr == destination:
                return distance

            if curr in visited:
                continue
            visited.add(curr)

            for dx, dy in DIRECTIONS:
                row, col = curr
                tmp = 0

                while 0 <= row + dx < ROWS and 0 <= col + dy < COLS and maze[row + dx][col + dy] == 0:
                    row += dx
                    col += dy
                    tmp += 1

                heapq.heappush(h, (distance + tmp, (row, col)))
        
        return -1
```

### A* Search Algorithm (Best-First Search)

```
Dijkstra's Algorithm: best to find the shortest paths to all possible destinations
A* Search Algorithm: best to find the shortest path from start to a single destination
```
