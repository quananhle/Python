## 1473. Paint House III

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

There is a row of ```m``` houses in a small city, each house must be painted with one of the ```n``` colors (labeled from ```1``` to ```n```), some houses that have been painted last summer should not be painted again.

A neighborhood is a maximal group of continuous houses that are painted with the same color.

- For example: ```houses = [1,2,2,3,3,2,1,1]``` contains ```5``` neighborhoods ```[{1}, {2,2}, {3,3}, {2}, {1,1}]```.

Given an array ```houses```, an ```m x n``` matrix ```cost``` and an integer ```target``` where:

- ```houses[i]```: is the color of the house ```i```, and ```0``` if the house is not painted yet.
- ```cost[i][j]```: is the cost of paint the house ```i``` with the color ```j + 1```.

Return _the minimum cost of painting all the remaining houses in such a way that there are exactly ```target``` neighborhoods_. If it is not possible, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/221300389-b2698b69-ed9a-43af-a240-f6b2d45f5dca.png)

---

__Example 1:__
```
Input: houses = [0,0,0,0,0], cost = [[1,10],[10,1],[10,1],[1,10],[5,1]], m = 5, n = 2, target = 3
Output: 9
Explanation: Paint houses of this way [1,2,2,1,1]
This array contains target = 3 neighborhoods, [{1}, {2,2}, {1,1}].
Cost of paint all houses (1 + 1 + 1 + 1 + 5) = 9.
```

__Example 2:__
```
Input: houses = [0,2,1,2,0], cost = [[1,10],[10,1],[10,1],[1,10],[5,1]], m = 5, n = 2, target = 3
Output: 11
Explanation: Some houses are already painted, Paint the houses of this way [2,2,1,2,2]
This array contains target = 3 neighborhoods, [{2,2}, {1}, {2,2}]. 
Cost of paint the first and last house (10 + 1) = 11.
```

__Example 3:__
```
Input: houses = [3,1,2,3], cost = [[1,1,1],[1,1,1],[1,1,1],[1,1,1]], m = 4, n = 3, target = 3
Output: -1
Explanation: Houses are already painted with a total of 4 neighborhoods [{3},{1},{2},{3}] different of target = 3.
```

__Constraints:__

- ```m == houses.length == cost.length```
- ```n == cost[i].length```
- ```1 <= m <= 100```
- ```1 <= n <= 20```
- ```1 <= target <= m```
- ```0 <= houses[i] <= n```
- ```1 <= cost[i][j] <= 10^4```

---

### The Framework

__1. A function or data structure that will compute/contain the answer to the problem for every given state.__

Need to keep track of three things:

- The index of the house that we are currently considering.
- The color of the previous house.
- The current number of neighborhoods.

__2. A recurrence relation to transition between states.__

![image](https://leetcode.com/problems/paint-house-iii/Figures/1473/1473A.png)

__3. Base cases, so that our recurrence relation doesn't go on infinitely.__

- If we have traversed over all the houses i.e., ```house == m```, we will return the cost 0 if the ```remaining``` is equal to ```target```, otherwise we return the value ```MAX_COST``` which is the maximum possible cost plus 1.

- If the number of neighborhoods ```remaining``` is more than the ```target``` neighborhoods ```remaining > target```, then the answer is not possible. Hence we return ```MAX_COST```.

#### Top-Down Dynamic Programming (Recursion)

1. DP state variables:

- ```house```: current house index
- ```previous```: paint of previous house
- ```neighborhood```: total neighbourhood formed till current house.

2. Recurrence relation:

- ```neighborhood_condition```: If the previous paint ```previous``` is not the same as the current paint ```current``` then it would increase the neighborhood by 1.
- If the paint of current house is 0 (i.e, already previously painted) then simply move to next house by updating the neighborhood if required:

    - ```dp(house, previous, neighborhood) = dp(house + 1, houses[house], neighborhood + neighborhood_condition)```

- Else paint the current house with the cheapest paint:

    - ```dp(house, previous, neighborhood) = min(cost[current] + dp(house + 1, current, neighborhood + neighborhood_condition))``` for all number of paints(i.e, n)

3. Base case: If all the houses have been painted(i.e, ```house == len(houses)```) then return,

- Return ```0``` if ```neighborhood == target```
- Else return ```sys.maxsize```

```Python
class Solution:
    def minCost(self, houses: List[int], cost: List[List[int]], m: int, n: int, target: int) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)
        
        def dp(house, previous, neighborhood):
            # Base case: check if all houses have been painted
            if house == len(houses):
                if neighborhood == target:
                    return 0
                else:
                    return sys.maxsize

            key = (house, previous, neighborhood)
            if not key in memo:
                # Check if the current house is not yet painted
                if houses[house] == 0:
                    best = sys.maxsize
                    for j in range(len(cost[house])):
                        current = j + 1
                        best = min(best, cost[house][j] + dp(house + 1, current, neighborhood + int(current != previous)))
                    memo[key] = best
                # Otherwise, check the next house as the current house is already painted, update neighborhood
                else:
                    memo[key] = dp(house + 1, houses[house], neighborhood + int(houses[house] != previous))
            return memo[key]

        ans = dp(0, 0, 0)
        return ans if ans != sys.maxsize else -1 
```

```Python
class Solution:
    def minCost(self, houses: List[int], cost: List[List[int]], m: int, n: int, target: int) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(house, previous, neighborhood):
            # Base case: check if all houses have been painted
            if neighborhood > target or house == m and neighborhood != target:
                return float('inf')
            if house == m:
                return 0
            
            # Check if the current house is already painted
            if houses[house] != 0:
                return dp(house + 1, houses[house], neighborhood + int(previous != houses[house]))

            # Otherwise, the current house is not yet painted
            best = float('inf')
            # Check the cost to paint the current house with color j + 1
            for j, current_cost in enumerate(cost[house], 1):
                best = min(best, dp(house + 1, j, neighborhood + int(previous != j)) + current_cost)
            return best
        
        ans = dp(0, 0, 0)
        return ans if ans != math.inf else -1
```
