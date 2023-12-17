## [1436. Destination City](https://leetcode.com/problems/destination-city)

```Tag```: ```Graph``` ```Hash Set``` ```Depth-First Search```

#### Difficulty: Easy

You are given the array ```paths```, where $paths[i] = [cityA_i, cityB_i]$ means there exists a direct path going from $cityA_i$ to $cityB_i$. Return _the destination city, that is, the city without any path outgoing to another city_.

It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.

![image](https://github.com/quananhle/Python/assets/35042430/5d808647-3e02-44e3-8351-dde853b3e821)

---

__Example 1:__
```
Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
Output: "Sao Paulo" 
Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".
```

__Example 2:__
```
Input: paths = [["B","C"],["D","B"],["C","A"]]
Output: "A"
Explanation: All possible trips are: 
"D" -> "B" -> "C" -> "A". 
"B" -> "C" -> "A". 
"C" -> "A". 
"A". 
Clearly the destination city is "A".
```

__Example 3:__
```
Input: paths = [["A","Z"]]
Output: "Z"
```

__Constraints:__

- $1 \le paths.length \le 100$
- $paths[i].length == 2$
- $1 \le cityA_i.length, cityB_i.length \le 10$
- $cityA_i \neq cityB_i$
- All strings consist of lowercase and uppercase English letters and the space character.

---

### Brute Force

```Python
class Solution:
    def destCity(self, paths: List[List[str]]) -> str:
        n = len(paths)
        for i in range(n):
            candidate = paths[i][1]
            found = True

            for j in range(n):
                if paths[i][0] == candidate:
                    found = False
                    break
                
                if found:
                    return candidate
        
        return ""
```

### Hash Set

```Python
class Solution:
    def destCity(self, paths: List[List[str]]) -> str:
        origins, destinations = set(), set()
        for path in paths:
            origins.add(path[0])
            destinations.add(path[1])
        return (destinations - origins).pop()
```

### Depth-First Search in Graph

```Python
class Solution:
    def destCity(self, paths: List[List[str]]) -> str:
        graph = collections.defaultdict(list)
        stack = list()
        for origin, destination in paths:
            graph[origin].append(destination)
            stack.append(origin)

        # Since it is guaranteed to form a path, no need to record visited city
        while stack:
            curr = stack.pop()
            if not curr in graph:
                return curr
            for next in graph[curr]:
                stack.append(next)
        
        return ""
```
