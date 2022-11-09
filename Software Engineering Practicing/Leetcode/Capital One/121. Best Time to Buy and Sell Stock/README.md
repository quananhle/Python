## 121. Best Time to Buy and Sell Stock

#### Difficulty: Easy

```
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
```

#### Example 1:
```
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
```

#### Example 2:
```
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
```

#### Constraints:
```
1 <= prices.length <= 105
0 <= prices[i] <= 104
```


```{Python}
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        """
        # Brute force/Two pointers
        max_profit = 0
        for i in range(len(prices)-1):
            for j in range(i+1, len(prices)):
                if max_profit < prices[j] - prices[i]:
                    max_profit = prices[j] - prices[i]
        return max_profit
        # Time complexity: O(N^2)
        # Space complexity: O(1)
        """
        # One pass
        min_price = sys.maxint
        max_profit = 0
        for i in range(len(prices)):
            if prices[i] < min_price:
                min_price = prices[i]
            elif max_profit < prices[i] - min_price:
                max_profit = prices[i] - min_price
        return max_profit
        # Time complexity: O(N)
        # Space complexity: O(1)
        
        # Two pointer
        buy = 0
        sell = 1
        max_profit = 0
        while sell < len(prices):
            profit = prices[sell] - prices[buy]
            if prices[buy] < prices[sell]:
                max_profit = max(max_profit, profit)
            else:
                buy = sell
            sell += 1
        return max_profit
```
