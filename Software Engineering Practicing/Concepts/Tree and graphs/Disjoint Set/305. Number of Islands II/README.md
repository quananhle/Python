## 305. Number of Islands II

```Tag```: ```Union Find```

#### Difficulty: Hard

You are given an empty 2D binary grid ```grid``` of size ```m x n```. The grid represents a map where ```0```'s represent water and ```1```'s represent land. Initially, all the cells of ```grid``` are water cells (i.e., all the cells are ```0```'s).

We may perform an add land operation which turns the water at position into a land. You are given an array ```positions``` where ```positions[i]``` = [r<sub>i</sub>, c<sub>i</sub>] is the position (r<sub>i</sub>, c<sub>i</sub>) at which we should operate the i<sup>th</sup> operation.

Return _an array of integers ```answer``` where ```answer[i]``` is the number of islands after turning the cell (r<sub>i</sub>, c<sub>i</sub>) into a land_.

An __island__ is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

![image](https://user-images.githubusercontent.com/35042430/219112320-d54acf3b-e753-4149-afd8-18af4b9c53c7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/10/tmp-grid.jpg)
```
Input: m = 3, n = 3, positions = [[0,0],[0,1],[1,2],[2,1]]
Output: [1,1,2,3]
Explanation:
Initially, the 2d grid is filled with water.
- Operation #1: addLand(0, 0) turns the water at grid[0][0] into a land. We have 1 island.
- Operation #2: addLand(0, 1) turns the water at grid[0][1] into a land. We still have 1 island.
- Operation #3: addLand(1, 2) turns the water at grid[1][2] into a land. We have 2 islands.
- Operation #4: addLand(2, 1) turns the water at grid[2][1] into a land. We have 3 islands.
```

__Example 2:__
```
Input: m = 1, n = 1, positions = [[0,0]]
Output: [1]
```

__Constraints:__

- ```1 <= m, n, positions.length <= 10^4```
- ```1 <= m * n <= 10^4```
- ```positions[i].length == 2```
- 0 <= r<sub>i</sub> < m
- 0 <= c<sub>i</sub> < n
 
---

### Union Find


__Time Complexity__: ```O(M * N + L)```, for M and N are the number of rows and columns in the given grid, and L is the size of positions. 

__Space Complexity__: ```O(M * N)```, build the rank and root of size M * N

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.count = size

    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += self.rank[root_x]
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += self.rank[root_y]
            self.count -= 1
            return True
        else:
            return False

    def get_count(self):
        return self.count


class Solution:
    def numIslands2(self, m: int, n: int, positions: List[List[int]]) -> List[int]:
        ROWS, COLS = m, n
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        lands = set()
        answer = list()
        count = 0
        
        if not positions or len(positions) == 0:
            return [0]

        union_find = UnionFind(ROWS * COLS)

        # Check from every position in positions
        for row, col in positions:
            # Check if the position has neven been visited before
            if not (row, col) in lands:
                # Record the land cell
                lands.add((row, col))
                # Increment the count of island
                count += 1

            # Check every direction from the position
            for dx, dy in DIRECTIONS:
                new_row, new_col = row + dx, col + dy
                if not (0 <= new_row < ROWS and 0 <= new_col < COLS):
                    continue
                # Check if the cell is water
                if not (new_row, new_col) in lands:
                    continue
                # Otherwise, found corresponding land cell
                current_land = union_find.find(row * n + col)
                neighbor_land = union_find.find(new_row * n + new_col)

                # Merge two corresponding land cells into an island
                if current_land != neighbor_land:
                    union_find.union(current_land, neighbor_land)
                    count -= 1
            answer.append(count)
        return answer
```
