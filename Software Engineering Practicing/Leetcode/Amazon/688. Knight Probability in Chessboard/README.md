## [688. Knight Probability in Chessboard](https://leetcode.com/problems/knight-probability-in-chessboard/)

```Tag```: ```Dynamic Programming ``` ```Math```

#### Difficulty: Medium

On an $n \times n$ chessboard, a knight starts at the cell ```(row, column)``` and attempts to make exactly ```k``` moves. The rows and columns are 0-indexed, so the top-left cell is ```(0, 0)```, and the bottom-right cell is ```(n - 1, n - 1)```.

A chess knight has eight possible moves it can make, as illustrated below. Each move is two cells in a cardinal direction, then one cell in an orthogonal direction.

![image](https://assets.leetcode.com/uploads/2018/10/12/knight.png)

Each time the knight is to move, it chooses one of eight possible moves uniformly at random (even if the piece would go off the chessboard) and moves there.

The knight continues moving until it has made exactly ```k``` moves or has moved off the chessboard.

Return _the probability that the knight remains on the board after it has stopped moving_.

![image](https://github.com/quananhle/Python/assets/35042430/d09286ea-b262-4779-bad9-fccd2bb51d55)

---

__Example 1__:
```
Input: n = 3, k = 2, row = 0, column = 0
Output: 0.06250
Explanation: There are two moves (to (1,2), (2,1)) that will keep the knight on the board.
From each of those positions, there are also two moves that will keep the knight on the board.
The total probability the knight stays on the board is 0.0625.
```

__Example 2__:
```
Input: n = 1, k = 0, row = 0, column = 0
Output: 1.00000
```

---

__Constraints__:

- $1 \le n \le 25$
- $0 \le k \le 100$
- $0 \le row, column \le n - 1$

---

### The Framework

#### Top-Down Dynamic Programming

__Complexity Analysis__

- Time Complexity: $\mathcal{O}(k \cdot n^{2})$
- Space Complexity: $\mathcal{O}(k \cdot n^{2})$

```Python
class Solution:
    def knightProbability(self, n: int, k: int, row: int, column: int) -> float:
        DIRECTIONS = [(2, 1), (1, 2), (-2, 1), (-1, 2), (2, -1), (1, -2), (-2, -1), (-1, -2)]
        memo = collections.defaultdict(int)

        @lru_cache(maxsize=None)
        def dp(row, col, curr):
            # Base cases
            if not (0 <= row < n and 0 <= col < n):
                return 0
            
            if curr == 0:
                return 1
            
            if (row, col, curr) in memo:
                return (row, col, curr)
            
            for dx, dy in DIRECTIONS:
                memo[(row, col, curr)] += dp(row + dx, col + dy, curr - 1) / 8
            
            return memo[(row, col, curr)]
        
        return dp(row, column, k)
```

```Python
class Solution:
    def knightProbability(self, n: int, k: int, row: int, column: int) -> float:
        DIRECTIONS = [(2, 1), (1, 2), (-2, 1), (-1, 2), (2, -1), (1, -2), (-2, -1), (-1, -2)]

        @lru_cache(maxsize=None)
        def dp(row, col, curr):
            # Base cases
            if not (0 <= row < n and 0 <= col < n):
                return 0
            
            if curr == 0:
                return 1
            
            return sum(dp(row + dx, col + dy, curr - 1) for dx, dy in DIRECTIONS) / 8
        
        return dp(row, column, k)
```
