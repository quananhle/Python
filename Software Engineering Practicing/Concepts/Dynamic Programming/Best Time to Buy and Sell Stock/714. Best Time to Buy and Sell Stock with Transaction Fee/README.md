## [714. Best Time to Buy and Sell Stock with Transaction Fee](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given an array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day, and an integer ```fee``` representing a transaction fee.

Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

![image](https://user-images.githubusercontent.com/35042430/221039417-243a02c9-433c-41d8-9de8-3aa067d3f477.png)

---

__Example 1:__
```
Input: prices = [1,3,2,8,4,9], fee = 2
Output: 8
Explanation: The maximum profit can be achieved by:
- Buying at prices[0] = 1
- Selling at prices[3] = 8
- Buying at prices[4] = 4
- Selling at prices[5] = 9
The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
```

__Example 2:__
```
Input: prices = [1,3,7,5,10,3], fee = 3
Output: 6
```

__Constraints:__

- 1 <= ```prices.length``` <= 5 * 10<sup>4</sup>
- 1 <= ```prices[i]``` < 5 * 10<sup>4</sup>
- 0 <= ```fee``` < 5 * 10<sup>4</sup>

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        memo = collections.defaultdict(int)

        def dp(i, holding):
            # Base cases
            if i == len(prices):
                return 0
            if (i, holding) in memo:
                return memo[(i, holding)]

            # Recurrence relation: to make a transaction or to not make a transaction
            
            # If decided to not make a transaction, move on to the next day
            do_nothing = dp(i + 1, holding)

            # If decided to make a transaction, check the ownership status
            if not holding:
                # Buy: move on to the next day, update ownership status, pay the price at ith day
                do_something = dp(i + 1, not holding) - prices[i]
            else:
                # Sell: move on to the next day, update ownership status, take profit less transaction fee
                do_something = dp(i + 1, not holding) + prices[i] - fee
            
            memo[(i, holding)] = max(do_nothing, do_something)
            return memo[(i, holding)]

        return dp(0, False)
```

```Python
class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(i, holding):
            # Base case
            if i == len(prices):
                return 0
            
            # Recurrence relation: to make a transaction or to not make a transaction
            
            # If decided to not make a transaction, move on to the next day
            do_nothing = dp(i + 1, holding)

            # If decided to make a transaction, check the ownership status
            if not holding:
                # Buy: move on to the next day, update ownership status, pay the price at ith day
                do_something = dp(i + 1, not holding) - prices[i]
            else:
                # Sell: move on to the next day, update ownership status, take profit less transaction fee
                do_something = dp(i + 1, not holding) + prices[i] - fee

            return max(do_nothing, do_something)

        return dp(0, False)
```

#### Bottom-Up Dynamic Programming (Tabulation) 

```Python
class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        n = len(prices)
        # Base case
        dp = [[0] * 2 for _ in range(n + 1)]

        for i in range(n - 1, -1, -1):
            for holding in range(2):
                # Decide not to buy or sell yet, move on to the next day
                do_nothing = dp[i + 1][holding]
                
                # Decide to buy or sell, sell if holding stock or buy if not holding stock
                if not holding:
                    # Buy: move on to the next day, update ownership status, pay price at ith day
                    do_something = dp[i + 1][1] - prices[i]
                else:
                    # Sell: move on to the next day, update ownership status, take profit less transaction fee
                    do_something = dp[i + 1][0] + prices[i] - fee
                    
                # Recurrence relation
                dp[i][holding] = max(do_nothing, do_something)

        return dp[0][0]
```

```Python
class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        n = len(prices)
        dp = [0 for _ in range(2)]
        
        for i in range(n - 1, -1, -1):
            curr_day = [0 for _ in range(2)]
            for holding in range(2):
                if not holding:
                    curr_day[holding] = max(dp[0], dp[1] - prices[i])
                else:
                    curr_day[holding] = max(dp[1], dp[0] + prices[i] - fee)
            dp = curr_day

        return dp[0]
```

---

### Greedy

```Python
class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        n = len(prices)
        if n < 2:
            return 0

        buy = prices[0]
        ans = 0

        for price in prices[1:]:
            if buy > price:
                buy = price
            # Check if make profit less transaction fee
            elif buy < price - fee:
                profit = price - fee - buy
                ans += profit
                # [1,8,9], buy on day 0, sell on day 2 instead of day 1, or sell on day 1 and get the difference on day 2
                buy = price - fee
        return ans
```
