## [207. Course Schedule](https://leetcode.com/problems/course-schedule/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search``` ```Topological Sort``` ```Kahn's Algorithm```

#### Difficulty: Medium

There are a total of ```numCourses``` courses you have to take, labeled from ```0``` to ```numCourses - 1```. You are given an array ```prerequisites``` where ```prerequisites[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates that you must take course b<sub>i</sub> first if you want to take course a<sub>i</sub>.

- For example, the pair ```[0, 1]```, indicates that to take course ```0``` you have to first take course ```1```.

Return _```True``` if you can finish all courses_. Otherwise, return ```False```.

![image](https://github.com/quananhle/Python/assets/35042430/6f1509a3-05f2-4de7-ad2f-273510537cf7)

---

__Example 1:__
```
Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take. 
To take course 1 you should have finished course 0. So it is possible.
```

__Example 2:__
```
Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: false
Explanation: There are a total of 2 courses to take. 
To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
```

__Constraints:__

- $1 <= numCourses <= 2000$
- $0 <= prerequisites.length <= 5000$
- $prerequisites[i].length == 2$
- $0 <=$ a<sub>i</sub>, b<sub>i</sub> $< numCourses$
- All the pairs $prerequisites[i]$ are unique.

---

### Topological Sort using Kahn's Algorithm

![image](https://leetcode.com/problems/course-schedule/Figures/207/207-1.png)

__Algorithm__

1. Create an array indegree of length ```n``` where ```indegree[x]``` stores the number of edges entering node ```x```.
2. We create an adjacency list ```graph``` in which ```graph[x]``` contains all the nodes with an incoming edge from node ```x```, i.e., neighbors of node ```x```. We create this adjacency list by iterating over ```prerequisites```. For every ```a, b``` in ```prerequisites```, we add an edge from ```graph[b]``` to ```a``` and increment the ```indegree``` of ```a``` by ```1```.
3. Initialize a queue of integers ```queue``` and start a BFS algorithm moving from the leaf nodes to the parent nodes.
4. Begin the BFS traversal by pushing all of the leaf nodes (```indegree``` equal to ```0```) in the ```queue```.
5. Create an set ```visited``` to count the number of visited nodes.
6. While the ```queue``` is not empty;
    - Dequeue the first ```node``` from the queue.
    - Add ```node``` to ```visited```.
    - For each ```next``` (nodes that have an incoming edge from ```node```) of ```node```, we decrement ```indegree[next]``` by ```1``` to delete the ```node -> neighbor``` edge.
    - If ```indegree[next] == 0```, it means that ```next``` behaves as a leaf node, so we push ```next``` in the queue.
7. If the number of nodes visited is less than the total number of nodes, i.e., number of nodes < n we return ```False``` as there must be a cycle. Otherwise, if ```visited.length == numCourses```, we return ```True```. We can shorten it to just return ```visited.length == numCourses```.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m+n)$
- __Space Complexity__: $\mathcal{O}(m+n)$

```Python
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        n = len(prerequisites)
        graph = collections.defaultdict(list)
        indegree = [0] * numCourses
        
        for a, b in prerequisites:
            graph[b].append(a)
            indegree[a] += 1
        
        visited = set()
        
        queue = collections.deque()
        for node in range(numCourses):
            if indegree[node] == 0:
                queue.append(node)
        
        while queue:
            curr = queue.popleft()
            visited.add(curr)

            for next in graph[curr]:
                indegree[next] -= 1
                if indegree[next] == 0:
                    queue.append(next)
        
        return len(visited) == numCourses
```

### Depth-First Search

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m+n)$
- __Space Complexity__: $\mathcal{O}(m+n)$

```Python
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        n = len(prerequisites)
        graph = collections.defaultdict(list)
        for a, b in prerequisites:
            graph[b].append(a)

        visited = set()
        indegree = [0] * numCourses

        def dfs(node):
            if indegree[node]:
                return True
            
            if node in visited:
                return False
            
            visited.add(node)
            indegree[node] += 1

            for next in graph[node]:
                if dfs(next):
                    return True
            
            indegree[node] -= 1
            return False

        for node in range(numCourses):
            if dfs(node):
                return False
            
        return True
```

```Python
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        n = len(prerequisites)
        graph = collections.defaultdict(list)
        for a, b in prerequisites:
            graph[b].append(a)

        visited = set()
        indegree = set()

        def dfs(node):
            if node in indegree:
                return True
            
            if node in visited:
                return False
            
            visited.add(node)
            indegree.add(node)

            for next in graph[node]:
                if dfs(next):
                    return True
            
            indegree.remove(node)
            return False

        for node in range(numCourses):
            if dfs(node):
                return False
            
        return True
```

```Python
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        n = len(prerequisites)
        graph = collections.defaultdict(list)
        for a, b in prerequisites:
            graph[b].append(a)

        visited = set()

        @lru_cache(None)
        def dfs(curr):
            visited.add(curr)
            pos = all(next not in visited and dfs(next) for next in graph[curr])
            visited.remove(curr)
            return pos
        
        return all(dfs(node) for node in range(numCourses))
```
