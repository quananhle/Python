## 909. Snakes and Ladders

```Tag```: ```Breadth-First Seaarch``` ```Shortest-Path``` [```Dijkstra's algorithm```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Recursion/Dijkstra's%20Algorithm)

#### Difficulty: Medium

You are given an ```n x n``` integer matrix ```board``` where the cells are labeled from ```1``` to n<sup>2</sup> in a __Boustrophedon__ style starting from the bottom left of the board (i.e. ```board[n - 1][0]```) and alternating direction each row.

You start on square ```1``` of the board. In each move, starting from square ```curr```, do the following:

- Choose a destination square ```next``` with a label in the range ```[curr + 1, min(curr + 6, n^2)]```.
    - This choice simulates the result of a __standard 6-sided die roll__: i.e., there are always at most 6 destinations, regardless of the size of the board.

- If ```next``` has a snake or ladder, you must move to the destination of that snake or ladder. Otherwise, you move to ```next```.
- The game ends when you reach the square ```n^2```.

A board square on row ```r``` and column ```c``` has a snake or ladder if ```board[r][c] != -1```. The destination of that snake or ladder is ```board[r][c]```. Squares ```1``` and ```n^2``` do not have a snake or ladder.

Note that you only take a snake or ladder at most once per move. If the destination to a snake or ladder is the start of another snake or ladder, you do not follow the subsequent snake or ladder.

- For example, suppose the board is ```[[-1,4],[-1,3]]```, and on the first move, your destination square is ```2```. You follow the ladder to square ```3```, but do not follow the subsequent ladder to ```4```.

Return _the least number of moves required to reach the square n<sup>2</sup>_. If it is not possible to reach the square, return ```-1```.

[image](https://user-images.githubusercontent.com/35042430/214199552-c162dc1e-0626-4b4a-888b-28ec6fb91bfd.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/09/23/snakes.png)
```
Input: board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]
Output: 4
Explanation: 
In the beginning, you start at square 1 (at row 5, column 0).
You decide to move to square 2 and must take the ladder to square 15.
You then decide to move to square 17 and must take the snake to square 13.
You then decide to move to square 14 and must take the ladder to square 35.
You then decide to move to square 36, ending the game.
This is the lowest possible number of moves to reach the last square, so return 4.
```

__Example 2:__
```
Input: board = [[-1,-1],[-1,3]]
Output: 1
```

__Constraints:__
```
n == board.length == board[i].length
2 <= n <= 20
grid[i][j] is either -1 or in the range [1, n2].
The squares labeled 1 and n2 do not have any ladders or snakes.
```

---

![image](https://leetcode.com/problems/snakes-and-ladders/solutions/2912646/Figures/909/909_example.drawio.png)

### Breadth-First Search

__Time Complexity: O(N<sup>2</sup>)__

__Space Complexity: O(N<sup>2</sup>)__

```Python
class Solution:
    def snakesAndLadders(self, board: List[List[int]]) -> int:
        # Breadth-First Search
        ### Find the shortest path
        ROWS, COLS = len(board), len(board[0])
        queue = collections.deque([1])
        visited = {1}
        count = 0
        '''
        new_board = list()
        for i in range(len(board)-1, -1, -1):
            new_board.append(board[i])
        print (new_board)
        '''
        # Reverse board to get start to the top of the board
        board.reverse()
        
        # Traverse from left to right and right to left, by maintaing the orders of columns and reversing every 2 row
        for i in range(1, len(board), 2):
            board[i].reverse()
        # Flatten the 2D to 1D array and add None for the start cell to offset the 0-th index
        cells = [None] + list(itertools.chain(*board))
        n = len(cells) - 1

        while queue:
            for _ in range(len(queue)):
                curr = queue.popleft()
                if curr == n:
                    return count
                # Roll the next possible moves from 1 to 6 on the die for as far as the last cell on the board
                for i in range(curr + 1, min(curr + 6, n) + 1):
                    # Check if the ladder or snake
                    if cells[i] + 1:    # snake or ladder + 1 != 0
                        next = cells[i]
                    # Otherwise, get all possible moves from the die
                    else:               # normal cell -1 + 1 == 0
                        next = i

                    if next in visited:
                        continue
                    visited.add(next)
                    queue.append(next)
            # Increment count after every time die rolling
            count += 1
        return -1
```

```Python
class Solution:
    def snakesAndLadders(self, board: List[List[int]]) -> int:
        # Breadth-First Search
        ### Find the shortest path
        ROWS, COLS = len(board), len(board[0])
        n = len(board)
        queue = collections.deque([(1, 0)])
        visited = set()
        count = 0

        def compute_index(cell):
            '''
            col = (cell - 1) % COLS
            row = (cell - 1) // ROWS
            '''
            row, col = divmod(cell-1, n)
            # Starting from the bottom left of the board and alternating direction each row
            if row % 2:
                # Left -> right
                return ROWS - row - 1, COLS - col - 1
            else:
                # Right -> left
                return ROWS - row - 1, col
            
        while queue:
            curr, step = queue.popleft()
            r, c = compute_index(curr)
            print (board[r][c], r, c)
            # Check if there is snake or ladder
            if board[r][c] != -1:
                # Go to the destination of that snake or ladder
                curr = board[r][c]
            # Check if at the last cell
            if curr == n**2:
                return step
            # Check the next possible moves
            for next in range(curr + 1, min(curr + 6, n**2) + 1):       # min(curr + 6, n**2) not inclusive; hence, +1 in loop
                if not next in visited:
                    visited.add(next)
                    queue.append((next, step+1))
        # If last cell is not reachabled, return -1
        return -1
```

### Dijkstra's Algorithm


__Time Complexity: O(N<sup>2</sup>) * logn__

__Space Complexity: O(N<sup>2</sup>)__

```Python
class Solution:
    def snakesAndLadders(self, board: List[List[int]]) -> int:
        # Dijkstra's Algorithm
        ### Find the shortest path
        n = len(board)
        # Add None to the start to offset the 0-th index
        cells = [None] * (n**2 + 1)
        label = 1
        # Flatten the 2D array into 1D array
        columns = list(range(0, n))
        for row in range(n - 1, -1, -1):
            for column in columns:
                cells[label] = (row, column)
                label += 1
            # Reverse the column after every row as direction alternating each row
            columns.reverse()
        # Maintain distance to all cells from the start
        dist = [-1] * (n * n + 1)
        # Mark the first cell as distance to itself is 0
        dist[1] = 0
        # Priority queue of cells as pairs of (label, distance)
        queue = [(1, 0)]

        # Dijkstra's Algorithm
        while queue:
            curr, distance = heapq.heappop(queue)

            if distance != dist[curr]:
                continue
            for next in range(curr + 1, min(curr + 6, n**2) + 1):
                r, c = cells[next]
                # Check if there is snake or ladder
                if board[r][c] != -1:
                    # Go to the destination of snake or ladder
                    destination = board[r][c]
                else:
                    destination = next
                # Check if next destination is -1, not reached the last cell yet, or if found a shorter path
                if dist[destination] == -1 or dist[curr] + 1 < dist[destination]:
                    dist[destination] = dist[curr] + 1
                    heapq.heappush(queue, (destination, dist[destination]))
        return dist[n * n]
```
