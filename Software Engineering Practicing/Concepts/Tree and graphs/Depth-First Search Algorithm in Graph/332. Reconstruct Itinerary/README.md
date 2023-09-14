## [332. Reconstruct Itinerary](https://leetcode.com/problems/reconstruct-itinerary)

```Tag```: ```Depth-First Search``` ```Backtracking```

#### Difficulty: Hard

You are given a list of airline tickets where ```tickets[i]``` = [from<sub>i</sub>, to<sub>i</sub>] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.

All of the tickets belong to a man who departs from ```"JFK"```, thus, the itinerary must begin with ```"JFK"```. If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.

For example, the itinerary ```["JFK", "LGA"]``` has a smaller lexical order than ```["JFK", "LGB"]```.
You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.

![image](https://user-images.githubusercontent.com/35042430/211759978-150b8287-1481-4559-bf2c-08e008a767bc.png)

![image](https://github.com/quananhle/Python/assets/35042430/22404f27-39d0-44b2-b82a-8cefad2d7f95)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/14/itinerary1-graph.jpg)
```
Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
Output: ["JFK","MUC","LHR","SFO","SJC"]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/14/itinerary2-graph.jpg)
```
Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.
```

__Constraints:__
```
1 <= tickets.length <= 300
tickets[i].length == 2
fromi.length == 3
toi.length == 3
fromi and toi consist of uppercase English letters.
fromi != toi
```

---

### Backtracking and Greedy

```Python
class Solution:
    res = list()

    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        # Depth-First Search
        visited = dict()
        res = list()
        route = ['JFK']
        # Build the adjacency list
        flight_map = collections.defaultdict(list)
        for origin, destination in tickets:
            flight_map[origin].append(destination)
        for origin, destination in flight_map.items():
            # Sort the destination airport in lexico order
            destination.sort()
            visited[origin] = [False] * len(destination)
        
        def backtracking(airport, route,):
            # Check if found all routes from the departure airports to the arrival airports
            if len(route) == len(tickets) + 1:
                self.res = route
                return True
            for index, next_airport in enumerate(flight_map[airport]):
                if not visited[airport][index]:
                    # Mark the airport as visited so that recursion call won't go back to the departure
                    visited[airport][index] = True
                    ans = backtracking(next_airport, route + [next_airport])
                    # Reset the visited list for the next route
                    visited[airport][index] = False
                    if ans:
                        return True
            return False

        backtracking("JFK", route)
        return self.res
```

### Hierholzer's Algorithm

#### Eulerian Cycle

    In graph theory, an Eulerian trail (or Eulerian path) is a trail in a finite graph that visits every edge exactly once (allowing for revisiting vertices).

In our problem, we are asked to construct an itinerary that uses all the flights (edges), starting from the airport of ```"JFK"```. As one can see, the problem is actually a variant of Eulerian path, with a fixed starting point.

    Similarly, an Eulerian circuit or Eulerian cycle is an Eulerian trail that starts and ends on the same vertex.
    
#### Hierholzer's Algorithm 

    Hierholzer's algorithm is the stepwise construction of the Eulerian cycle by connecting disjunctive circles.

To be more specific, the algorithm consists of two steps:

- It starts with a random node and then follows an arbitrary unvisited edge to a neighbor. This step is repeated until one returns to the starting node. This yields a first circle in the graph.

- If this circle covers all nodes it is an Eulerian cycle and the algorithm is finished. Otherwise, one chooses another node among the cycles' nodes with unvisited edges and constructs another circle, called subtour.

![image](https://leetcode.com/problems/reconstruct-itinerary/solutions/514368/Figures/332/332_eulerian_cycle.png)
By connecting all the circles in the above process, we build the Eulerian cycle at the end.

#### Eulerian Path

    To find the Eulerian path, inspired from the original Hierzolher's algorithm, we simply change one condition of loop, rather than stopping at the starting point, we stop at the vertex where we do not have any unvisited edges.

To summarize, the main idea to find the Eulerian path consists of two steps:

- __Step 1)__. Starting from any vertex, we keep following the unused edges until we get stuck at certain vertex where we have no more unvisited outgoing edges.

- __Step 2)__. We then backtrack to the nearest neighbor vertex in the current path that has unused edges and we repeat the process until all the edges have been used.

```Python
class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        # Depth-First Search
        res = list()
        # Build the adjacency list
        flight_map = collections.defaultdict(list)
        for origin, destination in tickets:
            flight_map[origin].append(destination)
        for destination in flight_map.values():
            # Sort the destination airport in lexico order
            destination.sort(reverse=True)

        def dfs(airport):
            destinations = flight_map[airport]
            # Starting from any vertex, keep following the unused edges until get stuck at certain vertex where there is no more unvisited outgoing edges
            while destinations:
                next_airport = destinations.pop()
                # Backtrack to the nearest neighbor vertex in the current path that has unused edges
                dfs(next_airport)
            # Until all the edges have been used, first vertex that got stuck at would be the end point of the Eulerian path
            res.append(airport)

        dfs("JFK")
        # Backward the path to reconstruct the Eulerian path
        return res[::-1]
```

```Python
class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        targets = collections.defaultdict(list)
        for a, b in sorted(tickets)[::-1]:
            targets[a] += b,
        route = []
        def visit(airport):
            while targets[airport]:
                visit(targets[airport].pop())
            route.append(airport)
        visit('JFK')
        return route[::-1]
```

```Python
class Solution:
    def findItinerary(self, tickets):
        targets = collections.defaultdict(list)
        for a, b in sorted(tickets)[::-1]:
            targets[a] += b,
        route, stack = [], ['JFK']
        while stack:
            while targets[stack[-1]]:
                stack += targets[stack[-1]].pop(),
            route += stack.pop(),
        return route[::-1]
```


