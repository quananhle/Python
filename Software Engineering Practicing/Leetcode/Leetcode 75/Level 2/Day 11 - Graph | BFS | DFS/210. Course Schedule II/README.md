## [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Kahn's Algorithm``` ```Topological Sorted Order```

#### Difficulty: Medium

There are a total of ```numCourses``` courses you have to take, labeled from ```0``` to ```numCourses - 1```. You are given an array prerequisites where ```prerequisites[i]``` = [a<sub>i</sub>, b<sub>i</sub>] indicates that you must take course b<sub>i</sub> first if you want to take course a<sub>i</sub>.

For example, the pair ```[0, 1]```, indicates that to take course ```0``` you have to first take course ```1```.

Return _the ordering of courses you should take to finish all courses_. If there are many valid answers, return __any__ of them. If it is impossible to finish all courses, return an __empty array__.

![image](https://user-images.githubusercontent.com/35042430/224572914-c5514125-7cfe-4c19-bd2d-9bd22c5d9eef.png)

---

__Example 1:__
```
Input: numCourses = 2, prerequisites = [[1,0]]
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
```

__Example 2:__
```
Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
Output: [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
```

__Example 3:__
```
Input: numCourses = 1, prerequisites = []
Output: [0]
```

__Constraints:__

- ```1 <= numCourses <= 2000```
- ```0 <= prerequisites.length <= numCourses * (numCourses - 1)```
- ```prerequisites[i].length == 2```
- ```0 <= ai, bi < numCourses```
- ```ai != bi```
- All the pairs ```[ai, bi]``` are distinct.

---

![image](https://leetcode.com/problems/course-schedule-ii/Figures/210_Course_Schedule_2/Fig-1.png)

![image](https://leetcode.com/problems/course-schedule-ii/Figures/210_Course_Schedule_2/Fig-2.png)

### Depth-First Search

- __Time Complexity__: ```O(V + E)``` where ```V``` represents the number of vertices and ```E``` represents the number of edges.
- __Space Complexity__: ```O(V + E)```

```Python
class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        # Depth-First Search

        graph = collections.defaultdict(set)

        # Build the adjacency list
        for x, y in prerequisites:
            graph[x].add(y)
        res = list()
        
        # Flag to detect cycle
        not_cycle = True

        # Base case: all unvisited nodes are marked as white
        color = ["WHITE" for _ in range(numCourses)]

        def dfs(curr):
            nonlocal not_cycle
            # Check if there is a cycle
            if not not_cycle:
                return

            # Mark the current node gray as the node is being visited
            color[curr] = "GRAY"

            
            if curr in graph:
                for neighbor in graph[curr]:
                    # If next node is new, keep searching
                    if color[neighbor] == "WHITE":
                        dfs(neighbor)
                    # If next node was visited, cycle is detected
                    elif color[neighbor] == "GRAY":
                        not_cycle = False
                    
            # Mark the node black after recursion completed
            color[curr] = "BLACK"
            res.append(curr)
        
        for vertex in range(numCourses):
            if color[vertex] == "WHITE":
                dfs(vertex)
        
        return res if not_cycle else list()
```

### Kahn's Algorithm

- __Time Complexity__: ```O(V + E)``` where ```V``` represents the number of vertices and ```E``` represents the number of edges.
- __Space Complexity__: ```O(V + E)```

```Python
class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        # Build the adjacency list
        graph = collections.defaultdict(set)
        indegree = dict()
        for destination, source in prerequisites:
            graph[source].add(destination)
            indegree[destination] = 1 + indegree.get(destination, 0)

        queue = collections.deque([k for k in range(numCourses) if not k in indegree])

        res = list()

        while queue:
            curr = queue.popleft()
            res.append(curr)

            if curr in graph:
                for next in graph[curr]:
                    indegree[next] -= 1

                    if indegree[next] == 0:
                        queue.append(next)

        return res if len(res) == numCourses else list()
```
