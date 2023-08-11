## [518. Coin Change II](https://leetcode.com/problems/coin-change-ii)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given an integer array ```coins``` representing coins of different denominations and an integer ```amount``` representing a total amount of money.

Return _the number of combinations that make up that amount_. If that amount of money cannot be made up by any combination of the coins, return ```0```.

You may assume that you have an infinite number of each kind of coin.

The answer is __guaranteed__ to fit into a signed 32-bit integer.

![image](https://user-images.githubusercontent.com/35042430/220194290-dcae9f4b-32b1-449e-bb21-1e64a7eecbbb.png)

---

__Example 1:__
```
Input: amount = 5, coins = [1,2,5]
Output: 4
Explanation: there are four ways to make up the amount:
5=5
5=2+2+1
5=2+1+1+1
5=1+1+1+1+1
```

__Example 2:__
```
Input: amount = 3, coins = [2]
Output: 0
Explanation: the amount of 3 cannot be made up just with coins of 2.
```

__Example 3:__
```
Input: amount = 10, coins = [10]
Output: 1
```

__Constraints:__

- $1 \le coins.length \le 300$
- $1 \le coins[i] \le 5000$
- All the values of ```coins``` are unique.
- $0 \le amount \le 5000$

---

### The Framework

#### Top Down Dynamic Programming (Recursion)

```Python
class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)

        def dp(curr, remaining):
            # Base cases
            if curr == len(coins) or remaining < 0:
                return 0
            if remaining == 0:
                return 1

            if (curr, remaining) in memo:
                return memo[(curr, remaining)]
                
            # Recurrence relation
            # To take the current coin, then update the remaining amount, or not to take the coin and move on to the next coin
            memo[(curr, remaining)] = dp(curr, remaining - coins[curr]) + dp(curr + 1, remaining)

            return memo[(curr, remaining)]

        return dp(0, amount)
```

```Python
class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(curr, remaining):
            # Base cases
            if curr == len(coins) or remaining < 0:
                return 0
            if remaining == 0:
                return 1
                
            # Recurrence relation
            # To take the current coin, then update the remaining amount, or not to take the coin and move on to the next coin
            ans = dp(curr, remaining - coins[curr]) + dp(curr + 1, remaining)

            return ans

        return dp(0, amount)
```

```Python
class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        @lru_cache(None)
        def dp(curr, remaining):
            # Base cases
            if curr == len(coins) or remaining < 0:
                return 0
            if remaining == 0:
                return 1
                
            # Recurrence relation
            
            # Not taking the current coin and move on to the next coin
            ans = dp(curr + 1, remaining)
            # Taking the current coin, then update the remaining amount
            ans += dp(curr, remaining - coins[curr])

            return ans

        return dp(0, amount)
```

```Python
class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        n = len(coins)

        @lru_cache(maxsize=None)
        def dp(curr, remaining):
            # Base cases
            if remaining == 0 and curr < n:
                return 1
            
            if curr >= n or remaining < 0:
                return 0
            
            # DP Transitions: take/retake or skip the current coin

            skip = dp(curr + 1, remaining)              # Skip: move on to the next coin, remaining amount stays the same
            take = dp(curr, remaining - coins[curr])    # Take: stay in the current coin to check if retake is possible, less the amount of current coin in remaining amount

            return skip + take
        
        return dp(0, amount)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        dp = collections.defaultdict(int)
        dp[0] = 1
        for coin in coins:
            for remaining in range(coin, amount + 1):
                dp[remaining] += dp[remaining - coin]

        return dp[amount]
```

