## 256. Paint House

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

- ```costs.length == n```
- ```costs[i].length == 3```
- ```1 <= n <= 100```
- ```1 <= costs[i][j] <= 20```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
        if not costs:
            return 0

        HOUSES, PAINTS = len(costs), len(costs[0])
        @lru_cache(None)
        def dp(house, paint):
            # Base case
            if not (0 <= house < HOUSES and 0 <= paint < PAINTS):
                return 0

            cost = costs[house][paint]

            # Recurrence relation
            if paint == 0:
                cost += min(dp(house + 1, 1), dp(house + 1, 2))
            elif paint == 1:
                cost += min(dp(house + 1, 0), dp(house + 1, 2))
            else:
                cost += min(dp(house + 1, 0), dp(house + 1, 1))
        
            return cost

        ans = float('inf')
        for paint in range(PAINTS):
            ans = min(ans, dp(0, paint))
        return ans
```
