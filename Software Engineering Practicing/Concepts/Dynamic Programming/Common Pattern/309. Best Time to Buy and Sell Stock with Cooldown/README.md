## 309. Best Time to Buy and Sell Stock with Cooldown

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given an array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day.

Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:

- After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

![image](https://user-images.githubusercontent.com/35042430/220160328-1349b825-05b0-48de-abe7-6007a3db1207.png)

---

__Example 1:__
```
Input: prices = [1,2,3,0,2]
Output: 3
Explanation: transactions = [buy, sell, cooldown, buy, sell]
```

__Example 2:__
```
Input: prices = [1]
Output: 0
```

__Constraints:__

- ```1 <= prices.length <= 5000```
- ```0 <= prices[i] <= 1000```

---

### The Framework

State Transition by Inaction

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(i, holding, cooldown):
            # Base case
            if i == len(prices):
                return 0
            
            do_nothing = do_something = 0

            # Decide not to buy or to sell, do nothing, move on to the next day
            do_nothing = dp(i + 1, holding, cooldown)

            # Check if not holding
            if not holding:
                # Check if in the cooldown period, move on to the next day, reset cooldown
                if cooldown:
                    cooldown = not cooldown
                    do_nothing = dp(i + 1, holding, cooldown)
                # Otherwise, not in the cooldown period, move on to the next day, update ownership status, pay price at day ith
                else:
                    holding = not holding
                    do_something = dp(i + 1, holding, cooldown) - prices[i]
            # Otherwise, currently holding, sell if possible
            else:                
                cooldown = not cooldown
                holding = not holding
                do_something = dp(i + 1, False, True) + prices[i]
            
            return max(do_nothing, do_something)

        return dp(0, False, False)
```
