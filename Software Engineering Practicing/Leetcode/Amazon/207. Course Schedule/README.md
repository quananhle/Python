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

Algorithm
Create an array indegree of length n where indegree[x] stores the number of edges entering node x.
We create an adjacency list adj in which adj[x] contains all the nodes with an incoming edge from node x, i.e., neighbors of node x. We create this adjacency list by iterating over prerequisites. For every prerequisite in prerequisites, we add an edge from prerequisite[1] to prerequisite[0] and increment the indegree of prerequisite[0] by 1.
Initialize a queue of integers q and start a BFS algorithm moving from the leaf nodes to the parent nodes.
Begin the BFS traversal by pushing all of the leaf nodes (indegree equal to 0) in the queue.
Create an integer variable nodesVisited = 0 to count the number of visited nodes.
While the queue is not empty;
Dequeue the first node from the queue.
Increment nodesVisited by 1.
For each neighbor (nodes that have an incoming edge from node) of node, we decrement indegree[neighbor]by 1 to delete the node -> neighbor edge.
If indegree[neighbor] == 0, it means that neighbor behaves as a leaf node, so we push neighbor in the queue.
If the number of nodes visited is less than the total number of nodes, i.e., nodesVisited < n we return false as there must be a cycle. Otherwise, if nodesVisited == numCourses, we return true. We can shorten it to just return nodesVisited == numCourses.



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
