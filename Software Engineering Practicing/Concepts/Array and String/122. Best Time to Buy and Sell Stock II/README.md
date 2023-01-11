## 122. Best Time to Buy and Sell Stock II

```Tag```: ```Array``` ```Math```

#### Difficulty: Medium

You are given an integer array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

On each day, you may decide to buy and/or sell the stock. You can only hold __at most one__ share of the stock at any time. However, you can buy it then immediately sell it on the __same day__.

Find and return _the maximum profit you can achieve_.

![image](https://user-images.githubusercontent.com/35042430/211715840-cf8e60a4-0239-44e5-8706-4a08183d9b8e.png)

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

---

__Constraints:__
```
1 <= prices.length <= 3 * 104
0 <= prices[i] <= 104
```

---

### Peak and Valley

![image](https://leetcode.com/media/original_images/122_maxprofit_2.PNG)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Optimized One-Pass Peak Valley
        max_profit = 0
        for i in range(1, len(prices)):
            if prices[i] > prices[i - 1]:
                max_profit += prices[i] - prices[i - 1]
        return max_profit
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Optimized One-Pass Peak Valley
        max_profit = 0
        buy = prices[0]
        for sell in prices[1:]:
            if buy < sell:
                max_profit += sell - buy
            buy = sell
        return max_profit
```



        
