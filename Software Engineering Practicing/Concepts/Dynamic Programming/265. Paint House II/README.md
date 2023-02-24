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

__Follow up__: Could you solve it in ```O(nk)``` runtime?
