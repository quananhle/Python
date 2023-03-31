## [2291. Maximum Profit From Trading Stocks](https://leetcode.com/problems/maximum-profit-from-trading-stocks/)

```Tag```: ```Dynamic Programming``` ```Knapsack```

#### Difficulty: Medium

You are given two __0-indexed__ integer arrays of the same length ```present``` and ```future``` where ```present[i]``` is the current price of the i<sup>th</sup> stock and ```future[i]``` is the price of the i<sup>th</sup> stock a year in the future. You may buy each stock at most once. You are also given an integer ```budget``` representing the amount of money you currently have.

Return _the maximum amount of profit you can make_.

---

__Example 1:__
```
Input: present = [5,4,6,2,3], future = [8,5,4,3,5], budget = 10
Output: 6
Explanation: One possible way to maximize your profit is to:
Buy the 0th, 3rd, and 4th stocks for a total of 5 + 2 + 3 = 10.
Next year, sell all three stocks for a total of 8 + 3 + 5 = 16.
The profit you made is 16 - 10 = 6.
It can be shown that the maximum profit you can make is 6.
```

__Example 2:__
```
Input: present = [2,2,5], future = [3,4,10], budget = 6
Output: 5
Explanation: The only possible way to maximize your profit is to:
Buy the 2nd stock, and make a profit of 10 - 5 = 5.
It can be shown that the maximum profit you can make is 5.
```

__Example 3:__
```
Input: present = [3,3,12], future = [0,3,15], budget = 10
Output: 0
Explanation: One possible way to maximize your profit is to:
Buy the 1st stock, and make a profit of 3 - 3 = 0.
It can be shown that the maximum profit you can make is 0.
```

__Constraints:__

- ```n == present.length == future.length```
- ```1 <= n <= 1000```
- ```0 <= present[i], future[i] <= 100```
- ```0 <= budget <= 1000```

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def maximumProfit(self, present: List[int], future: List[int], budget: int) -> int:
        # Precompute the profits to reduce the loss transaction noises; otherwise, it can be time limit exceeded
        prices = [[cost, sell] for cost, sell in zip(present, future) if sell - cost > 0]
        n = len(prices)
        memo = collections.defaultdict()

        def dp(stock, remaining):
            # Base cases
            if stock == n or remaining < 0:
                return 0
            
            if (stock, remaining) in memo:
                return memo[(stock, remaining)]
        
            # Recurrence relation
            skip = dp(stock + 1, remaining)
            
            cost, sell = prices[stock][0], prices[stock][1]
            make = dp(stock + 1, remaining - cost) + sell - cost if cost <= remaining else 0

            memo[(stock, remaining)] = max_profit = max(skip, make)
            return max_profit

        # Start from day 0 with budget
        return dp(0, budget)
```

```Python
class Solution:
    def maximumProfit(self, present: List[int], future: List[int], budget: int) -> int:
        # Precompute the profits to reduce the loss transaction noises; otherwise, it can be time limit exceeded
        prices = [[cost, sell] for cost, sell in zip(present, future) if sell - cost > 0]
        n = len(prices)

        @lru_cache(None)
        def dp(stock, remaining):
            # Base cases
            if stock == n or remaining < 0:
                return 0
        
            # Recurrence relation: skip the stock or make the transaction?
            # Skip: move on to the next stock, maintain the current budget
            # Make: after taking profit, update the budget less the cost and move on to the next stock
            skip = dp(stock + 1, remaining)
            
            cost, sell = prices[stock][0], prices[stock][1]
            make = dp(stock + 1, remaining - cost) + sell - cost if cost <= remaining else 0

            # Get the maximum profit can possibly make
            max_profit = max(skip, make)
            return max_profit

        # Start from the first stock with budget
        return dp(0, budget)
```

```Python
class Solution:
    def maximumProfit(self, present: List[int], future: List[int], budget: int) -> int:
        profits = [[present[i], future[i] - present[i]] for i in range(len(present)) if present[i] <= budget and future[i] - present[i] > 0]
        profits.sort(key=lambda x:x[0])
        n = len(profits)

        @lru_cache(maxsize = None)
        def dp(stock, remaining):
            # Base cases
            if stock == n or remaining < profits[stock][0]:
                return 0

            cost, profit = profits[stock][0], profits[stock][1]

            skip = dp(stock + 1, remaining)
            make = dp(stock + 1, remaining - cost) + profit
            return max(skip, make)
        
        return dp(0, budget)
```

#### Bottom-Up Dynamic Programming

```Python

```

```Python

```
