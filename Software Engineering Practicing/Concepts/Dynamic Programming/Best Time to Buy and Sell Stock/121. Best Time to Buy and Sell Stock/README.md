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

### Brute Force

```Python
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        # Brute Force
        #### Time Complexity: O(N^2), nested loop traverse through the length of input
        #### Space Complexity: O(1)
        max_profit = 0
        for i in range(len(prices)-1):
            for j in range(i+1, len(prices)):
                if max_profit < prices[j] - prices[i]:
                    max_profit = prices[j] - prices[i]
        return max_profit
```

### Dynamic Programming

```Python
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        # Dynamic Programming
        #### Time Complexity: O(N), traverse through the length of input
        #### Space Complexity: O(1)        
        min_price = sys.maxint
        max_profit = 0
        for i in range(len(prices)):
            current_price = prices[i]
            if min_price > current_price:
                min_price = current_price
            elif max_profit < current_price - min_price:
                max_profit = current_price - min_price
        return max_profit
```

### Two Pointers

```Python
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        # Two Pointers
        #### Time Complexity: O(N), traverse through the length of input
        #### Space Complexity: O(1)
        max_profit = 0
        buy = 0
        sell = 1
        while sell < len(prices):
            if prices[buy] < prices[sell]:
                max_profit = max(max_profit, prices[sell] - prices[buy])
            else:
                buy = sell
            sell += 1
        return max_profit
```


