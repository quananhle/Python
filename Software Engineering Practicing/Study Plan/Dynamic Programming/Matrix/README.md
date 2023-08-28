## Matrix

### 62. Unique Paths

```Python
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        DIRECTIONS = [(1, 0), (0, 1)]

        @lru_cache(maxsize=None)
        def dp(row, col):
            # Base case
            if not (0 <= row < m and 0 <= col < n):
                return 0

            if row == m - 1 and col == n - 1:
                return 1
            
            ans = dp(row + 1, col) + dp(row, col + 1)
            return ans
        
        return dp(0, 0)
```
