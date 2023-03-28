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

Recurrence relation:

![image](https://user-images.githubusercontent.com/35042430/228112704-834403ef-5596-4d1e-9d2b-549998e7ca81.png)

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        passes = {1: costs[0], 7: costs[1], 30: costs[2]}
        day_set = set(days)

        @lru_cache(None)
        def dp(curr):
            # Base case
            if not 0 < curr < 366:
                return 0

            # Recurrence relation: which pass is the most optimal? 1-day, 7-day, 30-day?
            # Check if need to buy pass for current day
            if curr in day_set:
                return min([dp(curr + duration) + cost for duration, cost in passes.items()])
            # Otherwise, current day already covered, move to next day
            return dp(curr + 1)

        return dp(1)
```

```Python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        passes = {1: costs[0], 7: costs[1], 30: costs[2]}
        day_set = set(days)
        memo = collections.defaultdict(int)

        def dp(curr):
            # Base case
            if not 0 < curr < 366 or curr in memo:
                return memo[curr]
 
            # Recurrence relation: to buy or not to buy a pass

            # Check if the current day is covered with current pass, move on to the next day
            if not curr in day_set:
                memo[curr] = dp(curr + 1)
                return memo[curr]

            # Otherwise, if needed to buy a pass for current day, which pass is the most optimal? 1-day, 7-day, 30-day?
            memo[curr] = min([dp(curr + duration) + cost for duration, cost in passes.items()])
            return memo[curr]

        return dp(1)
```

```Python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        day_set = set(days)
        memo = collections.defaultdict(int)

        def dp(day):
            # Base case
            if not (0 < day < 366) or day in memo:
                return memo[day]

            if day in day_set:
                memo[day] = min(dp(day + 1) + costs[0], dp(day + 7) + costs[1], dp(day + 30) + costs[2])
            else:
                memo[day] = dp(day + 1)

            return memo[day]

        return dp(1)
```

#### Optimized Time Top-Down Dynamic Programming (Recursion)


#### Bottom-Up Dynamic Programming (Tabulation)

