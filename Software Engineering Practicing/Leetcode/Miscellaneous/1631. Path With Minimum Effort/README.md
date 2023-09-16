## [1631. Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Priority Queue``` ```Union-Find``` ```Binary Search Tree```

#### Difficulty: Medium

You are a hiker preparing for an upcoming hike. You are given ```heights```, a 2D array of size ```rows x columns```, where ```heights[row][col]``` represents the height of cell ```(row, col)```. You are situated in the top-left cell, ```(0, 0)```, and you hope to travel to the bottom-right cell, ```(rows-1, columns-1)``` (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.

A route's effort is the __maximum absolute difference__ in heights between two consecutive cells of the route.

Return _the minimum effort required to travel from the top-left cell to the bottom-right cell_.

![image](https://github.com/quananhle/Python/assets/35042430/219e158f-bdc2-486b-bb6e-b92c40f8900d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/04/ex1.png)
```
Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
Output: 2
Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/10/04/ex2.png)
```
Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
Output: 1
Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/10/04/ex3.png)
```
Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
Output: 0
Explanation: This route does not require any effort.
```

__Constraints:__

- $rows == heights.length$
- $columns == heights[i].length$
- $1 \le rows, columns \le 100$
- $1 \le heights[i][j] \le 10^{6}$

---

###

```Python
class Solution:
    def minimumEffortPath(self, heights: List[List[int]]) -> int:
        ROWS, COLS = len(heights), len(heights[0])
        DIRECTIONS = [(1,0), (0, 1), (-1, 0), (0, -1)]
        visited = set()
        ans = math.inf

        queue = [(0, 0, 0)]
        efforts = [[math.inf] * COLS for _ in range(ROWS)]
        efforts[0][0] = 0

        while queue:
            effort, row, col = heapq.heappop(queue)
            if row == ROWS - 1 and col == COLS - 1:
                return effort
            visited.add((row, col))
            for next_row, next_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if not (0 <= next_row < ROWS and 0 <= next_col < COLS and not (next_row, next_col) in visited):
                    continue
                max_effort = max(abs(heights[row][col] - heights[next_row][next_col]), efforts[row][col])
                if efforts[next_row][next_col] > max_effort:
                    efforts[next_row][next_col] = max_effort
                    heapq.heappush(queue, (max_effort, next_row, next_col))

        return -1
```
