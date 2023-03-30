## [Best Time to Buy and Sell Stock](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/Best%20Time%20to%20Buy%20and%20Sell%20Stock)

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
            # Make: move on to the next day, update the holding status, decrement the number of transaction once complete

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
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        memo = collections.defaultdict()
        n = len(prices)

        def dp(day, holding):
            if day == n:
                return 0

            if (day, holding) in memo:
                return memo[(day, holding)]

            # Recurrence relation: skip the current day or make the transaction? Do nothing or do something?
            # Skip: move on to the next day, maintain the holding status
            # Make: move on to the next day, update the holding status

            skip = dp(day + 1, holding)

            # Check the holding status
            if not holding:
                # Buy if not holding, pay the cost
                make = dp(day + 1, not holding) - prices[day]
            else:
                # Sell if holding, take the profit
                make = dp(day + 1, not holding) + prices[day]
            
            # Get the maximum profit from the decisions
            memo[(day, holding)] = max_profit = max(skip, make)
            return max_profit
                
        # Start from day 0, not holding any stock at the beginning, number of transactions not limited
        return dp(0, False)
```

### [Best Time to Buy and Sell Stock III](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/Best%20Time%20to%20Buy%20and%20Sell%20Stock/123.%20Best%20Time%20to%20Buy%20and%20Sell%20Stock%20III)

```
Example 1:

Input: prices = [3,3,5,0,0,3,1,4]
Output: 6
Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
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
            # Make: move on to the next day, update the holding status, decrement the number of transaction once complete

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
                
        # Start from day 0, not holding any stock at the beginning, can do at most 2 transactions
        return dp(0, False, 2)
```

### [Best Time to Buy and Sell Stock IV](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/Best%20Time%20to%20Buy%20and%20Sell%20Stock/188.%20Best%20Time%20to%20Buy%20and%20Sell%20Stock%20IV)

```Python
class Solution:
    def maxProfit(self, k: int, prices: List[int]) -> int:
        memo = collections.defaultdict()
        n = len(prices)

        def dp(day, holding, transaction):
            if day == n or transaction == 0:
                return 0

            if (day, holding, transaction) in memo:
                return memo[(day, holding, transaction)]

            # Recurrence relation: skip the current day or make the transaction? Do nothing or do something?
            # Skip: move on to the next day, maintain the holding status, maintain the number of transaction
            # Make: move on to the next day, update the holding status, decrement the number of transaction once complete

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
                
        # Start from day 0, not holding any stock at the beginning, can do at most k transactions
        return dp(0, False, k)
```

### Best Time to Buy and Sell Stock with Cooldown

### Best Time to Buy and Sell Stock with Transaction Fee

