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

![image](https://user-images.githubusercontent.com/35042430/219751308-2390dc0c-86bb-4d90-b672-758df2892625.png)

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # Bottom-Up DP (Tabulation) 
        n = len(coins)
        # 'coin' has value of at least 1, so it can take up to 'amount' times to make up 'amount'
        dp = [[float('inf')] * (amount + 1) for _ in range(n)]

        for i in range(n):
            # Base case: since there is no 'coin' of 0 value, therefore 'dp[i][0] = 0' in case 'amount' = 0
            dp[i][0] = 0
            for amt in range(1, amount + 1):
                dp[i][amt] = dp[i - 1][amt]
                if amt >= coins[i]:
                    # Recurrence relation: To not take the coin or to take the coin
                    dp[i][amt] = min(dp[i][amt], dp[i][amt - coins[i]] + 1)
        
        return dp[n - 1][amount] if dp[n - 1][amount] != float('inf') else -1
```

#### Optimized Space Bottom-Up Dynamic Programming

![image](https://leetcode.com/media/original_images/322_coin_change_table.png)

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # Optimized Space Bottom-Up DP (Tabulation) 
        n = len(coins)
        # 'coin' has value of at least 1, so it can take up to 'amount' times to make up 'amount'
        dp = [float('inf')] * (amount + 1)
        dp[0] = 0

        for amnt in range(1, amount+1):
            for coin in coins:
                if amnt >= coin:
                    # Recurrence relation
                    dp[amnt] = min(dp[amnt], dp[amnt-coin] + 1)

        return dp[amount] if dp[amount] != math.inf else -1
```

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # Optimized Space Bottom-Up DP (Tabulation) 
        # 'coin' has value of at least 1, so it can take up to 'amount' times to make up 'amount'
        dp = [float('inf')] * (amount + 1)
        dp[0] = 0
        
        for coin in coins:
            for x in range(coin, amount + 1):
                dp[x] = min(dp[x], dp[x - coin] + 1)
                
        return dp[amount] if dp[amount] != float('inf') else -1 
```

---

### Depth-First Search

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # Depth-First Search
        ### Time Limit Exceeded
        n = len(coins)

        def dfs(curr, amnt):
            if amnt == 0:
                return 0
            if curr >= n or amount < 0:
                return -1

            ans = float('inf')
            for coin in range(0, amnt // coins[curr] + 1):
                remaining = amnt - coin * coins[curr]
                # Move on to the next coin
                res = dfs(curr + 1, remaining)
                # Check only if amount can be made up
                if res != -1:
                    ans = min(ans, res + coin)
            return ans if ans != float('inf') else -1

        return dfs(0, amount)
```

### Breadth-First Search

```Python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # Breadth-First Search
        ### Time Limit Exceeded
        n = len(coins)
        if not amount:
            return amount
        
        queue = collections.deque([(0, amount)])

        while queue:
            current, remaining = queue.popleft()
            for coin in coins:
                if remaining == coin:
                    return current + 1
                elif remaining > coin:
                    queue.append((current + 1, remaining - coin))
        return -1
```
