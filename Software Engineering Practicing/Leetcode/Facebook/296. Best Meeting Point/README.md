## [296. Best Meeting Point](https://leetcode.com/problems/best-meeting-point)

```Tag```: ```Matrix``` ```Breadth-First Search``` ```Sort``` ```Math``` ```SortedSet```

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

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m^2 \cdot n^2)$.
- __Space Complexity__: $\mathcal{O}(m \cdot n)$.

```Python
class Solution:
    def minTotalDistance(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        
        def search(row, col, distance):
            queue = collections.deque()
            visited = set()
            queue.append((row, col, 0))
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
                curr_distance = search(row, col, 0)
                ans = min(ans, curr_distance)

        return ans
```

### Math

#### Manhattan Distance Formula (Time Limit Exceeded)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m^2 \cdot n^2)$.
- __Space Complexity__: $\mathcal{O}(m \cdot n)$.

```Python
class Solution:
    def minTotalDistance(self, grid: List[List[int]]) -> int:
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        points = list()
        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col]:
                    points.append((row, col))

        def calculate_distance(points, row, col, distance):
            for curr_row, curr_col in points:
                distance += abs(curr_row - row) + abs(curr_col - col)
            return distance
        
        ans = math.inf
        for row in range(ROWS):
            for col in range(COLS):
                curr_distance = calculate_distance(points, row, col, 0)
                ans = min(ans, curr_distance)
        
        return ans
```

#### Sort & Get Median

Finding the best meeting point in a 2D grid seems difficult. Let us take a step back and solve the 1D case which is much simpler. Notice that the Manhattan distance is the sum of two independent variables. Therefore, once we solve the 1D case, we can solve the 2D case as two independent 1D problems.

Let us look at some 1D examples below:

```
Case #1: 1-0-0-0-1
Case #2: 0-1-0-1-0
```

We know the best meeting point must locate somewhere between the left-most and right-most point. For the above two cases, we would select the center point at ```x = 2``` as the best meeting point. How about choosing the mean of all points as the meeting point?

Consider this case:

```
Case #3: 1-0-0-0-0-0-0-1-1
```

Using the mean gives us $\bar{x} = \frac{0 + 7 + 8}{3} = 5$ as the meeting point. The total distance is ```10```. But the best meeting point should be at ```x = 7``` and the total distance is ```8```.

You may argue that the mean is close to the optimal point. But imagine a larger case with many 1's congregating on the right side and just a single 1 on the left-most side. Using the mean as the meeting point would be far from optimal.

Besides mean, what is a better way to represent the distribution of points? Would median be a better representation? Indeed. In fact, the median must be the optimal meeting point.

```
Case #4: 1-1-0-0-1
```

Choose the median ```x = 1``` as our initial meeting point. Assume that the total distance traveled is ```d```. Note that we have equal number of points distributed to its left and to its right. Now let us move one step to its right where ```x = 2``` and notice how the distance changes accordingly. Since there are two points to the left of ```x = 2```, we add ```2∗(+1)``` to ```d```. And ```d``` is offset by ```–1``` since there is one point to the right. This means the distance had overall increased by ```1```.

Therefore, it is clear that:

> As long as there is equal number of points to the left and right of the meeting point, the total distance is minimized.

```
Case #5: 1-1-0-0-1-1
```

One may think that the optimal meeting point must fall on one of the ```1```'s. This is true for cases with odd number of ```1```'s, but not necessarily true when there are even number of ```1```'s, just like case #5 does. You can choose any of the ```x = 1``` to ```x = 4``` points and the total distance is minimized.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(mn \cdot \log{}(mn)$.
- __Space Complexity__: $\mathcal{O}(m \cdot n)$.

```Python
class Solution:
    def minTotalDistance(self, grid: List[List[int]]) -> int:
        rows, cols = list(), list()
        ROWS, COLS = len(grid), len(grid[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        for row in range(ROWS):
            for col in range(COLS):
                if grid[row][col]:
                    rows.append(row)
                    cols.append(col)
                
        def calculate_distance(points, origin, distance):
            for point in points:
                distance += abs(point - origin)
            return distance
        
        row = rows[len(rows) // 2]
        cols.sort()
        col = cols[len(cols) // 2]
        return calculate_distance(rows, row, 0) + calculate_distance(cols, col, 0)
```

### ```SortedSet```

```Python

```
