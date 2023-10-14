## [2742. Painting the Walls](https://leetcode.com/problems/painting-the-walls)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

You are given two 0-indexed integer arrays, ```cost``` and ```time```, of size ```n``` representing the costs and the time taken to paint ```n``` different walls respectively. There are two painters available:

- A paid painter that paints the $i^{th}$ wall in ```time[i]``` units of time and takes ```cost[i]``` units of money.
- A __free painter__ that paints any wall in ```1``` unit of time at a cost of ```0```. But the free painter can only be used if the paid painter is already __occupied__.

Return _the minimum amount of money required to paint the ```n``` walls_.

![image](https://github.com/quananhle/Python/assets/35042430/3b02b67a-b7c4-4cce-9d3d-ef2ba1521244)

---

__Example 1:__
```
Input: cost = [1,2,3,2], time = [1,2,3,2]
Output: 3
Explanation: The walls at index 0 and 1 will be painted by the paid painter, and it will take 3 units of time; meanwhile, the free painter will paint the walls at index 2 and 3, free of cost in 2 units of time. Thus, the total cost is 1 + 2 = 3.
```

__Example 2:__
```
Input: cost = [2,3,4,2], time = [1,1,1,1]
Output: 4
Explanation: The walls at index 0 and 3 will be painted by the paid painter, and it will take 2 units of time; meanwhile, the free painter will paint the walls at index 1 and 2, free of cost in 2 units of time. Thus, the total cost is 2 + 2 = 4.
```

__Constraints:__

- $1 \le cost.length \le 500$
- $cost.length == time.length$
- $1 \le cost[i] \le 10^6$
- $1 \le time[i] \le 500$

---

### The Framework


#### Top-Down Dynamic Programming

Intuitively, we want to put the paid painter on walls that cost less and take longer to paint. The longer the paid painter paints, the more we can make use of the free painter. It seems extremely difficult to formulate a greedy approach since decisions will cascade on top of each other. Which walls do we pay for? Which walls do we have the free painter paint?

Given the constraints $n \leq 500$, we should try a dynamic programming approach, which will consider all possible decisions.

![image](https://leetcode.com/problems/painting-the-walls/Figures/2742/1.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^2)$
- __Space Complexity__: $\mathcal{O}(n^2)$

```Python
class Solution:
    def paintWalls(self, cost: List[int], time: List[int]) -> int:
        n = len(cost)

        @functools.lru_cache(maxsize=None)
        def dp(curr, remaining):
            # Base case: check if there is no wall left to paint
            if remaining <= 0:
                return 0
            # No more wall to paint for the paid painter
            if curr >= n:
                return math.inf
            
            # DP Transition: hire paid painter to paint or not to paint the current wall to maximize the use of free painter?
            paint = dp(curr + 1, remaining - 1 - time[curr]) + cost[curr]
            skip = dp(curr + 1, remaining)
            return min(paint, skip)

        return dp(0, n)
```

```Python
class Solution:
    def paintWalls(self, cost: List[int], time: List[int]) -> int:
        n = len(cost)
        memo = collections.defaultdict(int)

        def dp(curr, remaining):
            # Base case: check if there is no wall left to paint
            if remaining <= 0:
                return 0
            # No more wall to paint for the paid painter
            if curr >= n:
                return math.inf
            
            if (curr, remaining) in memo:
                return memo[(curr, remaining)]

            # DP Transition: hire paid painter to paint or not to paint the current wall to maximize the use of free painter?
            paint = dp(curr + 1, remaining - 1 - time[curr]) + cost[curr]
            skip = dp(curr + 1, remaining)
            memo[(curr, remaining)] = min(paint, skip)
            return memo[(curr, remaining)]

        return dp(0, n)
```

#### Bottom-Up Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^2)$
- __Space Complexity__: $\mathcal{O}(n^2)$

```Python
class Solution:
    def paintWalls(self, cost: List[int], time: List[int]) -> int:
        dp = collections.defaultdict(int)
        n = len(cost)

        for i in range(1, n + 1):
            dp[(n, i)] = math.inf

        for curr in range(n - 1, -1, -1):
            for remaining in range(1, n + 1):
                paint = dp[(curr + 1, remaining - 1 - time[curr])] + cost[curr]
                skip = dp[(curr + 1, remaining)]
                dp[(curr, remaining)] = min(paint, skip)
            
        return dp[(0, n)]
```

#### Space-Optimized Bottom-Up Dynamic Programming

```Python
class Solution:
    def paintWalls(self, cost: List[int], time: List[int]) -> int:
        n = len(cost)
        dp = [0] * (n + 1)
        prev = [math.inf] * (n + 1)
        prev[0] = 0

        for curr in range(n - 1, -1, -1):
            dp = [0] * (n + 1)
            for remaining in range(1, n + 1):
                paint = prev[max(0, remaining - 1 - time[curr])] + cost[curr]
                skip = prev[remaining]
                dp[remaining] = min(paint, skip)
            
            prev = dp
        
        return dp[n]
```
