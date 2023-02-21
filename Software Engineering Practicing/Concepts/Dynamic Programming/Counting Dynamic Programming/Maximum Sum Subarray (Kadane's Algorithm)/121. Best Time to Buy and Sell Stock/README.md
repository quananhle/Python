## 121. Best Time to Buy and Sell Stock

```Tag```: ```Greedy``` ```Dynamic Programming```

#### Difficulty: Easy

You are given an array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

You want to maximize your profit by choosing a __single day__ to buy one stock and choosing a __different day in the future__ to sell that stock.

Return the _maximum profit you can achieve from this transaction_. If you cannot achieve any profit, return ```0```.

![image](https://user-images.githubusercontent.com/35042430/220414974-c0ec4ccc-d5ed-4305-9fab-f9fb79823216.png)

---

__Example 1:__

```
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
```

__Example 2:__
```
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
```

__Constraints:__
```
1 <= prices.length <= 105
0 <= prices[i] <= 104
```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Top-Down Dynamic Programming
        res = list()

        @lru_cache(None)
        def dp(curr, have):
            # Base case
            if curr == len(prices):
                return 0
            
            # Recurrence relation: to make the transaction or not to make the transaction
            # If not making the transaction
            profit_1 = dp(curr + 1, have)

            # If making the transaction, must buy before selling
            if not have:
                # Buy
                profit_2 = dp(curr + 1, True) - prices[curr]
            else:
                # Sell
                profit_2 = prices[curr]
            
            return max(profit_1, profit_2)
        
        return dp(0, False)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Top-Down Dynamic Programming
        n = len(prices)
        ans = 0
        dp = [[0] * (n + 1) for _ in range(n + 1)]
        
        for sell in range(n):
            for buy in range(sell):
                if prices[buy] < prices[sell]:
                    dp[buy][sell] = prices[sell] - prices[buy]

        for profit in dp:
            ans = max(ans, max(profit))

        return ans
```

#### Space Optimized Bottom-Up Dynamic Programming (1D Array)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Top-Down Dynamic Programming
        n = len(prices)
        ans = 0
        dp = [0] * (n + 1)
        
        for sell in range(n):
            for buy in range(sell):
                if prices[buy] < prices[sell]:
                    dp[buy] = max(dp[buy], prices[sell] - prices[buy])

        for profit in dp:
            ans = max(ans, profit)

        return ans
```

---

### Greedy Algorithm

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        buy = float('inf')
        profit = 0

        for price in prices:
            if buy > price:
                buy = price
            elif profit < price - buy:
                profit = price - buy
                
        return profit 
```
