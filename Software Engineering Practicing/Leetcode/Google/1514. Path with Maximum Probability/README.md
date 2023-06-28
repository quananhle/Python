## [1514. Path with Maximum Probability](https://leetcode.com/problems/path-with-maximum-probability/)

```Tag```: ```Graph``` ```Bellman-Ford Algorithm``` ```Shortest Path Faster Algorithm``` ```Dijkstra's Algorithm```

#### Difficulty: Medium

You are given an undirected weighted graph of ```n``` nodes __(0-indexed)__, represented by an edge list where ```edges[i] = [a, b]``` is an undirected edge connecting the nodes ```a``` and ```b``` with a probability of success of traversing that edge ```succProb[i]```.

Given two nodes ```start``` and ```end```, find the path with the maximum probability of success to go from ```start``` to ```end``` and return its success probability.

If there is no path from ```start``` to ```end```, return ```0```. Your answer will be accepted if it differs from the correct answer by at most __1e-5__.

![image](https://github.com/quananhle/Python/assets/35042430/164fc9ff-5b41-4bd6-b8b2-7ab9dd747ffd)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/09/20/1558_ex1.png)
```
Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
Output: 0.25000
Explanation: There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/09/20/1558_ex2.png)
```
Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
Output: 0.30000
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2019/09/20/1558_ex3.png)
```
Input: n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
Output: 0.00000
Explanation: There is no path between 0 and 2.
```

__Constraints:__

- ```2 <= n <= 10^4```
- ```0 <= start, end < n```
- ```start != end```
- ```0 <= a, b < n```
- ```a != b```
- ```0 <= succProb.length == edges.length <= 2*10^4```
- ```0 <= succProb[i] <= 1```
- There is at most one edge between every two nodes.

---
