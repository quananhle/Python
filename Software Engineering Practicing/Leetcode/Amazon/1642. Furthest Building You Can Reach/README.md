## [1642. Furthest Building You Can Reach](https://leetcode.com/problems/furthest-building-you-can-reach)

```Tag```: ```Priority Queue```

#### Difficulty: Medium

You are given an integer array ```heights``` representing the heights of buildings, some ```bricks```, and some ```ladders```.

You start your journey from building ```0``` and move to the next building by possibly using bricks or ladders.

While moving from building ```i``` to building ```i+1``` (__0-indexed__),

- If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.
- If the current building's height is less than the next building's height, you can either use one ladder or $(h[i+1] - h[i])$ bricks.

Return _the furthest building index (__0-indexed__) you can reach if you use the given ladders and bricks optimally_.

![image](https://github.com/quananhle/Python/assets/35042430/0a184ef2-5ff5-4f53-9678-c587eb7ae955)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/27/q4.gif)
```
Input: heights = [4,2,7,6,9,14,12], bricks = 5, ladders = 1
Output: 4
Explanation: Starting at building 0, you can follow these steps:
- Go to building 1 without using ladders nor bricks since 4 >= 2.
- Go to building 2 using 5 bricks. You must use either bricks or ladders because 2 < 7.
- Go to building 3 without using ladders nor bricks since 7 >= 6.
- Go to building 4 using your only ladder. You must use either bricks or ladders because 6 < 9.
It is impossible to go beyond building 4 because you do not have any more bricks or ladders.
```

__Example 2:__
```
Input: heights = [4,12,2,7,3,18,20,3,19], bricks = 10, ladders = 2
Output: 7
```

__Example 3:__
```
Input: heights = [14,3,19,3], bricks = 17, ladders = 0
Output: 3
```

__Constraints:__

- $1 \le heights.length \le 10^5$
- $1 \le heights[i] \le 10^6$
- $0 \le bricks \le 10^9$
- $0 \le ladders \le heights.length$

---

### Min-Heap

![image](https://leetcode.com/problems/furthest-building-you-can-reach/Figures/1642/example_1_solution.png)

The best strategy is to use the ladders for the longest climbs and the bricks for the shortest climbs. This shouldn’t seem too surprising; a ladder is most valuable in the cases where we would have to use a lot of bricks.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N\log{N})$ or $\mathcal{O}(N\log{L})$
- __Space Complexity__: $\mathcal{O}(N)$ or $\mathcal{O}(L)$

```Python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        n = len(heights)
        height_differences = list()

        for i in range(1, n):
            climb = heights[i] - heights[i - 1]
            if climb <= 0:
                continue
            heapq.heappush(height_differences, climb)
            if len(height_differences) <= ladders:
                continue
            bricks -= heapq.heappop(height_differences)
            if bricks < 0:
                return i - 1

        return n - 1
```
