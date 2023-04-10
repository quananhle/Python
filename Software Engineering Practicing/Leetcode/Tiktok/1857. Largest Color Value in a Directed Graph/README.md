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

```Python

```

### Depth-First Search

```Python

```
