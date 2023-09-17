## [847. Shortest Path Visiting All Nodes](https://leetcode.com/problems/shortest-path-visiting-all-nodes)

```Tag```: ```Graph``` ```Dynamic Programming``` ```Depth-First Search``` ```Breadth-First Search```

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

### Dynamic Programming

#### Depth-First Search with Top-Down Dynamic Programming

__Bit Manipulation To Encode State__

We can use bitmasks, which is a great tool to learn as many other problems can be solved more efficiently by using them. If there are ```n``` nodes, then there are $2^n$ possible states of nodes we have visited so far - for each node, we have either visited it or we haven't. Therefore, we can use an integer to represent the nodes that we have visited so far - if the $i^{th}$ bit of the integer (from the right side) is set to ```1```, then that means we have visited node ```i```.

![image](https://leetcode.com/problems/shortest-path-visiting-all-nodes/Figures/847/847_1.png)

While this is an easy and very efficient way to encode state, we also need to know how to do 2 things:

1. How to change the mask (flip certain bits, for example, if we visit the 6th node, how do we flip the 6th bit?)
2. How to tell what nodes we have visited so far (given a certain mask, how do we tell if we have visited the 4th node?)

![image](https://leetcode.com/problems/shortest-path-visiting-all-nodes/Figures/847/847_2.png)

```Python

```
