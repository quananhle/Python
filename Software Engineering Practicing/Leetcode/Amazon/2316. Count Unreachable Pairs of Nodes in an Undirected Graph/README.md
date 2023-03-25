## [2316. Count Unreachable Pairs of Nodes in an Undirected Graph](https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

You are given an integer ```n```. There is an __undirected__ graph with ```n``` nodes, numbered from ```0``` to ```n - 1```. You are given a 2D integer array edges where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] denotes that there exists an __undirected__ edge connecting nodes a<sub>i</sub> and b<sub>i</sub>.

Return _the __number of pairs__ of different nodes that are __unreachable__ from each other_.

![image](https://user-images.githubusercontent.com/35042430/227667760-94946d5c-0277-4c5b-89a1-887df34844e7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/05/05/tc-3.png)
```
Input: n = 3, edges = [[0,1],[0,2],[1,2]]
Output: 0
Explanation: There are no pairs of nodes that are unreachable from each other. Therefore, we return 0.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/05/05/tc-2.png)
```
Input: n = 7, edges = [[0,2],[0,5],[2,4],[1,6],[5,4]]
Output: 14
Explanation: There are 14 pairs of nodes that are unreachable from each other:
[[0,1],[0,3],[0,6],[1,2],[1,3],[1,4],[1,5],[2,3],[2,6],[3,4],[3,5],[3,6],[4,6],[5,6]].
Therefore, we return 14.
```

__Constraints:__

- 1 <= ```n``` <= 10<sup>5</sup>
- 0 <= ```edges.length``` <= 2 * 10<sup>5</sup>
- ```edges[i].length == 2```
- 0 <= a<sub>i</sub>, b<sub>i</sub> < n
- a<sub>i</sub> != b<sub>i</sub>
- There are no repeated ```edges```.

---

![image](https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/Figures/2316/2316-1.png)

The first component consists of four nodes. Except for the nodes in their components, these four nodes cannot reach any other nodes. As a result, selecting any of the four nodes from the first component and any other node from the remaining components results in a pair of nodes that are unreachable to each other.

The total number of pairs of nodes with one node in the first component and the other node in any of the remaining components would be equal to the number of nodes in the first component multiplied by the total number of nodes except the first component's nodes, i.e., ```4 * (7 - 4) = 12``` pairs. This means that there are ```12``` pairs of nodes that are unreachable from each other, where one of the two nodes are in the first component.

Let's move on to the second component, which has only one node. So, the number of unreachable pairs of nodes with one node in the second component would be the total number of nodes in the second component multiplied by the total number of nodes except the current component and the first component (we already covered pairs formed using nodes in the first component). It is ```1 * (7 - 4 - 1) = 2``` pairs.

We have now covered all of the pairs formed with one node in the first component, as well as all of the pairs formed with one node in the second component. Because we only have a third component left, no more pairs of unreachable nodes can be formed. The total number of pairs required is ```12 + 2 = 14```.

So, to find the total number of pairs that are unreachable from each other, we must iterate over the graph and determine the size of each component. Then we multiply the number of nodes in the current component by the total number of nodes in the graph, ignoring nodes in the current component and previously visited components (we already covered pairs of nodes formed with one of the nodes in the previous components). To get the required answer, we add these number of pairs of nodes while iterating over all the components one by one, as calculated in the preceding example.

### Depth-First Search

```Python
class Solution:
    def countPairs(self, n: int, edges: List[List[int]]) -> int:
        # Depth-First Search
        graph = collections.defaultdict(list)
        # Build the adjacency graph
        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)

        visited = set()
        pairs, component, remaining = 0, 0, n

        def dfs(node):
            count = 1
            visited.add(node)

            if not node in graph:
                return count

            for neighbor in graph[node]:
                if not neighbor in visited:
                    count += dfs(neighbor)
            
            return count

        for node in range(n):
            if not node in visited:
                component = dfs(node)
                pairs += component * (remaining - component)
                remaining -= component

        return pairs
```

### Breadth-First Search

```Python

```

### Union-Find

```Python

```
