## [847. Shortest Path Visiting All Nodes](https://leetcode.com/problems/shortest-path-visiting-all-nodes)

```Tag```: ```Graph```

#### Difficulty: Hard

You have an undirected, connected graph of ```n``` nodes labeled from ```0``` to ```n - 1```. You are given an array ```graph``` where ```graph[i]``` is a list of all the nodes connected with node ```i``` by an edge.

Return _the length of the shortest path that visits every node_. You may start and stop at any node, you may revisit nodes multiple times, and you may reuse edges.

![image](https://github.com/quananhle/Python/assets/35042430/e039d5f7-6d4f-4d03-b499-5196bf1bf1b7)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/05/12/shortest1-graph.jpg)
```
Input: graph = [[1,2,3],[0],[0],[0]]
Output: 4
Explanation: One possible path is [1,0,2,0,3]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/05/12/shortest2-graph.jpg)
```
Input: graph = [[1],[0,2,4],[1,3,4],[2],[1,2]]
Output: 4
Explanation: One possible path is [0,1,4,2,3]
```

__Constraints:__

- $n == graph.length$
- $1 \le n \le 12$
- $0 \le graph[i].length \lt n$
- ```graph[i]``` does not contain ```i```.
- If ```graph[a]``` contains ```b```, then ```graph[b]``` contains ```a```.
- The input ```graph``` is always connected.

---
