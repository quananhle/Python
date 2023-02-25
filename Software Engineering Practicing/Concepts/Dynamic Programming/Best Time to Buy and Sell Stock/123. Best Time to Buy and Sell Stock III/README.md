## 123. Best Time to Buy and Sell Stock III

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

You are given an array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

Find the maximum profit you can achieve. You may complete __at most two transactions__.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

![image](https://user-images.githubusercontent.com/35042430/221339310-1bfcad3c-7549-4ea0-97eb-4510ace92b0f.png)

---

__Example 1:__
```
Input: prices = [3,3,5,0,0,3,1,4]
Output: 6
Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
```

__Example 2:__
```
Input: prices = [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.
```

__Example 3:__
```
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.
```

__Constraints:__

- ```1 <= prices.length <= 10^5```
- ```0 <= prices[i] <= 10^5```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)
