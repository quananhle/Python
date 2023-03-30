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

