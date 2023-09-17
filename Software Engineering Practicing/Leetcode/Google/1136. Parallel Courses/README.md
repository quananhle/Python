## [1136. Parallel Courses](https://leetcode.com/problems/parallel-courses)

```Tag```: ```Graph``` ```Topological Sort``` ```Kahn's Algorithm``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

You are given an integer ```n```, which indicates that there are ```n``` courses labeled from ```1``` to ```n```. You are also given an array relations where ```relations[i]``` = $[prevCourse_{i}, nextCourse_{i}]$, representing a prerequisite relationship between course $prevCourse_{i}$ and course $nextCourse_{i}$: course $prevCourse_{i}$ has to be taken before course $nextCourse_{i}$.

In one semester, you can take any number of courses as long as you have taken all the prerequisites in the previous semester for the courses you are taking.

Return _the minimum number of semesters needed to take all courses_. If there is no way to take all the courses, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/6038e09f-b63e-472b-a360-755ac097e4b4)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/24/course1graph.jpg)
```
Input: n = 3, relations = [[1,3],[2,3]]
Output: 2
Explanation: The figure above represents the given graph.
In the first semester, you can take courses 1 and 2.
In the second semester, you can take course 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/24/course2graph.jpg)
```
Input: n = 3, relations = [[1,2],[2,3],[3,1]]
Output: -1
Explanation: No course can be studied because they are prerequisites of each other.
```

__Constraints:__

- $1 \le n \le 5000$
- $1 \le relations.length \le 5000$
- $relations[i].length == 2$
- $1 \le prevCourse_{i}, nextCourse_{i} \le n$
- $prevCourse_{i} \neq nextCourse_{i}$
- All the pairs $[prevCourse_{i}, nextCourse_{i}]$ are unique.

---

### Topological Sort using Kahn's Algorithm

![image](https://camo.githubusercontent.com/2cf5467d09fbacb3ddf239cac1c42f214b3abe785139960b9383bbea42a6bc52/68747470733a2f2f6c656574636f64652e636f6d2f70726f626c656d732f636f757273652d7363686564756c652f466967757265732f3230372f3230372d312e706e67)

We can treat the problem as a directed graph problem (the courses are nodes and the prerequisites are egdes). What we need to do is somehow iterate over all the nodes in the graph.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N+E)$.
- __Space Complexity__: $\mathcal{O}(N+E)$.

```Python
class Solution:
    def minimumSemesters(self, n: int, relations: List[List[int]]) -> int:
        graph = {i: [] for i in range(1, n + 1)}
        indegree = collections.defaultdict(int)

        for start, end in relations:
            graph[start].append(end)
            # Count the number of prerequisite courses for every end node
            indegree[end] += 1

        queue = collections.deque()
        for node in graph:
            if indegree[node] == 0:
                queue.append(node)
            
        # Start with no semester completed and no course taken
        ans = taken = 0
        while queue:
            # New semester starts
            ans += 1
            next_queue = list()
            for curr in queue:
                taken += 1
                for next in graph[curr]:
                    indegree[next] -= 1
                    # If all prerequisite courses taken
                    if indegree[next] == 0:
                        # Get the next courses to take next semester to the queue
                        next_queue.append(next)
            queue = next_queue

        return ans if taken == n else -1
```

```Python
class Solution:
    def minimumSemesters(self, n: int, relations: List[List[int]]) -> int:
        graph = collections.defaultdict(list)
        indegree = collections.defaultdict(int)

        for start, end in relations:
            graph[start].append(end)
            indegree[end] += 1

        queue = collections.deque()
        for node in range(1, n + 1):
            if indegree[node] == 0:
                queue.append((1, node))
            
        # Start with no semester completed and no course taken
        ans = 0
        taken = list()
        while queue:
            # New semester starts
            semester, curr = queue.popleft()
            # Record taken course
            taken.append(curr)
            ans = max(ans, semester)
            for next in graph[curr]:
                indegree[next] -= 1
                # If all prerequisite courses taken
                if indegree[next] == 0:
                    # Get the next courses to take next semester to the queue
                    queue.append((semester + 1, next))

        return ans if len(topological_sort) == n else -1
```
