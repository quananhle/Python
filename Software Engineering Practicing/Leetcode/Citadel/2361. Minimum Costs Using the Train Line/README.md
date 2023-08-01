## [2361. Minimum Costs Using the Train Line](https://leetcode.com/problems/minimum-costs-using-the-train-line/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

A train line going through a city has two routes, the regular route and the express route. Both routes go through the same ```n + 1``` stops labeled from ```0``` to ```n```. Initially, you start on the regular route at stop ```0```.

You are given two 1-indexed integer arrays ```regular``` and ```express```, both of length ```n```. ```regular[i]``` describes the cost it takes to go from stop ```i - 1``` to stop ```i``` using the regular route, and ```express[i]``` describes the cost it takes to go from stop ```i - 1``` to stop ```i``` using the express route.

You are also given an integer ```expressCost``` which represents the cost to transfer from the regular route to the express route.

Note that:

- There is no cost to transfer from the express route back to the regular route.
- You pay ```expressCost``` every time you transfer from the regular route to the express route.
- There is no extra cost to stay on the express route.

Return _a 1-indexed array costs of length ```n```, where ```costs[i]``` is the minimum cost to reach stop ```i``` from stop ```0```_.

Note that a stop can be counted as reached from either route.

![image](https://github.com/quananhle/Python/assets/35042430/b26412c5-0cbd-41d6-b82a-238faa27d5a9)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/07/25/ex1drawio.png)
```
Input: regular = [1,6,9,5], express = [5,2,3,10], expressCost = 8
Output: [1,7,14,19]
Explanation: The diagram above shows how to reach stop 4 from stop 0 with minimum cost.
- Take the regular route from stop 0 to stop 1, costing 1.
- Take the express route from stop 1 to stop 2, costing 8 + 2 = 10.
- Take the express route from stop 2 to stop 3, costing 3.
- Take the regular route from stop 3 to stop 4, costing 5.
The total cost is 1 + 10 + 3 + 5 = 19.
Note that a different route could be taken to reach the other stops with minimum cost.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/07/25/ex2drawio.png)
```
Input: regular = [11,5,13], express = [7,10,6], expressCost = 3
Output: [10,15,24]
Explanation: The diagram above shows how to reach stop 3 from stop 0 with minimum cost.
- Take the express route from stop 0 to stop 1, costing 3 + 7 = 10.
- Take the regular route from stop 1 to stop 2, costing 5.
- Take the express route from stop 2 to stop 3, costing 3 + 6 = 9.
The total cost is 10 + 5 + 9 = 24.
Note that the expressCost is paid again to transfer back to the express route.
```

__Constraints:__

- $n == regular.length == express.length$
- $1 \le n \le 10^{5}$
- $1 \le regular[i], express[i], expressCost \le 10^{5}$

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/minimum-costs-using-the-train-line/Figures/2361/2361A.png)

__Complexity Analysis__

Here, ```N``` is the number of stops.

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def minimumCosts(self, regular: List[int], express: List[int], expressCost: int) -> List[int]:
        n = len(regular)
        memo = [[None] * (2) for _ in range(n)]

        def dp(curr, lane):
            # Base case
            if curr < 0:
                return 0

            if memo[curr][lane] is not None:
                return memo[curr][lane]
            
            # Recurrence relation: taking regular lane or express lane yields lower cost?
            regular_cost = regular[curr] + dp(curr - 1, 0)
            express_cost = express[curr] + dp(curr - 1, 1) + (expressCost if lane == 0 else 0)

            memo[curr][lane] = min(regular_cost, express_cost)
            return memo[curr][lane]
        
        dp(n - 1, 0)

        res = [None] * n
        for i in range(n):
            res[i] = memo[i][0]
        
        return res
```

```Python
class Solution:
    def minimumCosts(self, regular: List[int], express: List[int], expressCost: int) -> List[int]:
        n = len(regular)
        memo = [[None] * (2) for _ in range(n)]

        @lru_cache(maxsize=None)
        def dp(curr, lane):
            # Base case
            if curr < 0:
                return 0

            # Recurrence relation: taking regular lane or express lane yields lower cost?
            regular_cost = regular[curr] + dp(curr - 1, 0)
            express_cost = express[curr] + dp(curr - 1, 1) + (expressCost if lane == 0 else 0)

            memo[curr][lane] = min(regular_cost, express_cost)
            return memo[curr][lane]
        
        dp(n - 1, 0)

        res = [0] * n
        for i in range(n):
            res[i] += memo[i][0]
        
        return res
```

#### Bottom-Up Dynamic Programming

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def minimumCosts(self, regular: List[int], express: List[int], expressCost: int) -> List[int]:
        n = len(regular)
        res = [None] * n
        dp = [[0] * 2 for _ in range(n + 1)]
        dp[0][1] = expressCost

        for i in range(1, n + 1):
            # Regular lane: no cost if changing lane
            dp[i][0] = regular[i - 1] + min(dp[i - 1][0], dp[i - 1][1])
            # Express lane: if change lane regular => express, add expressCost
            dp[i][1] = express[i - 1] + min(dp[i - 1][0]  + expressCost, dp[i - 1][1])

            res[i - 1] = min(dp[i][0], dp[i][1]) 

        return res
```

#### Space-Optimized Dynamic Programming

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def minimumCosts(self, regular: List[int], express: List[int], expressCost: int) -> List[int]:
        prev_regular = 0
        prev_express = expressCost

        n = len(regular)
        res = [0] * n

        for i in range(1, n + 1):
            regular_cost = regular[i - 1] + min(prev_regular, prev_express)
            express_cost = express[i - 1] + min(prev_regular + expressCost, prev_express)
            res[i - 1] = min(regular_cost, express_cost)
            prev_regular = regular_cost
            prev_express = express_cost
        
        return res
```
