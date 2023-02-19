## 121. Best Time to Buy and Sell Stock

```Tag```: ```Greedy``` ```Dynamic Programming```

#### Difficulty: Easy

You are given an array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

You want to maximize your profit by choosing a __single day__ to buy one stock and choosing a __different day in the future__ to sell that stock.

Return the _maximum profit you can achieve from this transaction_. If you cannot achieve any profit, return ```0```.

![image](https://user-images.githubusercontent.com/35042430/205685808-073c32d4-6d55-4dde-b9ae-793367ad49a4.png)

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
