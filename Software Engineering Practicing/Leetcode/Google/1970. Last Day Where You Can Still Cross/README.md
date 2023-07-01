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
2. Define ```bfs(row, col, day)``` to check if we can still cross after ```day``` days:
    - Create an all-zero ```grid``` of size ```row * col```.
    - Set all cells in ```cells[:day]``` to ```1```.
    - Add all land cells in the first row to an queue ```queue```.
    - While queue is not empty, deque the first cell ```(cur_row, cur_col)```.
        - If ```curr_row == row - 1```, it means we have reached the bottom row, return ```True```.
        - Otherwise, we will check if it has unvisited land neighbors, then set their value to ```-1```, and add them into ```queue```.
        - If we finish the BFS without reaching the bottom row, return ```False```.
3. While ```lo < hi```:
    - Find the middle day ```mi = hi - (hi - lo) / 2```.
    - Check if there is a pathway after mid days.
    - If there is a pathway, set ```lo = mi```, otherwise, set ```hi = mi - 1```.
4. Return ```lo``` as the last day when we can still cross.

- __Time Complexity__: $O(row⋅col⋅log⁡(row⋅col))$
- __Space Complexity__: $O(row⋅col)$

```Python
class Solution:
    def latestDayToCross(self, row: int, col: int, cells: List[List[int]]) -> int:
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]

        def can_cross(row, col, day):
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
            if can_cross(row, col, mi):
                lo = mi
            else:
                hi = mi - 1
        
        return lo
```

### Binary Search + Depth-First Search

__Algorithm__

1. Initialize the search space by setting the left boundary to ```lo = 1``` and the right boundary to ```hi = n```.
2. Define ```can_cross(row, col, day)``` to check if we can still cross after ```day``` days.
    - Create an all-zero ```grid``` of size ```row * col```.
    - Set all cells in ```cells[:day]``` to ```1```.
    - Iterate over the first row, for any land cell ```(0, c)```, start ```DFS``` from this cell to explore its unvisited land neighbors recursively. If we reach any cell in the last row, then return ```True```.
    - If we can't reach the last row, return ```False```.
3. While ```lo < hi```:
    - Find the middle day ```mi = hi - (hi - lo) / 2```.
    - Check if there is a pathway after mid days.
    - If there is a pathway, set ```lo = mi```, otherwise, set ```hi = mi - 1```.
4. Return ```lo``` as the last day when we can still cross.

- __Time Complexity__: $O(row⋅col⋅log⁡(row⋅col))$
- __Space Complexity__: $O(row⋅col)$

```Python
class Solution:
    def latestDayToCross(self, row: int, col: int, cells: List[List[int]]) -> int:
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]

        def can_cross(row, col, day):
            grid = [[0] * col for _ in range(row)]

            for r, c in cells[:day]:
                grid[r - 1][c - 1] = 1

            def dfs(r, c):
                if not (0 <= r < row and 0 <= c < col and grid[r][c] == 0):
                    return False
                if r == row - 1:
                    return True
                
                grid[r][c] = -1
                for dx, dy in DIRECTIONS:
                    if dfs(r + dx, c + dy):
                        return True

                return False
            
            for i in range(col):
                if grid[0][i] == 0 and dfs(0, i):
                    return True
                
            return False
        
        lo, hi = 1, row * col

        while lo < hi:
            mi = hi - (hi - lo) // 2
            if can_cross(row, col, mi):
                lo = mi
            else:
                hi = mi - 1
        
        return lo
```

### Disjoint Set Union (on land cells)

- __Find__: Determine which subset a particular element is in. This can be used to determine if two elements are in the same subset.
- __Union__: Join two subsets into a single subset.

![image](https://leetcode.com/problems/last-day-where-you-can-still-cross/Figures/1970/uf1.png)

![image](https://leetcode.com/problems/last-day-where-you-can-still-cross/Figures/1970/uf2.png)

![image](https://leetcode.com/problems/last-day-where-you-can-still-cross/Figures/1970/uf3_1.png)

Algorithm
Create a disjoint set data structure dsu with a size of row * col + 2.

Create an all-one grid of size row * col representing the water cells after the last day.

Iterate over reversed cells, for each cell cells[i] = (r, c):

Check its neighbors in all four directions, and if there is a land cell (new_r, new_c), we connect the root of cells[i] to the root of this neighbor in dsu.

If r = 0, connect it with top.

If r = row - 1, connect it with bottom.

Check if top and bottom are connected, and return i if they are.

```Python
class UnionFind:

    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.size = size
    
    def find(self, x):
        if x != self.root[x]:
            self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += root_y
            self.size -= 1
        
    def get_count(self):
        return self.size
    
    def compare(self, x, y):
        return self.find(x) == self.find(y)


class Solution:
    def latestDayToCross(self, row: int, col: int, cells: List[List[int]]) -> int:
        uf = UnionFind(row * col + 2)
        grid = [[1] * col for _ in range(row)]
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]

        for i in range(len(cells) - 1, -1, -1):
            r, c = cells[i][0] - 1, cells[i][1] - 1
            grid[r][c] = 0
            index_1 = r * col + c + 1

            for new_row, new_col in [(r + dx, c + dy) for dx, dy in DIRECTIONS]:
                index_2 = new_row * col + new_col + 1
                if not (0 <= new_row < row and 0 <= new_col < col and grid[new_row][new_col] == 0):
                    continue
                uf.union(index_1, index_2)
                
        if r == 0:
            uf.union(0, index_1)
        if r == row - 1:
            uf.union(row * col + 1, index_1)
        if uf.find(0) == uf.find(row * col + 1):
            return i
```
