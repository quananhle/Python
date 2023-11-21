## [2391. Minimum Amount of Time to Collect Garbage](https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage)

```Tag```: ```Hash Map``` ```Prefix Sum``` ```Bitwise Manipulation```

#### Difficulty: Medium

You are given a 0-indexed array of strings garbage where ```garbage[i]``` represents the assortment of garbage at the $i^{th}$ house. ```garbage[i]``` consists only of the characters ```'M'```, ```'P'``` and ```'G'``` representing one unit of metal, paper and glass garbage respectively. Picking up one unit of any type of garbage takes ```1``` minute.

You are also given a 0-indexed integer array travel where ```travel[i]``` is the number of minutes needed to go from house ```i``` to house ```i + 1```.

There are three garbage trucks in the city, each responsible for picking up one type of garbage. Each garbage truck starts at house ```0``` and must visit each house in order; however, they do not need to visit every house.

Only one garbage truck may be used at any given moment. While one truck is driving or picking up garbage, the other two trucks cannot do anything.

Return _the minimum number of minutes needed to pick up all the garbage_.

---

__Example 1:__
```
Input: garbage = ["G","P","GP","GG"], travel = [2,4,3]
Output: 21
Explanation:
The paper garbage truck:
1. Travels from house 0 to house 1
2. Collects the paper garbage at house 1
3. Travels from house 1 to house 2
4. Collects the paper garbage at house 2
Altogether, it takes 8 minutes to pick up all the paper garbage.
The glass garbage truck:
1. Collects the glass garbage at house 0
2. Travels from house 0 to house 1
3. Travels from house 1 to house 2
4. Collects the glass garbage at house 2
5. Travels from house 2 to house 3
6. Collects the glass garbage at house 3
Altogether, it takes 13 minutes to pick up all the glass garbage.
Since there is no metal garbage, we do not need to consider the metal garbage truck.
Therefore, it takes a total of 8 + 13 = 21 minutes to collect all the garbage.
```

__Example 2:__
```
Input: garbage = ["MMM","PGM","GP"], travel = [3,10]
Output: 37
Explanation:
The metal garbage truck takes 7 minutes to pick up all the metal garbage.
The paper garbage truck takes 15 minutes to pick up all the paper garbage.
The glass garbage truck takes 15 minutes to pick up all the glass garbage.
It takes a total of 7 + 15 + 15 = 37 minutes to collect all the garbage.
```

__Constraints__:

- $2 \le garbage.length \le 10^5$
- ```garbage[i]``` consists of only the letters ```'M'```, ```'P'```, and ```'G'```.
- $1 \le garbage[i].length \le 10$
- $travel.length == garbage.length - 1$
- $1 \le travel[i] \le 100$

---

![image](https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage/Figures/2391/2391A.png)

### Hash Map + Prefix Sun

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \cdot K)$
- __Space Complexity__: $\mathcal{O}(1)$

### Two Hash Maps

```Python
class Solution:
    def garbageCollection(self, garbage: List[str], travel: List[int]) -> int:
        last_house_schedule = collections.defaultdict(int)
        pickup_schedule = collections.defaultdict(int)

        for i, house in enumerate(garbage):
            for trash in house:
                last_house_schedule[trash] = i
                pickup_schedule[trash] += 1

        n = len(garbage)
        prefix_time_sum = [0] * n
        for i in range(1, n):
            prefix_time_sum[i] = travel[i - 1] + prefix_time_sum[i - 1]
        
        ans = 0
        garbage_type = "MPG"
        for trash in garbage_type:
            ans += pickup_schedule[trash] + prefix_time_sum[last_house_schedule[trash]]

        return ans
```

### One Hash Map

```Python
class Solution:
    def garbageCollection(self, garbage: List[str], travel: List[int]) -> int:
        ans = 0
        n = len(garbage)

        for i in range(1, n - 1):
            travel[i] = travel[i - 1] + travel[i]
        
        last_house = collections.defaultdict(int)
        for i in range(n):
            for trash in garbage[i]:
                last_house[trash] = i
            ans += len(garbage[i])
        
        trash_type = "MPG"
        for trash in trash_type:
            ans += last_house[trash] if last_house[trash] == 0 else travel[last_house[trash] - 1]
        
        return ans
```

### OR

```Python
class Solution:
    def garbageCollection(self, garbage: List[str], travel: List[int]) -> int:
        glass = paper = metal = 0
        # Count total time needed to pick up all garbage, 1 minute each
        ans = sum(len(g) for g in garbage)

        # Iterate from the last house
        for i in range(len(travel), 0, -1):
            # Check which truck is needed to pick up garbage at the current house
            glass |= 'G' in garbage[i]
            paper |= 'P' in garbage[i]
            metal |= 'M' in garbage[i]
            # Count time needed to travel for the trucks to the current house
            ans += travel[i - 1] * (glass + paper + metal)

        return ans
```
