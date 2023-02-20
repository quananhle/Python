## 188. Best Time to Buy and Sell Stock IV

```Tag```: ```Dynamic Programming```

You are given an integer array prices where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day, and an integer ```k```.

Find the maximum profit you can achieve. You may complete at most ```k``` transactions.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

![image](https://user-images.githubusercontent.com/35042430/219917470-a9051d35-6bc8-4dbc-9d94-bd5ad28fafe5.png)

---

__Example 1:__
```
Input: k = 2, prices = [2,4,1]
Output: 2
Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.
```

__Example 2:__
```
Input: k = 2, prices = [3,2,6,5,0,3]
Output: 7
Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
```

__Constraints:__

- ```1 <= k <= 100```
- ```1 <= prices.length <= 1000```
- ```0 <= prices[i] <= 1000```

---

### The Framework

1. A __function__ that answers the problem for a given state

![image](https://user-images.githubusercontent.com/35042430/219968377-58e4aa7a-16e0-40d3-a551-958c2913f9cb.png)

2. A recurrence relation to transition between states

![image](https://user-images.githubusercontent.com/35042430/219968551-f000a269-0eba-4ad6-911b-30867344baa7.png)
![image](https://user-images.githubusercontent.com/35042430/219968613-97d347a3-42ec-4896-99c7-960575fc4c5c.png)

3. Base cases

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def maxProfit(self, k: int, prices: List[int]) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(curr, have, remaining):
            # Base cases
            if curr == len(prices) or remaining <= 0:
                return 0

            # Recurrence relation: to make transaction or not to make transaction
            
            # If not making the transaction, move on to the next day
            do_nothing = dp(curr + 1, have, remaining)

            # If making the transaction, decrement k transaction limit by 1 
            
            # Must buy before selling
            if not have:
                # Buy: move on to the next day, update ownership status, pay price
                have = not have
                do_something = dp(curr + 1, have, remaining) - prices[curr]
            else:
                # Sell: move on to the next day, update ownership status, complete transaction hence decrement k, take profit
                have = not have
                do_something = dp(curr + 1, have, remaining - 1) + prices[curr]
            
            return max(do_nothing, do_something)

        return dp(0, False, k)
```
