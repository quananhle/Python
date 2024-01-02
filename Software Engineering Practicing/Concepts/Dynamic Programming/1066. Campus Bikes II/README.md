## [1066. Campus Bikes II](https://leetcode.com/problems/campus-bikes-ii)

```Tag```: ```Dynamic Programming``` ```Matrix``` ```Greedy Algorithm``` ```Backtracking``` ```Priority Queue``` ```Dijkstra's Algorithm``` ```Bitwise Manipulation```

#### Difficulty: Medium

On a campus represented as a 2D grid, there are ```n``` workers and ```m``` bikes, with ```n <= m```. Each worker and bike is a 2D coordinate on this grid.

We assign one unique bike to each worker so that the sum of the Manhattan distances between each worker and their assigned bike is minimized.

Return _```the minimum possible sum of Manhattan distances between each worker and their assigned bike```_.

The Manhattan distance between two points ```p1``` and ```p2``` is ```Manhattan(p1, p2) = |p1.x - p2.x| + |p1.y - p2.y|```.

![image](https://github.com/quananhle/Python/assets/35042430/c4372e86-55ae-45a5-b551-4a85109612e1)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/03/06/1261_example_1_v2.png)
```
Input: workers = [[0,0],[2,1]], bikes = [[1,2],[3,3]]
Output: 6
Explanation: 
We assign bike 0 to worker 0, bike 1 to worker 1. The Manhattan distance of both assignments is 3, so the output is 6.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/03/06/1261_example_2_v2.png)
```
Input: workers = [[0,0],[1,1],[2,0]], bikes = [[1,0],[2,2],[2,1]]
Output: 4
Explanation: 
We first assign bike 0 to worker 0, then assign bike 1 to worker 1 or worker 2, bike 2 to worker 2 or worker 1. Both assignments lead to sum of the Manhattan distances as 4.
```

__Example 3:__
```
Input: workers = [[0,0],[1,0],[2,0],[3,0],[4,0]], bikes = [[0,999],[1,999],[2,999],[3,999],[4,999]]
Output: 4995
```

__Constraints:__

- $n == workers.length$
- $m == bikes.length$
- $1 \le n \le m \le 10$
- $workers[i].length == 2$
- $bikes[i].length == 2$
- $0 \le workers[i][0], workers[i][1], bikes[i][0], bikes[i][1] \lt 1000$
- All the ```workers``` and the ```bikes``` locations are unique.

---

### Greedy + Backtracking (Time Limit Exceeded)

![image](https://github.com/quananhle/Python/assets/35042430/57e8ef2b-d9ed-44e9-8ea3-5c796d052915)

#### Algorithm

1. For every worker starting from the ```worker``` at index ```0```, traverse over the ```bikes``` and assign the bike to the worker if it is available (```visited[bikeIndex] = False```). After assigning the bike mark it as unavailable (```visited[bikeIndex] = True```).
2. Add the Manhattan distance of the above assignment to the total distance incurred so far represented by ```currDistanceSum``` and enter the recursive call for the next worker.
3. When the recursive call is finished, make the bike as available again by setting ```visited[bikeIndex]``` to ```False```.
4. If we have assigned bikes to all the workers, compare the ```currDistanceSum``` with the ```smallestDistanceSum``` and update the ```smallestDistanceSum``` accordingly.
5. Before assigning any bike to the worker, check if the ```currDistanceSum``` is already greater than or equal to ```smallestDistanceSum```. If so, then skip the rest of the ```workers``` and return. This is because ```currDistanceSum``` can only increase, and thus we will not find a better result than ```smallestDistanceSum``` using the current combination of workers and bikes.

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(\frac{M!}{(M - N)!})$
- __Space Complexity__: $\mathcal{O}(N + M)$

```Python
class Solution:
    def assignBikes(self, workers: List[List[int]], bikes: List[List[int]]) -> int:
        ans = math.inf
        m, n = len(workers), len(bikes)
        visited = [False] * n

        def manhattance_distance(worker, bike):
            return abs(worker[0] - bike[0]) + abs(worker[1] - bike[1])

        def backtrack(wkr_idx, curr_distance):
            nonlocal ans
            # Base cases
            if wkr_idx >= m:
                ans = min(ans, curr_distance)
                return
            if curr_distance >= ans:
                return
            
            for bike_idx in range(n):
                if not visited[bike_idx]:
                    visited[bike_idx] = True
                    backtrack(wkr_idx + 1, curr_distance + manhattance_distance(workers[wkr_idx], bikes[bike_idx]))
                    # Backtracking
                    visited[bike_idx] = False
            
        backtrack(0, 0)
        return ans
```

---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming + Bitmasking

__Algorithm__

1. For every worker starting from the worker at index ```0```, traverse over the bits of ```mask``` and assign it to the worker if it is available (bit at ```bikeIndex``` in mask is ```0```). After assigning the bike mark it is unavailable (change the bit at ```bikeIndex``` in mask to ```1```).
2. Add the Manhattan distance of the above assignment and add it to the distance that will be returned by the recursive function ```dp``` for the next worker ```workerIndex```.
3. If we have assigned ```bikes``` to all the ```workers``` (```workerIndex >= workers.size()```) then we can return the distance as ```0```.
4. Use memoization to store the result corresponding to ```mask```, because there will be repeated subproblems as shown below. This will help us to avoid recalculating subproblems.

![image](https://leetcode.com/problems/campus-bikes-ii/Figures/1066/1066A.png)

__Complexity Analysis__

- __Time Complexity__: \mathcal{O}(M \cdot 2^M)$
- __Space Complexity__: \mathcal{O}(2^M)$

```Python
class Solution:
    def assignBikes(self, workers: List[List[int]], bikes: List[List[int]]) -> int:
        ans = math.inf
        m, n = len(workers), len(bikes)

        def manhattance_distance(worker, bike):
            return abs(worker[0] - bike[0]) + abs(worker[1] - bike[1])

        @functools.lru_cache(maxsize=None)
        def dp(curr, mask):
            # Base case
            if curr >= m:
                return 0

            ans = math.inf
            for i in range(n):
                if mask & (1 << i) == 0:
                    ans = min(ans, manhattance_distance(workers[curr], bikes[i]) + dp(curr + 1 , mask | (1 << i)))

            return ans
    
        return dp(0, 0)
```

#### 
