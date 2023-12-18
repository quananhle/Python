## [296. Best Meeting Point](https://leetcode.com/problems/best-meeting-point)

```Tag```: ```Matrix``` ```Breadth-First Search``` ```Sort```

#### Difficulty: Hard

Given an ```m x n``` binary grid ```grid``` where each ```1``` marks the home of one friend, return _the minimal total travel distance_.

The total travel distance is the sum of the distances between the houses of the friends and the meeting point.

The distance is calculated using Manhattan Distance, where ```distance(p1, p2) = |p2.x - p1.x| + |p2.y - p1.y|```.

![image](https://github.com/quananhle/Python/assets/35042430/34091cd1-0a46-48f5-ab5a-854e92547fcf)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/14/meetingpoint-grid.jpg)
```
Input: grid = [[1,0,0,0,1],[0,0,0,0,0],[0,0,1,0,0]]
Output: 6
Explanation: Given three friends living at (0,0), (0,4), and (2,2).
The point (0,2) is an ideal meeting point, as the total travel distance of 2 + 2 + 2 = 6 is minimal.
So return 6.
```

__Example 2:__
```
Input: grid = [[1,1]]
Output: 1
```

__Constraints:__

- $m == grid.length$
- $n == grid[i].length$
- $1 \le m, n \le 200$
- ```grid[i][j]``` is either ```0``` or ```1```.
- There will be at least two friends in the ```grid```.

---

### Breadth-First Search (Time Limit Exceeded)

```Python
class Solution:
    def minTotalDistance(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        
        def search(row, col):
            queue = collections.deque()
            visited = set()
            queue.append((row, col, 0))
            distance = 0
            while queue:
                r, c, d = queue.popleft()
                if not (0 <= r < ROWS and 0 <= c < COLS and not (r, c) in visited):
                    continue
                if grid[r][c]:
                    distance += d
                visited.add((r, c))
                '''
                for dx, dy in DIRECTIONS:
                    queue.append((r + dx, c + dy, d + 1))
                '''
                queue.extend((r + dx, c + dy, d + 1) for dx, dy in DIRECTIONS)
            return distance
        
        ans = math.inf
        for row in range(ROWS):
            for col in range(COLS):
                curr_distance = search(row, col)
                ans = min(ans, curr_distance)
        
        return ans
```
