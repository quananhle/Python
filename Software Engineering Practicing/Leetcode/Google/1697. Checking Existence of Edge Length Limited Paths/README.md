## [1697. Checking Existence of Edge Length Limited Paths](https://leetcode.com/problems/checking-existence-of-edge-length-limited-paths/)

```Tag```: ```Union Find```

#### Difficulty: Hard

An undirected graph of ```n``` nodes is defined by ```edgeList```, where ```edgeList[i]``` = [u<sub>i</sub>, v<su>i</sub>, dis<sub>i</sub>] denotes an edge between nodes u<sub>i</sub> and v<sub>i</sub> with distance dis<sub>i</sub>. Note that there may be multiple edges between two nodes.

Given an array ```queries```, where ```queries[j]``` = [p<sub>j</sub>, q<sub>j</sub>, limit<sub>j</sub>], your task is to determine for each ```queries[j]``` whether there is a path between p<sub>j</sub> and q<sub>j</sub> such that each edge on the path has a distance strictly less than limit<sub>j</sub> .

Return _a boolean array answer, where ```answer.length == queries.length``` and the j<sup>th</sup> value of answer is ```true``` if there is a path for ```queries[j]``` is ```true```, and ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/235581334-1640db86-f60f-4836-a36d-a6b5179dba83.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/08/h.png)
```
Input: n = 3, edgeList = [[0,1,2],[1,2,4],[2,0,8],[1,0,16]], queries = [[0,1,2],[0,2,5]]
Output: [false,true]
Explanation: The above figure shows the given graph. Note that there are two overlapping edges between 0 and 1 with distances 2 and 16.
For the first query, between 0 and 1 there is no path where each distance is less than 2, thus we return false for this query.
For the second query, there is a path (0 -> 1 -> 2) of two edges with distances less than 5, thus we return true for this query.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/08/q.png)
```
Input: n = 5, edgeList = [[0,1,10],[1,2,5],[2,3,9],[3,4,13]], queries = [[0,4,14],[1,4,13]]
Output: [true,false]
Exaplanation: The above figure shows the given graph.
```

__Constraints:__

- ```2 <= n <= 10^5```
- ```1 <= edgeList.length, queries.length <= 10^5```
- ```edgeList[i].length == 3```
- ```queries[j].length == 3```
- ```0 <= ui, vi, pj, qj <= n - 1```
- ```ui != vi```
- ```pj != qj```
- ```1 <= disi, limitj <= 10^9```
- There may be multiple edges between two nodes.

---
