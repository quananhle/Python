## [864. Shortest Path to Get All Keys](https://leetcode.com/problems/shortest-path-to-get-all-keys)

```Tag```: ```Graph``` ```Breadth-First Search```

#### Difficulty: Hard

You are given an ```m x n``` grid ```grid``` where:

- ```'.'``` is an empty cell.
- ```'#'``` is a wall.
- ```'@'``` is the starting point.
- Lowercase letters represent keys.
- Uppercase letters represent locks.

You start at the starting point and one move consists of walking one space in one of the four cardinal directions. You cannot walk outside the grid, or walk into a wall.

If you walk over a key, you can pick it up and you cannot walk over a lock unless you have its corresponding key.

For some ```1 <= k <= 6```, there is exactly one lowercase and one uppercase letter of the first ```k``` letters of the English alphabet in the grid. This means that there is exactly one key for each lock, and one lock for each key; and also that the letters used to represent the keys and locks were chosen in the same order as the English alphabet.

Return _the lowest number of moves to acquire all keys_. If it is impossible, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/09c2dc95-b874-4a8f-bc9c-01fd83b0ce0c)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2021/07/23/lc-keys2.jpg)
```
Input: grid = ["@.a..","###.#","b.A.B"]
Output: 8
Explanation: Note that the goal is to obtain all the keys not to open all the locks.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/07/23/lc-key2.jpg)
```
Input: grid = ["@..aA","..B#.","....b"]
Output: 6
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/07/23/lc-keys3.jpg)
```
Input: grid = ["@Aa"]
Output: -1
```

__Constraints:__

- ```m == grid.length```
- ```n == grid[i].length```
- ```1 <= m, n <= 30```
- ```grid[i][j]``` is either an English letter, ```'.'```, ```'#'```, or ```'@'```.
- The number of keys in the grid is in the range ```[1, 6]```.
- Each key in the grid is unique.
Each key in the grid has a matching lock.

---

### Breadth-First Search

![image](https://leetcode.com/problems/shortest-path-to-get-all-keys/Figures/864/1.png)

![image](https://leetcode.com/problems/shortest-path-to-get-all-keys/Figures/864/2.png)

![image](https://leetcode.com/problems/shortest-path-to-get-all-keys/Figures/864/3.png)

![image](https://leetcode.com/problems/shortest-path-to-get-all-keys/Figures/864/4.png)

![image](https://leetcode.com/problems/shortest-path-to-get-all-keys/Figures/864/5.png)

Algorithm
Traverse over grid and do the following:

collect all keys and locks in key_set and lock_set so we can check if a square is a key or lock easily.

build the state that represents all keys.

find the starting position.

Initialize a queue queue and a hash map seen for BFS under different states. Start with the starting position.

While queue is not empty, dequeue a state (cur_row, cur_col, keys, distance).

Generate all possible moves from the current cell (up, down, left, and right), and for each move, check if it leads to a valid cell:

If the move leads to an unseen key, we can update the key-holding state by picking up this key. If we have collected all the keys, return distance + 1, otherwise, add this new state to queue and seen.

If the move leads to a lock and we don't have the corresponding key, skip this move.

If the move leads to a new state, add it to queue and seen.

Repeat steps 3 and 4 until either all cells under all states have been visited or there is no path to collect all the keys. If there is no path to collect all the keys, return -1.

```Python
class Solution:
    def shortestPathAllKeys(self, grid: List[str]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        queue = collections.deque()
        seen = collections.defaultdict(set)

        keys, locks = set(), set()
        key_count = 0
        start_row, start_col = -1, -1

        for row in range(ROWS):
            for col in range(COLS):
                cell = grid[row][col]
                # Key: the number of keys in the grid is in the range [1, 6]
                if cell in "abcdef":
                    key_count += (1 << (ord(cell) - ord('a')))
                    keys.add(cell)
                # Lock
                if cell in "ABCDEF":
                    locks.add(cell)
                if cell == '@':
                    start_row, start_col = row, col
        
        # [row, column, key_state, distance]
        queue.append((start_row, start_col, 0, 0))
        seen[0].add((start_row, start_col))

        while queue:
            row, col, key, dst = queue.popleft()
            for new_row, new_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= new_row < ROWS and 0 <= new_col < COLS and grid[new_row][new_col] != '#'):
                    continue
                cell = grid[new_row][new_col]
                # Check if the current cell is a key never been picked up
                if cell in keys and not ((1 << (ord(cell) - ord('a'))) & key):
                    new_key = (key | (1 << (ord(cell) - ord('a'))))
                    if new_key == key_count:
                        return dst + 1
                    seen[new_key].add((new_row, new_col))
                    queue.append((new_row, new_col, new_key, dst + 1))
                # Check if it is a lock but have no key
                elif cell in locks and not (key & (1 << (ord(cell) - ord('A')))):
                    continue
                elif not (new_row, new_col) in seen[key]:
                    seen[key].add((new_row, new_col))
                    queue.append((new_row, new_col, key, dst + 1))
        
        return -1
```
