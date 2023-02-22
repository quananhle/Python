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
                    do_nothing = dp(i + 1, holding, not cooldown)
                # Otherwise, not in the cooldown period, move on to the next day, update ownership status, pay price at day ith
                else:
                    do_something = dp(i + 1, not holding, cooldown) - prices[i]
            # Otherwise, currently holding, sell
            else:                
                # Move on to the next day, update ownership status, update cooldown, take profit
                do_something = dp(i + 1, not holding, not cooldown) + prices[i]
            
            return max(do_nothing, do_something)

        return dp(0, False, False)
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        memo = collections.defaultdict() # key = (i, buying), val = max_profit

        def dp(i, holding):
            if i >= len(prices):
                return 0

            # Check if transaction precomputed
            if (i, holding) in memo:
                return memo[(i, holding)]

            # Decide not to buy or sell yet, move on to the next day
            do_nothing = dp(i + 1, holding)
            
            # Check if not holding any stock
            if not holding:
                # Decide to buy, move on to the next day, update ownership status, pay the price at day ith
                buy = dp(i + 1, not holding) - prices[i]
                # Get the maximum profit out of this path of decisions
                memo[(i, holding)] = max(buy, do_nothing)
            else:
                # Decide to sell, move on to the day after the cooldown period ends, reset ownership status, take the profit
                sell = dp(i + 2, not holding) + prices[i]
                # Get the maximum profit out of this path of decisions
                memo[(i, holding)] = max(sell, do_nothing)

            return memo[(i, holding)]

        return dp(0, False)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        dp = [[[0] * 2 for _ in range(2)] for _ in range(n + 1)]

        for i in range(n - 1, -1, -1):
            for holding in range(2):            
                for cooldown in range(2):
                    # Decide not to buy or sell yet, move on to the next day
                    do_nothing = dp[i + 1][holding][cooldown]
                    do_something = 0

                    # Decide to buy or sell, sell if holding stock or buy if not holding stock
                    if not holding:
                        # Check if is in the cooldown period
                        if cooldown:
                            # Move on the next day, reset cooldown status
                            do_nothing = dp[i + 1][0][0]
                        else:
                            # Buy: move on to the next day, update ownership status, pay price at ith day
                            do_something = dp[i + 1][1][0] - prices[i]
                    else:
                        # Sell: move on to the day after cooldown period ends, change ownership status, update cooldown, take profit
                        do_something = dp[i + 1][0][1] + prices[i]

                    # Recurrence relation
                    dp[i][holding][cooldown] = max(do_nothing, do_something)
        
        return dp[0][0][0]
```

```Python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        dp = [[0] * 2 for _ in range(n + 2)]

        for i in range(n - 1, -1, -1):
            for holding in range(2):
                # Decide not to buy or sell yet, move on to the next day
                do_nothing = dp[i + 1][holding]

                # Decide to buy or sell, check if holding stock
                if not holding:
                    # Buy: move on to the next day, change ownership status, pay price at ith day
                    do_something = dp[i + 1][1] - prices[i]
                else:
                    # Sell: move on to the day after cooldown period ends, change ownership status, take profit
                    do_something = dp[i + 2][0] + prices[i]

                # Recurrence relation
                dp[i][holding] = max(do_nothing, do_something)
        
        return dp[0][0]
```

---

### Bottom-Up Dynamic Programming with State Machine

Let us define a state machine to model our agent. The state machine consists of three states, which we define as follows:

- state ```held```: in this state, the agent holds a stock that it bought at some point before.

- state ```sold```: in this state, the agent has just sold a stock right before entering this state. And the agent holds no stock at hand.

- state ```reset```: first of all, one can consider this state as the starting point, where the agent holds no stock and did not sell a stock before. More importantly, it is also the transient state before the ```held``` and ```sold```. Due to the cooldown rule, after the ```sold``` state, the agent can not immediately acquire any stock, but is forced into the ```reset``` state. One can consider this state as a "reset" button for the cycles of buy and sell transactions.

At any moment, the agent can only be in one state. The agent would transition to another state by performing some actions, namely:

- action ```sell```: the agent sells a stock at the current moment. After this action, the agent would transition to the ```sold``` state.

- action ```buy```: the agent acquires a stock at the current moment. After this action, the agent would transition to the ```held``` state.

- action ```rest```: this is the action that the agent does no transaction, neither buy or sell. For instance, while holding a stock at the ```held``` state, the agent might simply do nothing, and at the next moment the agent would remain in the ```held``` state.

![image](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/solutions/601810/Figures/309/309_state_machine.png)

Notice that, in all states except the sold state, by doing nothing, we would remain in the same state, which is why there is a self-looped transition on these states.

![image](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/solutions/601810/Figures/309/309_graph.png)

__Time Complexity__: ```O(N^2)```, recurse call while iterating through the input array

__Space Complexity__: ```O(1)```, constant memory space for pointers

```Python
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        sold, held, reset = float('-inf'), float('-inf'), 0

        for price in prices:
            '''
            # Alternative: the calculation is done in parallel. Therefore no need to keep temporary variables

            sold, held, reset = held + price, max(held, reset-price), max(reset, sold)
            '''
            pre_sold = sold
            sold = held + price
            held = max(held, reset - price)
            reset = max(reset, pre_sold)

        return max(sold, reset)
```
