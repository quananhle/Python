## [542. 01 Matrix](https://leetcode.com/problems/01-matrix)

```Tag```: ```Array``` ```Dynamic Programming``` ```Breadth-First Search``` ```Matrix```

#### Difficulty: Medium

Given an ```m x n``` binary matrix ```mat```, return _the distance of the nearest ```0``` for each cell_.

The distance between two adjacent cells is ```1```.

![image](https://user-images.githubusercontent.com/35042430/209421046-e30988fa-6d05-4b9e-b61a-4b0386777601.png)

---

__Example 1:__

```
Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
Output: [[0,0,0],[0,1,0],[0,0,0]]
```

__Example 2:__

```
Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
Output: [[0,0,0],[0,1,0],[1,2,1]]
```

__Constraints:__

```
m == mat.length
n == mat[i].length
1 <= m, n <= 104
1 <= m * n <= 104
mat[i][j] is either 0 or 1.
There is at least one 0 in mat.
```

---

### Brute Force

```Python
class Solution:
    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:
        # Time Limit Exceeded
        ROWS, COLS = len(mat), len(mat[0])

        res = [[math.inf if mat[row][col] != 0 else 0 for col in range(COLS)] for row in range(ROWS)]

        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col] != 0:
                    for r in range(ROWS):
                        for c in range(COLS):
                            if mat[r][c] == 0:
                                output[row][col] = min(output[row][col], abs(row - r) + abs(col - c))

        return res
```

### Breadth-First Search

```Python
class Solution:
    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:
        # Breadth-First Search
        #### Time complexity: O(row * col), iterate through row and col of matrix
        #### Space complexity: O(row * col), extra space required to build 2D queue
        ROWS, COLS = len(mat), len(mat[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        visited = set()
        queue = collections.deque()

        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col] == 0:
                    queue.append((row, col))
                    visited.add((row, col))

        while queue:
            r, c = queue.popleft()
            for x, y in DIRECTIONS:
                row, col = r + x, c + y
                if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                    continue
                mat[row][col] = mat[r][c] + 1
                visited.add((row, col))
                queue.append((row, col))
        
        return mat

```

### Dynamic Programming


```Python
class Solution:
    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:
        '''
        The distance of a cell from 0 can be calculated if we know the nearest distance for all the neighbors, in which case the    distance is the minimum distance of any neighbor + 1. And, instantly, the words that come to mind are Dynamic Programming (DP)!!
        From each 1, the minimum path to 0 could be in any direction. So, we need to check all the 4 directions. In one iteration from top to bottom, we can check left and top directions, and we need another iteration from bottom to top to check for right and bottom directions.
        '''

        # Dynamic Programming
        #### Time complexity: O(row * col), iterate through row and col of matrix

        ROWS, COLS = len(mat), len(mat[0])
        memo = [[float('inf')] * COLS for _ in range(ROWS)]

        if not mat or not mat[0]:
            return mat
        
        # First pass: iterate over the matrix from top to bottom and left to right
        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col] != 0:
                    if row > 0:
                        memo[row][col] = min(memo[row][col], memo[row-1][col] + 1)
                    if col > 0:
                        memo[row][col] = min(memo[row][col], memo[row][col-1] + 1)
                else:
                    memo[row][col] = 0
        
        # Second pass: iterate over the matrix from bottom to top and right to left
        for row in range(ROWS-1, -1, -1):
            for col in range(COLS-1, -1, -1):
                if mat[row][col] != 0:
                    if row + 1 < ROWS:
                        memo[row][col] = min(memo[row][col], memo[row+1][col] + 1)
                    if col + 1 < COLS:
                        memo[row][col] = min(memo[row][col], memo[row][col+1] + 1)
                else:
                    memo[row][col] = 0

        return memo
```
