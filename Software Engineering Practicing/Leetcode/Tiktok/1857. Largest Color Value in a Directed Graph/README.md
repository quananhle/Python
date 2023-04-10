## [1857. Largest Color Value in a Directed Graph](https://leetcode.com/problems/largest-color-value-in-a-directed-graph/)

```Tag```: ```Graph``` ```Topological Sort``` ```Kahn's Algorithm``` ```Depth-First Search```

#### Difficulty: Hard

There is a __directed graph__ of ```n``` colored nodes and ```m``` edges. The nodes are numbered from ```0``` to ```n - 1```.

You are given a string ```colors``` where ```colors[i]``` is a lowercase English letter representing the color of the i<sup>th</sup> node in this graph (__0-indexed__). You are also given a 2D array ```edges``` where ```edges[j]``` = [```a```<sub>```j```</sub>, ```b```<sub>```j```</sub>] indicates that there is a directed edge from node ```a```<sub>```j```</sub> to node ```b```<sub>```j```</sub>.

A valid path in the graph is a sequence of nodes ```x1 -> x2 -> x3 -> ... -> xk``` such that there is a directed edge from ```x```<sub>```i```</sub> to ```x```<sub>```i+1```</sub> for every ```1 <= i < k```. The color value of the path is the number of nodes that are colored the most frequently occurring color along that path.

Return _the largest color value of any valid path in the given graph, or ```-1``` if the graph contains a cycle_.

![image](https://user-images.githubusercontent.com/35042430/230752627-45dbd1d7-db63-4c1b-bf22-c95b0b87003a.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/21/leet1.png)
```
Input: colors = "abaca", edges = [[0,1],[0,2],[2,3],[3,4]]
Output: 3
Explanation: The path 0 -> 2 -> 3 -> 4 contains 3 nodes that are colored "a" (red in the above image).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/04/21/leet2.png)
```
Input: colors = "a", edges = [[0,0]]
Output: -1
Explanation: There is a cycle from 0 to 0.
```

__Constraints:__

- ```n == colors.length```
- ```m == edges.length```
- ```1 <= n <= 10^5```
- ```0 <= m <= 10^5```
- ```colors``` consists of lowercase English letters.
- ```0 <= aj, bj < n```

---

### Topological Sort (Kahn's Algorithm)

Let's perform Kahn's algorithm on directed graph having a cycle. In a directed acyclic graph, we can use Kahn's algorithm to get the topological ordering. Kahn’s algorithm works by keeping track of the number of incoming edges into each node (indegree). It works by repeatedly visiting the nodes with an indegree of zero and deleting all the edges associated with it leading to a decrement of indegree for the nodes whose incoming edges are deleted. This process continues until no elements with zero indegree can be found.

![image](https://leetcode.com/problems/largest-color-value-in-a-directed-graph/Figures/1857/1857-1.png)

__Algorithm__

1. Create an integer variable ```n = colors.length()``` which stores the number of nodes in the graph.
2. Create an adjacency list ```graph``` in which ```graph[x]``` contains all nodes with an incoming edge from node ```x```.
3. Create an array ```indegree``` of length ```n``` where ```indegree[x]``` stores the number of edges entering node ```x```.
4. Create a 2D-array ```count``` with ```n``` rows and ```26``` columns where ```count[x]``` keeps track of the maximum frequencies of all the colors for paths that end at node ```x```. Note that color ```a``` corresponds to column ```0```, ```b``` corresponds to column ```1```, and so on.
5. Initialize a queue of integers ```queue``` and start a BFS algorithm moving from the leaf nodes to the parent nodes.
6. Begin the BFS traversal by pushing all of the leaf nodes (```indegree``` equal to ```0```) in the ```queue```.
7. Create two integer variables ```ans = 0``` to store the answer to the problem and ```seen = 0``` to count number of visited nodes.
8. While the queue is not empty;
    - Dequeue the first ```node``` from the queue.
    - Increment the frequency of the color of ```node``` by ```1``` and also update ```ans```. We perform ```ans = max(ans, ++count[node][colors[node] - 'a'])```.
    - Increment ```seen``` by ```1```.
    - For each ```neighbor``` (nodes that have an incoming edge from ```node```) of ```node```, we try to update the frequencies of all colors stored for ```neighbor``` to cover all the paths that use ```node -> neighbor``` edge. We perform ```count[neighbor][i] = max(count[neighbor][i], count[node][i])``` for every color ```i``` where color ```a``` corresponds to ```0```, ```b``` corresponds to ```1```, and so on.
    - We further decrement ```indegree[neighbor]``` by ```1``` to delete the ```node -> neighbor``` edge.
    - If ```indegree[neighbor] == 0```, it means that ```neighbor``` behaves as a leaf node, so we push ```neighbor``` in the queue.
9. If number of nodes visited is less than total number of nodes, i.e., ```seen < n``` we return ```-1``` as there must be a cycle. Otherwise, we return ```ans```.

- __Time complexity__: ```O(26 * m + 26 * n) = O(m + n).```
- __Space complexity__: ```O(m + 26 * n) = O(m + n).```

```Python
class Solution:
    def largestPathValue(self, colors: str, edges: List[List[int]]) -> int:
        n, k = len(colors), 26
        colors = [ord(c) - ord('a') for c in colors]
        
        # Build the adjacency graph
        graph = collections.defaultdict(list)
        indegree = [0] * n
        for u, v in edges:
            graph[u].append(v)
            indegree[v] += 1

        queue = collections.deque()
        for node in range(n):
            if indegree[node] == 0:
                queue.append((node))
        
        counter = [[0] * k for _ in range(n)]
        
        ans = 1
        seen = 0
        while queue:
            node = queue.popleft()
            counter[node][colors[node]] += 1
            ans = max(ans, counter[node][colors[node]])
            seen += 1
            for neighbor in graph[node]:
                for i in range(k):
                    counter[neighbor][i] = max(counter[neighbor][i], counter[node][i])
                indegree[neighbor] -= 1
                if indegree[neighbor] == 0:
                    queue.append((neighbor))
        
        return ans if seen == n else -1
```

```Python
class Solution:
    def largestPathValue(self, colors: str, edges: List[List[int]]) -> int:
        n, k = len(colors), 26

        # Build the adjacency graph
        indegrees = [0] * n
        graph = collections.defaultdict(list)
        for u, v in edges:
            graph[u].append(v)
            indegrees[v] += 1
        
        counter = collections.defaultdict(int)
        
        queue = collections.deque()
        for i in range(n):
            if indegrees[i] == 0:
                queue.append(i)

        visited = 0
        ans = 0

        while queue:
            node = queue.popleft()
            counter[(node, ord(colors[node]) - ord('a'))] += 1
            ans = max(ans, counter[(node, ord(colors[node]) - ord('a'))])
            visited += 1

            for neighbor in graph[node]:
                for i in range(k):
                    counter[(neighbor, i)] = max(counter[(neighbor, i)], counter[(node, i)])

                indegrees[neighbor] -= 1
                if indegrees[neighbor] == 0:
                    queue.append(neighbor)

        return ans if visited == n else -1
```

### Depth-First Search

__Algorithm__

1. Create an integer variable ```n = colors.length()``` which stores the number of nodes in the graph.
2. Create an adjacency list ```graph``` in which ```graph[x]``` contains all nodes with an incoming edge from node ```x```.
3. Create a 2D-array ```counter``` with ```n``` rows and ```26``` columns where ```counter[x]``` keeps track of the maximum frequencies of all the colors among all the paths that begin at node ```x```. Note, the definition of ```counter``` is opposite in this case. The color ```a``` corresponds to column ```0```, ```b``` corresponds to column ```1```, and so on.
4. Create two boolean arrays, ```seen``` and ```stack```, each of size ```n```. The ```seen``` array keeps track of visited nodes and ```stack``` keeps track of nodes that are currently in the ongoing DFS stack. It will help us to detect cycle in the graph.
5. Create an integer variable ```answer = 0``` to store the answer to the problem.
6. For each node we begin the DFS traveral. We implement the ```dfs``` method which takes six parameters: an integer ```node``` from which the current traversal begins, ```colors```, ```graph```, ```counter```, ```seen``` and ```stack``. It returns the maximum frequency of the color of ```node``` that we can get across all the paths starting from ```node```. We return infinity if there is a cycle, which we can detect by checking ```stack``. For each node ```i```, we update ```answer``` whenever we can using ```answer = max(answer, dfs(i, colors, graph, counter, seen, stack))```:
    - If ```node``` is already present in ```stack``, we have a cycle. We return ```infinity```.
    - If ```node``` is already visited, we return the frequency of ```node```'s color, i.e., ```counter[node][colors[node] - 'a']```.
    - We mark node as ```seen``` and also set ```stack[node] = true```.
    - We iterate over all the outgoing edges of ```node``` and for each ```neighbor```, we recursively call ```dfs(neighbor, colors, graph, counter, seen, stack)```. If we get a cycle from ```neighbor```, we return ```infinity```. Otherwise, we try to update the frequencies of all colors stored for ```node``` by including the paths that use the ```node -> neighbor``` edge. We perform ```counter[node][i] = max(counter[neighbor][i], counter[node][i])``` for every color ```i``` where ```a``` corresponds to ```0```, ```b``` corresponds to ```1```, and so on.
    - After we have processed all the outgoing edges of ```node```, we increment the frequency of ```node```'s color by ```1``` to count ```node``` itself.
    - Mark ```stack[node] = false``` to mark ```node``` as out of stack.
    - Similar to the previous approach, it is sufficient to just use the frequency of ```node```'s color. We return ```counter[node][colors[node] - 'a']```.
7. If ```answer``` is equal to infinity, we return ```-1```, else we return ```answer```.

- __Time complexity__: ```O(26 * m + 26 * n) = O(m + n).```
- __Space complexity__: ```O(m + 26 * n) = O(m + n).```

```Python
class Solution:
    def largestPathValue(self, colors: str, edges: List[List[int]]) -> int:
        n, k = len(colors), 26

        # Build the adjacency graph
        graph = collections.defaultdict(list)
        for u, v in edges:
            graph[u].append(v)


        def dfs(node):
            if stack[node]:
                return math.inf

            if seen[node]:
                return counter[node][ord(colors[node]) - ord('a')]

            seen[node] = True
            stack[node] = True

            if node in graph:
                for neighbor in graph[node]:
                    if dfs(neighbor) == math.inf:
                        return math.inf
                    for i in range(k):
                        counter[node][i] = max(counter[node][i], counter[neighbor][i])

            counter[node][ord(colors[node]) - ord('a')] += 1
            stack[node] = False

            return counter[node][ord(colors[node]) - ord('a')]

        ans = 0
        counter = [[0] * k for _ in range(n)]
        seen = [None for _ in range(n)]
        stack = [None for _ in range(n)]

        for i in range(n):
            ans = max(ans, dfs(i))

        return ans if ans != math.inf else -1
```

```Python
class Solution:
    def largestPathValue(self, colors: str, edges: List[List[int]]) -> int:
        n, k = len(colors), 26

        # Build the adjacency graph
        graph = collections.defaultdict(list)
        for u, v in edges:
            graph[u].append(v)


        def dfs(node):
            if node in stack:
                return math.inf

            if node in seen:
                return counter[(node, ord(colors[node]) - ord('a'))]

            seen.add(node)
            stack.add(node)

            if node in graph:
                for neighbor in graph[node]:
                    if dfs(neighbor) == math.inf:
                        return math.inf
                    for i in range(k):
                        counter[(node, i)] = max(counter[(node, i)], counter[(neighbor, i)])

            counter[(node, ord(colors[node]) - ord('a'))] += 1
            stack.remove(node)

            return counter[(node, ord(colors[node]) - ord('a'))]


        ans = 0
        counter = collections.defaultdict(int)
        seen = set()
        stack = set()

        for i in range(n):
            ans = max(ans, dfs(i))

        return ans if ans != math.inf else -1
```
