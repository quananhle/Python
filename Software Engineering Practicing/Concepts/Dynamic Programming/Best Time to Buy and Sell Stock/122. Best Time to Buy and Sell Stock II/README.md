## [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)

```Tag```: ```Dynamic Programming``` ```Greedy```

#### Difficulty: Medium

You are given an integer array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

On each day, you may decide to buy and/or sell the stock. You can only hold __at most one__ share of the stock at any time. However, you can buy it then immediately sell it on the same day.

Find and return _the __maximum__ profit you can achieve_.

![image](https://user-images.githubusercontent.com/35042430/220696771-43b9c7ec-85c4-4d42-a156-e02ba8b8a1f0.png)

---

__Example 1:__
```
Input: prices = [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
Total profit is 4 + 3 = 7.
```

__Example 2:__
```
Input: prices = [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
Total profit is 4.
```

__Example 3:__
```
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
```

__Constraints:__

- ```1 <= prices.length <= 3 * 10^4```
- ```0 <= prices[i] <= 10^4```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)
        n = len(prices)

        def dp(i, remaining, holding):
            # Base case
            if i == len(prices) or remaining <= 0:
                return 0
            
            if (i, holding) in memo:
                return memo[(i, holding)]

            # Recurrence relation: to make a transaction or to wait

            # To wait and skip ith day, move on to the next day
            do_nothing = dp(i + 1, remaining, holding)

            # To make a transaction, check ownership status
            if not holding:
                # Buy: move on to the next day, update ownership status, pay the price at ith day
                buy = dp(i + 1, remaining, not holding) - prices[i]
                memo[(i, holding)] = max(do_nothing, buy)
            else:
                # Sell: move on to the next day, update ownership status, take profit
                sell = dp(i + 1, remaining - 1, not holding) + prices[i]
                memo[(i, holding)] = max(do_nothing, sell)
            
            return memo[(i, holding)]
        
        return dp(0, n, False)
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Top-Down DP (Recursion)
        n = len(prices)
        @lru_cache(None)
        def dp(i, remaining, holding):
            # Base case
            if i == len(prices) or remaining <= 0:
                return 0
            
            # Recurrence relation: to make a transaction or to wait

            # To wait and skip ith day, move on to the next day
            do_nothing = dp(i + 1, remaining, holding)

            # To make a transaction, check ownership status
            if not holding:
                # Buy: move on to the next day, update ownership status, pay the price at ith day
                do_something = dp(i + 1, remaining, not holding) - prices[i]
            else:
                # Sell: move on to the next day, update ownership status, take profit
                do_something = dp(i + 1, remaining - 1, not holding) + prices[i]
            
            return max(do_nothing, do_something)
        
        return dp(0, n, False)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0

        dp = collections.defaultdict(int)
        n = len(prices)

        for i in range(n - 1, -1, -1):
            for holding in range(2):
                # Decide not to buy or sell yet, move on to the next day
                do_nothing = dp[(i + 1, holding)]
                # Decide to buy or sell, sell if holding stock or buy if not holding stock
                if not holding:
                    # Buy: move on to the next day, update ownership status, pay price at ith day
                    do_something = dp[(i + 1, not holding)] - prices[i]
                else:
                    # Sell: move on to the next day, update ownership status, take profit
                    do_something = dp[(i + 1, not holding)] + prices[i]
                # Recurrence relation
                dp[(i, holding)] = max(do_nothing, do_something)
        return dp[(0, 0)]
```

```Python
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0
            
        n = len(prices)
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
                    # Sell: move on to the next day, change ownership status, take profit
                    do_something = dp[i + 1][0] + prices[i]

                # Recurrence relation
                dp[i][holding] = max(do_nothing, do_something)
        
        return dp[0][0]
```

#### Optimized Space Bottom-Up Dynamic Programming (1D Array)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        dp = [0 for _ in range(2)]

        for day in range(n - 1, -1, -1):
            curr_day = [0 for _ in range(2)]
            for holding in range(2):
                if not holding:
                    curr_day[holding] = max(dp[0], dp[1] - prices[day])
                else:
                    curr_day[holding] = max(dp[1], dp[0] + prices[day])
            dp = curr_day

        return dp[0]
```

---

### Greedy

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        profit = 0
        for i in range(1, len(prices)):
            if prices[i] > prices[i-1]:
                profit += prices[i] - prices[i-1]
        return profit
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        profit = 0
        buy = prices[0]
        for price in prices[1:]:
            if price > buy:
                profit += price - buy
            buy = price
        return profit
```
