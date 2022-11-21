## 122. Best Time to Buy and Sell Stock II

#### Difficulty: Medium

You are given an integer array prices where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

On each day, you may decide to buy and/or sell the stock. You can only hold __at most one__ share of the stock at any time.

Find and return the __maximum profit__ you can achieve.

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
```
1 <= prices.length <= 3 * 104
0 <= prices[i] <= 104
```

### Peak Valley

![image](https://leetcode.com/media/original_images/122_maxprofit_1.PNG)

If we analyze the graph, we notice that the points of interest are the consecutive valleys and peaks.

Mathematically speaking: Total Profit = ∑((peak)-(valley))

The key point is we need to consider every peak immediately following a valley to maximize the profit. In case we skip one of the peaks (trying to obtain more profit), we will end up losing the profit over one of the transactions leading to an overall lesser profit.

```{Python}
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        # Dynamic Programming
        # Time complexity: O(N), single pass
        # Space complexity: O(1), only constant space required, no extra space needed
        """
        maximum_profit = 0
        i = 0
        buy_price = sell_price = prices[0]
        while i < len(prices)-1:
            while (i < len(prices)-1 and prices[i] >= prices[i+1]):
                i += 1
            buy_price = prices[i]
            while (i < len(prices)-1 and prices[i] <= prices[i+1]):
                i += 1
            sell_price = prices[i]
            maximum_profit += sell_price - buy_price
        return maximum_profit
        """
```
