## 322. Coin Change

```Tag```: ```Dynamic Programming```

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
        # Top-Down DP (Recursion)
        
        @lru_cache(None)
        def dp(curr, remaining):
            # Base cases
            if remaining == 0:
                return 0
            if curr < 0:
                return math.inf
            
            # Check next coin in coins
            ans = dp(curr - 1, remaining)

            # Check if there is remaining amount left
            if remaining >= coins[curr]:
                # Recurrence relation
                ans = min(ans, dp(curr, remaining - coins[curr]) + 1)
            return ans 
            
        n = len(coins)
        ans = dp(n - 1, amount)
        return ans if ans != math.inf else -1
```

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(remaining):
            # Base cases
            if remaining < 0:
                return -1
            if remaining == 0:
                return 0

            ans = float('inf')

            # Check every coin in coins
            for coin in coins:
                # Ignore cases where amount can not be made up
                result = dp(remaining - coin)
                if result != -1:
                    # Recurrence relation
                    ans = min(ans, dp(remaining - coin) + 1)
            return ans if ans != float('inf') else -1

        return dp(amount)
```

```Python
        @lru_cache(None)
        def dp(remaining):
            # Base case
            if remaining == 0:
                return 0
            
            ans = math.inf

            # Check every coin in coins
            for coin in coins:
                # Check if there is any remaining amount left
                if remaining >= coin:
                    # Recurrence relation
                    ans = min(ans, dp(remaining - coin) + 1)

            return ans
        
        ans = dp(amount)
        return ans if ans != math.inf else -1
```

#### Bottom-Up Dynamic Programming

```Python

```


---

### Depth-First Search

```Python

```

### Breadth-First Search

```Python

```
