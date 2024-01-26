## [576. Out of Boundary Paths](https://leetcode.com/problems/out-of-boundary-paths)

```Tag```: ```Recursion``` ```Dynamic Programming```

#### Difficulty: Medium

There is an ```m x n``` grid with a ball. The ball is initially at the position $[startRow, startColumn]$. You are allowed to move the ball to one of the four adjacent cells in the grid (possibly out of the grid crossing the grid boundary). You can apply at most maxMove moves to the ball.

Given the five integers ```m```, ```n```, ```maxMove```, ```startRow```, ```startColumn```, return _the number of paths to move the ball out of the grid boundary_. Since the answer can be very large, return it modulo $10^9 + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/399a36f8-531f-40df-8db2-56a067ac37b9)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/28/out_of_boundary_paths_1.png)
```
Input: m = 2, n = 2, maxMove = 2, startRow = 0, startColumn = 0
Output: 6
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/04/28/out_of_boundary_paths_2.png)
```
Input: m = 1, n = 3, maxMove = 3, startRow = 0, startColumn = 1
Output: 12
```

__Constraints:__

- $1 \le m, n \le 50$
- $0 \le maxMove \le 50$
- $0 \le startRow \lt m$
- $0 \le startColumn \lt n$

---

### Brute Force (Time Limit Exceeded)

#### Recursion

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(4^n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def findPaths(self, m: int, n: int, maxMove: int, startRow: int, startColumn: int) -> int:
        MOD = 10**9 + 7

        # Base case: out of boundary
        if startRow == m or startColumn == n or startRow < 0 or startColumn < 0: return 1

        # Out of move
        if maxMove == 0: return 0

        return (self.findPaths(m, n, maxMove - 1, startRow - 1, startColumn) + \
               self.findPaths(m, n, maxMove - 1, startRow, startColumn - 1) + \
               self.findPaths(m, n, maxMove - 1, startRow + 1, startColumn) + \
               self.findPaths(m, n, maxMove - 1, startRow, startColumn + 1) % MOD
```
