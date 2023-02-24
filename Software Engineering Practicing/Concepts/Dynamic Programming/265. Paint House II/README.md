## [265. Paint House II](https://leetcode.com/problems/paint-house-ii/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

There are a row of ```n``` houses, each house can be painted with one of the ```k``` colors. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by an ```n x k``` cost matrix costs.

For example, ```costs[0][0]``` is the cost of painting house ```0``` with color ```0```; ```costs[1][2]``` is the cost of painting house ```1``` with color ```2```, and so on...

Return _the minimum cost to paint all houses_.

![image](https://user-images.githubusercontent.com/35042430/221269022-9fd2b530-366a-4fde-9257-7be207b19ee8.png)

---

__Example 1:__
```
Input: costs = [[1,5,3],[2,9,4]]
Output: 5
Explanation:
Paint house 0 into color 0, paint house 1 into color 2. Minimum cost: 1 + 4 = 5; 
Or paint house 0 into color 2, paint house 1 into color 0. Minimum cost: 3 + 2 = 5.
```

__Example 2:__
```
Input: costs = [[1,3],[2,4]]
Output: 5
```

__Constraints:__

- ```costs.length == n```
- ```costs[i].length == k```
- ```1 <= n <= 100```
- ```2 <= k <= 20```
- ```1 <= costs[i][j] <= 20```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

![image](https://leetcode.com/problems/paint-house-ii/Figures/256/permutation_tree.png)

__Time Complexity__: O(n * k<sup>2</sup>))

__Space Complexity__: O(N * K)

```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        # Top-Down DP
        n, k = len(costs), len(costs[0])
        
        @lru_cache(None)
        def dp(house, paint):
            # Base case
            if not (0 <= house < n and 0 <= paint < k):
                return 0
            
            current = float('inf')
            for next in range(k):
                if next == paint:
                    continue
                current = min(current, dp(house + 1, next)) 
            return current + costs[house][paint]

        ans = float('inf')
        for paint in range(k):
            ans = min(ans, dp(0, paint))
        return ans
```

```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        n, k = len(costs), len(costs[0])
        memo = collections.defaultdict(int)

        def dp(house, paint):
            # Base case
            if not (0 <= house < n and 0 <= paint < k):
                return 0

            if (house, paint) in memo:
                return memo[(house, paint)]

            current = float('inf')
            for next in range(k):
                if next == paint:
                    continue
                current = min(current, dp(house + 1, next))
            memo[(house, paint)] = current + costs[house][paint]
            return memo[(house, paint)]

        ans = float('inf')
        for paint in range(k):
            ans = min(ans, dp(0, paint))
        return ans
```

#### Bottom-Up Dynamic Programming (Tabulation)

__Time Complexity__: O(n * k<sup>2</sup>))

__Space Complexity__: O(N * K)

```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        # Bottom-Up DP (Tabulation)
        n, k = len(costs), len(costs[0])
        dp = [[0] * (k) for _ in range(n)]
        dp[-1] = costs[-1]

        for house in range(n - 2, -1, -1):
            for paint in range(k):
                current = float('inf')
                for next in range(k):
                    if next == paint:
                        continue
                    current = min(current, dp[house + 1][next])
                dp[house][paint] = current + costs[house][paint]

        return min(dp[0])
```

__Time Complexity__: O(n * k<sup>2</sup>))

__Space Complexity__: O(1), in-place modifications

```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        n, k = len(costs), len(costs[0])

        if n == 0:
            return 0

        for house in range(1, n):
            for paint in range(k):
                best = float('inf')
                for next_paint in range(k):
                    if paint == next_paint:
                        continue
                    best = min(best, costs[house - 1][next_paint])
                costs[house][paint] += best
        return min(costs[-1])
```

#### Bottom-Up Dynamic Programming (1D Array)

__Time Complexity__: O(n * k<sup>2</sup>))

__Space Complexity__: O(k)

```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        n, k = len(costs), len(costs[0])

        if n == 0:
            return 0

        prev_house = costs[0]

        for house in range(1, n):
            curr_house = [0] * k
            for paint in range(k):
                best = float('inf')
                for next_paint in range(k):
                    if paint == next_paint:
                        continue
                    best = min(best, prev_house[next_paint])
                curr_house[paint] += best + costs[house][paint]
            prev_house = curr_house
        return min(prev_house)
```

__Follow up__: Could you solve it in ```O(nk)``` runtime?

```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        n, k = len(costs), len(costs[0])

        if n == 0:
            return 0  

        for house in range(1, n):
            cheapest_paint = second_cheapest_paint = None
            for paint in range(k):
                current_cost = costs[house - 1][paint]
                if cheapest_paint is None or current_cost < costs[house - 1][cheapest_paint]:
                    second_cheapest_paint = cheapest_paint
                    cheapest_paint = paint
                elif second_cheapest_paint is None or current_cost < costs[house - 1][second_cheapest_paint]:
                    second_cheapest_paint = paint            
            for paint in range(k):
                if paint == cheapest_paint:
                    costs[house][paint] += costs[house - 1][second_cheapest_paint]
                else:
                    costs[house][paint] += costs[house - 1][cheapest_paint]

        return min(costs[-1])
```


```Python
class Solution:
    def minCostII(self, costs: List[List[int]]) -> int:
        if not costs: 
            return 0

        n, k = len(costs), len(costs[0])

        for house in range(1, n):
            cheapest_paint = min(costs[house - 1])
            idx = costs[house - 1].index(cheapest_paint)
            second_cheapest_paint = min(costs[house - 1][:idx] + costs[house - 1][idx + 1:])

            for paint in range(k):
                if paint == idx:
                    costs[house][paint] += second_cheapest_paint
                else:
                    costs[house][paint] += cheapest_paint
        return min(costs[-1])
```
