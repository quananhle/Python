## Best Time to Buy and Sell Stock

```Tag```: ```Dynamic Programming``` ```Greedy```

### Best Time to Buy and Sell Stock I

```
Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_profit = 0
        buy_price = prices[0]

        for price in prices[1:]:
            buy_price = min(buy_price, price)
            max_profit = max(max_profit, price - buy_price)
        
        return max_profit
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        memo = collections.defaultdict()
        n = len(prices)

        def dp(day, holding, transaction):
            if day == n or transaction == 0:
                return 0

            if (day, holding, transaction) in memo:
                return memo[(day, holding, transaction)]

            # Recurrence relation: skip the current day or make the transaction? Do nothing or do something?
            # Skip: move on to the next day, maintain the holding status, maintain the number of transaction
            # Make: move on to the next day, update the holding status, decrement the number of transaction once complete buying and selling

            skip = dp(day + 1, holding, transaction)

            # Check the holding status
            if not holding:
                # Buy if not holding, pay the cost
                make = dp(day + 1, not holding, transaction) - prices[day]
            else:
                # Sell if holding, take the profit
                make = dp(day + 1, not holding, transaction - 1) + prices[day]
            
            # Get the maximum profit from the decisions
            memo[(day, holding, transaction)] = max_profit = max(skip, make)
            return max_profit
                
        # Start from day 0, not holding any stock at the beginning, can do at most 1 transaction
        return dp(0, False, 1)
```

### Best Time to Buy and Sell Stock II

```
Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
Total profit is 4 + 3 = 7.
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_profit = 0
        buy_price = prices[0]

        for price in prices[1:]:
            if buy_price < price:
                max_profit += price - buy_price
            buy_price = price

        return max_profit
```


```Python

```

### Best Time to Buy and Sell Stock III

```Python

```

### Best Time to Buy and Sell Stock IV

```Python

```

### Best Time to Buy and Sell Stock I

### Best Time to Buy and Sell Stock I

