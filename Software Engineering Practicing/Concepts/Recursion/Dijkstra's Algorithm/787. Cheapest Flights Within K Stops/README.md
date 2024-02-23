## [787. Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops)

```Tag```: ```Dynamic Programming``` ```Depth-First Search``` ```Breadth-First Search``` ```Graph``` ```Heap (Priority Queue)``` ```Shortest Path```

#### Difficulty: Medium

There are ```n``` cities connected by some number of flights. You are given an array ```flights``` where ```flights[i]``` = [from<sub>i</sub>, to<sub>i</sub>, price<sub>i</sub>] indicates that there is a flight from city ```from```<sub>i</sub> to city ```to```<sub>i</sub> with cost ```price```<sub>i</sub>.

You are also given three integers ```src```, ```dst```, and ```k```, return _the __cheapest price__ from ```src``` to ```dst``` with __at most__ ```k``` stops_. If there is no such route, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/784f65c7-a850-415a-97a5-ddd5ebaf2ae6)

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

- $1 \le n \le 100$
- $0 \le flights.length \le \frac{n * (n - 1)}{2}$
- $flights[i].length == 3$
- $0 \le from_i, to_i \lt n$
- $from_i \neq to_i$
- $1 \le price_i \le 10^4$
- There will not be any multiple flights between two cities.
- $0 \le src, dst, k \lt n$
- $src \neq dst$

---

### Iterative Breadth-First Search

__Time Complexity__:

__Space Complexity__:

```Python
class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        graph = collections.defaultdict(list)
        distance = [-1 for _ in range(n)]
        for fr, to, pr in flights:
            graph[fr].append([to, pr])

        distance[src] = 0
        queue = collections.deque([src])
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

```Python
class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        '''
        Create an adjacency list where graph[X] contains all the neighbors of node X and the corresponding price it takes to move to a neighbor.
        '''
        graph = [[] for _ in range(n)]
        for vector1, vector2, edge in flights:
            graph[vector1].append((vector2, edge))
        
        '''
        Initialize a queue storing {node, distance} pairs. Initially, the queue should have only {src, 0}.
        '''
        queue = [(src, 0)]
        '''
        Intialize distances array, storing the minimum price to reach a node from the src node. Intialize it with large values.
        '''
        distances = [float("inf") for _ in range(n)]
        stops = 0

        '''
        Perform BFS until the queue is empty or stops > k
        '''
        while queue and stops <= k:
            size = len(queue)
            '''
            Iterate over all the nodes at a particular level. This will be done by starting a nested loop and visiting all the nodes currently present in the queue.
            '''
            while size:
                curr, distance = queue.pop(0)
                '''
                At each pair {node, distance}, iterate over all the neighbors of node. For each neighbour, check if distances[neighbor] is less than distance + the price of the edge. If it is, then update distances[neighbor] and push {neighbor, distances[neighbor]} onto the queue.
                '''
                for next_node, next_distance in graph[curr]:
                    if distance + next_distance >= distances[next_node]:
                        continue
                    distances[next_node] = distance + next_distance
                    queue.append((next_node, distances[next_node]))
                '''
                After iterating over all the nodes in the current level, increase stops by one. We've visited all the nodes at a particular level and are ready to visit the next level of nodes.
                '''
                size -= 1
            stops += 1
        '''
        Once we reach a condition where either the queue is empty or stops == k, we have our answer as distances[dst]. If distances[dst] hasn't changed from the initial large value, then we never reached it, so return -1.
        '''
        return -1 if distances[dst] == float("inf") else distances[dst]
```

### Iterative Breadth-First Search with Priority Queue (Dijkstra's Algorithm)

```Python
class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        graph = collections.defaultdict(list)
        for origin, destination, distance in flights:
            graph[origin].append((destination, distance))
        h = [(0, 0, src)]
        visited = set()
        while h:
            # Use distance between two nodes interchangeably as price between two cities
            distance, stop, curr_city = heapq.heappop(h)
            # Check if reached the destination from the origin
            if curr_city == dst:
                return distance
            if (stop, curr_city) in visited or stop > k:
                continue
            visited.add((stop, curr_city))
            for neighbor_city in graph[curr_city]:
                heapq.heappush(h, (distance + neighbor_city[1], stop + 1, neighbor_city[0]))
        return -1
```
