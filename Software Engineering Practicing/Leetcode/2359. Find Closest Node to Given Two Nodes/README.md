## 2359. Find Closest Node to Given Two Nodes

```Tag```: ```Depth-First Search```

#### Difficulty: Medium

You are given a __directed__ graph of ```n``` nodes numbered from ```0``` to ```n - 1```, where each node has __at most one__ outgoing edge.

The graph is represented with a given __0-indexed__ array ```edges``` of size ```n```, indicating that there is a directed edge from node ```i``` to node ```edges[i]```. If there is no outgoing edge from ```i```, then ```edges[i] == -1```.

You are also given two integers ```node1``` and ```node2```.

Return _the index of the node that can be reached from both ```node1``` and ```node2```, such that the maximum between the distance from node1 to that node, and from node2 to that node is __minimized___. If there are multiple answers, return _the node with the __smallest index___, and if no possible answer exists, return ```-1```.

Note that ```edges``` may contain cycles.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/06/07/graph4drawio-2.png)
```
Input: edges = [2,2,3,-1], node1 = 0, node2 = 1
Output: 2
Explanation: The distance from node 0 to node 2 is 1, and the distance from node 1 to node 2 is 1.
The maximum of those two distances is 1. It can be proven that we cannot get a node with a smaller maximum distance than 1, so we return node 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/06/07/graph4drawio-4.png)
```
Input: edges = [1,2,-1], node1 = 0, node2 = 2
Output: 2
Explanation: The distance from node 0 to node 2 is 2, and the distance from node 2 to itself is 0.
The maximum of those two distances is 2. It can be proven that we cannot get a node with a smaller maximum distance than 2, so we return node 2.
```

__Constraints:__
```
n == edges.length
2 <= n <= 105
-1 <= edges[i] < n
edges[i] != i
0 <= node1, node2 < n
```

---
