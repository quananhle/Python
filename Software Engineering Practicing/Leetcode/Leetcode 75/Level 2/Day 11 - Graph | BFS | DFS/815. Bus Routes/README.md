## [815. Bus Routes](https://leetcode.com/problems/bus-routes/)

```Tag```: ```Graph``` ```Breadth-First Search```

#### Difficulty: Hard

You are given an array ```routes``` representing bus routes where ```routes[i]``` is a bus route that the i<sup>th</sup> bus repeats forever.

- For example, if ```routes[0] = [1, 5, 7]```, this means that the 0<sup>th</sup> bus travels in the sequence ```1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ...``` forever.

You will start at the bus stop ```source``` (You are not on any bus initially), and you want to go to the bus stop ```target```. You can travel between bus stops by buses only.

Return _the least number of buses you must take to travel from ```source``` to ```target```_. Return ```-1``` if it is not possible.

![image](https://user-images.githubusercontent.com/35042430/224812449-8c6fb8db-aa47-48c5-869e-eef4f10cced7.png)

---

__Example 1:__
```
Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
Output: 2
Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.
```

__Example 2:__
```
Input: routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
Output: -1
```

__Constraints:__

- $1 \le routes.length \le 500$.
- $1 \le routes[i].length \le 10^5$
- All the values of ```routes[i]``` are unique.
- $sum(routes[i].length) \le 10^5$
- $0 \le routes[i][j] \lt 10^6$
- $0 \le source, target \lt 10^6$

---

### Breadth-First Search

Instead of thinking of the stops as nodes (of a graph), think of the buses as nodes. We want to take the least number of buses, which is a __shortest path problem__, conducive to using a breadth-first search.

```Python
class Solution:
    def numBusesToDestination(self, routes: List[List[int]], source: int, target: int) -> int:
        # In BFS, we need to traverse all positions in each level firstly, and then go to the next level.
        # Our task is to figure out:
        # 1. What is the level in this problem?
        # 2. What is the position we want in this problem?
        # 3. How to traverse all positions in a level?
        # 
        # For this problem:
        # 1. The level is each time to take bus.
        # 2. The position is all of the stops you can reach for taking one time of bus.
        # 3. Using a queue to record all of the stops can be arrived for each time you take buses.

        # Breadth-First Search
        if source == target:
            return 0
        
        graph = collections.defaultdict(set)
        for bus, stops in enumerate(routes):
            for stop in stops:
                graph[stop].add(bus)

        queue = collections.deque([source])
        taken = set()
        ans = 0

        while queue:
            ans += 1
            for _ in range(len(queue)):
                curr_stop = queue.popleft()
                for bus in graph[curr_stop]:
                    if bus in taken:
                        continue
                    taken.add(bus)
                    for stop in routes[bus]:
                        if stop == target:
                            return ans
                        queue.append(stop)
        
        return -1
```


```Python
class Solution:
    def numBusesToDestination(self, routes: List[List[int]], source: int, target: int) -> int:
        graph = collections.defaultdict(set)
        for bus, route in enumerate(routes):
            for stop in route:
                graph[stop].add(bus)

        # Start from the source with 0 ticket to buy. 
        queue = collections.deque([(source, 0)])
        visited = set([source])

        while queue:
            stop, ticket = queue.popleft()
            # Check if reached the target
            if stop == target:         
                # Number of tickets to buy is the number of buses to take to reach target from source        
                return ticket
            # Check every bus that goes to the current stop
            for bus in graph[stop]:
                # Check every stop in the route of the current bus 
                for next_stop in routes[bus]:
                    # Avoid revisiting the same stop
                    if next_stop in visited:
                        continue
                    # Check the next stop and buy 1 bus ticket
                    queue.append((next_stop, ticket + 1))
                    visited.add(next_stop)
                # Clear the route of the taken bus
                routes[bus] = []
        return -1
```

