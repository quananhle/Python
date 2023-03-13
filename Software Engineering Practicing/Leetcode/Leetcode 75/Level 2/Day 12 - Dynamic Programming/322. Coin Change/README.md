## [322. Coin Change](https://leetcode.com/problems/coin-change/)

```Tag```: ```Dynamic Programming``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

You are given an integer array ```coins``` representing coins of different denominations and an integer ```amount``` representing a total amount of money.

Return _the fewest number of coins that you need to make up that amount_. If that amount of money cannot be made up by any combination of the coins, return ```-1```.

You may assume that you have an infinite number of each kind of coin.

![image](https://user-images.githubusercontent.com/35042430/219496083-ecd8bd2a-d754-42ba-975e-fb06820b9d4c.png)

---

__Example 1:__
```
Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1
```

__Example 2:__
```
Input: coins = [2], amount = 3
Output: -1
```

__Example 3:__
```
Input: coins = [1], amount = 0
Output: 0
```

__Constraints:__

- ```1 <= coins.length <= 12```
- ```1 <= coins[i] <= 2^31 - 1```
- ```0 <= amount <= 10^4```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        n = len(coins)

        @lru_cache(None)
        def dp(curr, remaining):
            # Base case
            if remaining == 0:
                return 0
            if remaining < 0 or curr < 0:
                return math.inf

            # Recurrence relation: is the current coin a possible denomination or next coin?
            
            # Check the next coin
            ans = dp(curr - 1, remaining)

            # Check the current coin
            if remaining >= coins[curr]:
                ans = min(ans, dp(curr, remaining - coins[curr]) + 1)

            return ans

        ans = dp(n - 1, amount)
        return ans if ans != math.inf else -1
```

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        n = len(coins)
        memo = collections.defaultdict(int)
        
        def dp(curr, remaining):
            # Base case
            if remaining == 0:
                return 0
            if remaining < 0 or curr < 0:
                return math.inf

            if (curr, remaining) in memo:
                return memo[(curr, remaining)]

            # Recurrence relation: is the current coin a possible denomination or next coin?
            
            # Check the next coin
            memo[(curr, remaining)] = dp(curr - 1, remaining)

            # Check the current coin
            if remaining >= coins[curr]:
                memo[(curr, remaining)] = min(memo[(curr, remaining)], dp(curr, remaining - coins[curr]) + 1)

            return memo[(curr, remaining)]

        ans = dp(n - 1, amount)
        return ans if ans != math.inf else -1
```

