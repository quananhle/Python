## 502. IPO





Solving the problem using the Top-Down Dynamic Programming Framework (Time Limit Exceeded)

```Python
class Solution:
    def findMaximizedCapital(self, k: int, w: int, profits: List[int], capital: List[int]) -> int:
        # Top-Down DP (Recursion)
        ### Time Limit Exceeded
        n = len(profits)
        memo = collections.defaultdict(int)
        
        def dp(i: int, total_capital: int, remaining: int) -> int:
            # Base case
            if remaining == 0 or i == len(profits) or i == len(capital):
                return total_capital

            if (i, total_capital, remaining) in memo:
                return memo[(i, total_capital, remaining)]

            for curr in range(i, len(profits)):
                if total_capital >= capital[curr]:
                    memo[(i, total_capital, remaining)] = max(total_capital, dp(curr + 1, total_capital + profits[curr], remaining - 1))

            return memo[(i, total_capital, remaining)]
        
        return dp(0, w, k)
```

```Python
class Solution:
    def findMaximizedCapital(self, k: int, w: int, profits: List[int], capital: List[int]) -> int:
        ### Time Limit Exceeded
        n = len(profits)
        
        @lru_cache(None)
        def dp(i: int, curr: int, remaining: int) -> int:
            # Base case
            if remaining == 0 or i == len(profits) or i == len(capital):
                return curr

            # initialize the maximum capital to current capital
            max_capital = curr  
            for j in range(i, len(profits)):
                if capital[j] <= curr:
                    max_capital = max(max_capital, dp(j+1, curr+profits[j], remaining-1))

            return max_capital
        
        return dp(0, w, k)
```
