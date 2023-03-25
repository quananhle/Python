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
