## 787. Cheapest Flights Within K Stops

```Tag```: ```Dynamic Programming``` ```Depth-First Search``` ```Breadth-First Search``` ```Graph``` ```Heap (Priority Queue)``` ```Shortest Path```

#### Difficulty: Medium

There are ```n``` cities connected by some number of flights. You are given an array ```flights``` where ```flights[i]``` = [from<sub>i</sub>, to<sub>i</sub>, price<sub>i</sub>] indicates that there is a flight from city ```from```<sub>i</sub> to city ```to```<sub>i</sub> with cost ```price```<sub>i</sub>.

You are also given three integers ```src```, ```dst```, and ```k```, return _the __cheapest price__ from ```src``` to ```dst``` with __at most__ ```k``` stops_. If there is no such route, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/214763952-16f232e6-8511-4547-8842-8b12e3f17424.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/03/18/cheapest-flights-within-k-stops-3drawio.png)
```
Input: n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1
Output: 700
Explanation:
The graph is shown above.
The optimal path with at most 1 stop from city 0 to 3 is marked in red and has cost 100 + 600 = 700.
Note that the path through cities [0,1,2,3] is cheaper but is invalid because it uses 2 stops.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/03/18/cheapest-flights-within-k-stops-1drawio.png)
```
Input: n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1
Output: 200
Explanation:
The graph is shown above.
The optimal path with at most 1 stop from city 0 to 2 is marked in red and has cost 100 + 100 = 200.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2022/03/18/cheapest-flights-within-k-stops-2drawio.png)
```
Input: n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 0
Output: 500
Explanation:
The graph is shown above.
The optimal path with no stops from city 0 to 2 is marked in red and has cost 500.
```

__Constraints:__

- ```1 <= n <= 100```
- ```0 <= flights.length <= (n * (n - 1) / 2)```
- ```flights[i].length == 3```
- 0 <= from<sub>i</sub>, to<sub>i</sub> < n
- from<sub>i</sub> != to<sub>i</sub>
- 1 <= price<sub>i</sub> <= 10<sup>4</sup>
- There will not be any multiple flights between two cities.
- ```0 <= src, dst, k < n```
- ```src != dst```

---

### Breadth-First Search

```Python
class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        graph = collections.defaultdict(list)
        distance = [-1 for _ in range(n)]
        for fr, to, pr in flights:
            graph[fr].append([to, pr])

        distance[src] = 0
        queue = collections.deque([src])
        print (queue)
        stop = 0

        while queue and stop <= k:
            new_distance = list(distance)
            for _ in range(len(queue)):
                curr = queue.popleft()
                for neighbor in graph[curr]:
                    if new_distance[neighbor[0]] == -1 or new_distance[neighbor[0]] > distance[curr] + neighbor[1]:
                        new_distance[neighbor[0]] = distance[curr] + neighbor[1]
                        queue.append(neighbor[0])
            stop += 1
            distance = new_distance

        return distance[dst]
```

### Dijkstra's Algorithm

```Python

```
