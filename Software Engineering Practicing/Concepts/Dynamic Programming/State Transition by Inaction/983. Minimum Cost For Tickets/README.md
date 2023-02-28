## [983. Minimum Cost For Tickets](https://leetcode.com/problems/minimum-cost-for-tickets/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

You have planned some train traveling one year in advance. The days of the year in which you will travel are given as an integer array ```days```. Each day is an integer from ```1``` to ```365```.

Train tickets are sold in __three different__ ways:

- a __1-day__ pass is sold for ```costs[0]``` dollars,
- a __7-day__ pass is sold for ```costs[1]``` dollars, and
- a __30-day__ pass is sold for ```costs[2]``` dollars.

The passes allow that many days of consecutive travel.

- For example, if we get a __7-day__ pass on day ```2```, then we can travel for ```7``` days: ```2```, ```3```, ```4```, ```5```, ```6```, ```7```, and ```8```.

Return _the minimum number of dollars you need to travel every day in the given list of days_.

![image](https://user-images.githubusercontent.com/35042430/221784849-ce77e5eb-5db6-4620-bf02-c5fb2dd470f4.png)

---

__Example 1:__
```
Input: days = [1,4,6,7,8,20], costs = [2,7,15]
Output: 11
Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
On day 1, you bought a 1-day pass for costs[0] = $2, which covered day 1.
On day 3, you bought a 7-day pass for costs[1] = $7, which covered days 3, 4, ..., 9.
On day 20, you bought a 1-day pass for costs[0] = $2, which covered day 20.
In total, you spent $11 and covered all the days of your travel.
```

__Example 2:__
```
Input: days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
Output: 17
Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
On day 1, you bought a 30-day pass for costs[2] = $15 which covered days 1, 2, ..., 30.
On day 31, you bought a 1-day pass for costs[0] = $2 which covered day 31.
In total, you spent $17 and covered all the days of your travel.
```

__Constraints:__

- ```1 <= days.length <= 365```
- ```1 <= days[i] <= 365```
- ```days``` is in strictly increasing order.
- ```costs.length == 3```
- ```1 <= costs[i] <= 1000```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        # Top-Down DP (Recursion)
        ### Time Limit Exceeded
        
        day_set = set(days)
        day_pass = [1, 7, 30]
        
        memo = [float('inf') for _ in range(366)]       # Iterate through the entire 365 days

        def dp(day):
            # Base case
            if not (0 < day <= 365):
                return 0
            
            if day in memo:
                return memo[day]

            if day in day_set:
                for duration, cost in zip(day_pass, costs):
                    memo[day] = min(memo[day], dp(day + duration) + cost)
            else:
                memo[day] = dp(day + 1)

            return memo[day]

        return dp(1)
```

```Python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        day_set = set(days)
        day_pass = [1, 7, 30]
        memo = collections.defaultdict(int)

        def dp(day):
            # Base case
            if not (0 < day <= 365):
                return 0
            
            if day in memo:
                return memo[day]

            if day in day_set:
                memo[day] = min(dp(day + duration) + cost for duration, cost in zip(day_pass, costs))
            else:
                memo[day] = dp(day + 1)

            return memo[day]

        return dp(1)
```

```Python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        day_set = set(days)
        day_pass = [1, 7, 30]

        @lru_cache(None)
        def dp(day):
            # Base case
            if not (0 < day <= 365):
                return 0
            
            # Recurrence relation: which pass 1-day, 7-day, 30-day is the most optimal for minimum expense?
            if day in day_set:
                return min(dp(day + duration) + cost for cost, duration in zip(costs, day_pass))
        
            # If day is not in travel plan, move on to the next day
            return dp(day + 1)

        return dp(1)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python


```


