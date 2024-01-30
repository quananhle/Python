## [256. Paint House](https://leetcode.com/problems/paint-house/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

There is a row of ```n``` houses, where each house can be painted one of three colors: red, blue, or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by an ```n x 3``` cost matrix ```costs```.

- For example, ```costs[0][0]``` is the cost of painting house ```0``` with the color red; ```costs[1][2]``` is the cost of painting house 1 with color green, and so on...

Return _the minimum cost to paint all houses_.

![image](https://user-images.githubusercontent.com/35042430/221101153-2836dcd7-89f1-4e78-ab7d-5b47ce8de382.png)

---

__Example 1:__
```
Input: costs = [[17,2,17],[16,16,5],[14,3,19]]
Output: 10
Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue.
Minimum cost: 2 + 5 + 3 = 10.
```

__Example 2:__
```
Input: costs = [[7,6,2]]
Output: 2
```

__Constraints:__

- $costs.length == n$
- $costs[i].length == 3$
- $1 \le n \le 100$
- $1 \le costs[i][j] \le 20$

---

4 houses

```
[[17, 2, 17], [8, 4, 10], [6, 3, 19], [4, 8, 12]]
```

![image](https://leetcode.com/problems/paint-house/Figures/256/input_grid.png)

![image](https://leetcode.com/problems/paint-house/Figures/256/brute_force.png)

### Dynamic ProgrammingR Framework

#### Top-Down Dynamic Programming (Recursion)

![image](https://leetcode.com/problems/paint-house/Figures/256/permutation_tree.png)

![image](https://leetcode.com/problems/paint-house/Figures/256/1_layer_removed.png)

![image](https://leetcode.com/problems/paint-house/Figures/256/2_layers_removed.png)

```Python
class Solution:
    def minCost(self, costs: List[List[int]]) -> int:
        n = len(costs)

        @functools.lru_cache(maxsize=None)
        def dp(house, paint):
            # Base case:
            if not 0 <= house < n:
                return 0

            # DP Transitions: get the best from the remaining possible choices after the previous decision
            cost = costs[house][(0 if paint == 'BLUE' else 1 if paint == 'GREEN' else 2)]

            if paint == 'BLUE':
                cost += min(dp(house + 1, 'GREEN'), dp(house + 1, 'RED'))
            elif paint == 'GREEN':
                cost += min(dp(house + 1, 'BLUE'), dp(house + 1, 'RED'))
            else:
                cost += min(dp(house + 1, 'BLUE'), dp(house + 1, 'GREEN'))
            
            return cost
        
        return min(dp(0, 'BLUE'), dp(0, 'GREEN'), dp(0, 'RED'))
```

```Python
class Solution:
    def minCost(self, costs: List[List[int]]) -> int:
        if not costs:
            return 0

        HOUSES, PAINTS = len(costs), len(costs[0])
        memo = [[0] * (PAINTS + 1) for _ in range(HOUSES + 1)]

        def dp(house, paint):
            # Base case
            if not (0 <= house < HOUSES and 0 <= paint < PAINTS):
                return 0

            if memo[house][paint]:
                return memo[house][paint]

            # Recurrence relation
            if paint == 0:
                memo[house][paint] = min(dp(house + 1, 1), dp(house + 1, 2)) + costs[house][paint]
            elif paint == 1:
                memo[house][paint] = min(dp(house + 1, 0), dp(house + 1, 2)) + costs[house][paint]
            else:
                memo[house][paint] = min(dp(house + 1, 0), dp(house + 1, 1)) + costs[house][paint]

            return memo[house][paint]

        return min(dp(0, 0), dp(0, 1), dp(0, 2))
```

#### Bottom-Up Dynamic Programming (Tabulation)

![image](https://leetcode.com/problems/paint-house/Figures/256/dp_func_call_grid.png)

![image](https://leetcode.com/problems/paint-house/Figures/256/dp_calc_example.png)

```Python
class Solution:
    def minCost(self, costs: List[List[int]]) -> int:
        if not costs:
            return 0

        HOUSES, PAINTS = len(costs), len(costs[0])
        for house in range(HOUSES - 2, -1, -1):
            for paint in range(PAINTS):
                if paint == 0:
                    costs[house][paint] += min(costs[house + 1][1], costs[house + 1][2])
                elif paint == 1:
                    costs[house][paint] += min(costs[house + 1][0], costs[house + 1][2])
                else:
                    costs[house][paint] += min(costs[house + 1][0], costs[house + 1][1])

        return min(costs[0])

```

#### Constant Space Bottom-Up Dynamic Programming 

```Python
class Solution:
    def minCost(self, costs: List[List[int]]) -> int:
        total_red, total_blue, total_green = costs[0]
        for red, blue, green in costs[1:]:
            total_red, total_blue, total_green = red + min(total_blue, total_green), blue + min(total_red, total_green), green + min(total_red, total_blue)
        return min(total_red, total_blue, total_green)
```

--- 

### Math

Assuming you have a list of consecutive integers in the range, you can use the following formula to get the other numbers:

For the number at index ```i``` in the list, the number before it is at index ```(i-1) % n```, where n is the length of the list. The number after it is at index ```(i+1) % n```.
Using this formula, you can find the other numbers in the range for a given current number. For example, in the range [1,2,3], if the current number is 1, the other numbers are at indices (1+1) % 3 = 2 and (1+2) % 3 = 0, which correspond to 2 and 3 respectively. If the current number is 2, the other numbers are at indices (2+1) % 3 = 0 and (2+2) % 3 = 1, which correspond to 1 and 3 respectively. And if the current number is 3, the other numbers are at indices (3+1) % 3 = 1 and (3+2) % 3 = 2, which correspond to 1 and 2 respectively.

```Python
class Solution:
    def minCost(self, costs: List[List[int]]) -> int:
        if not costs:
            return 0

        HOUSES, PAINTS = len(costs), len(costs[0])
        for house in range(HOUSES - 2, -1, -1):
            for paint in range(PAINTS):
                costs[house][paint] += min(costs[house + 1][(paint - 1) % PAINTS], costs[house + 1][(paint + 1) % PAINTS])

        return min(costs[0])
```

```Python
class Solution:
    def minCost(self, costs: List[List[int]]) -> int:
        if not costs:
            return 0
            
        HOUSES, PAINTS = len(costs), len(costs[0])
        
        dp = [[0] * (PAINTS) for _ in range(HOUSES)]
        dp[0] = costs[0]

        for house in range(1, HOUSES):
            for paint in range(PAINTS):
                dp[house][paint] = costs[house][paint] + min(dp[house - 1][(paint - 1) % PAINTS], dp[house - 1][(paint + 1) % PAINTS])
                
        return min(dp[-1])
```
