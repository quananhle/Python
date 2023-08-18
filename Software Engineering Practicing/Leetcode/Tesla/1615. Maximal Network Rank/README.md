## [1615. Maximal Network Rank](https://leetcode.com/problems/maximal-network-rank/)

```Tag```:

#### Difficulty: Medium

There is an infrastructure of ```n``` cities with some number of roads connecting these cities. Each ```roads[i] = [ai, bi]``` indicates that there is a bidirectional road between cities ```ai``` and ```bi```.

The network rank of two different cities is defined as the total number of directly connected roads to either city. If a road is directly connected to both cities, it is only counted once.

The maximal network rank of the infrastructure is the maximum network rank of all pairs of different cities.

Given the integer n and the array roads, return _the __maximal network rank__ of the entire infrastructure_.

![image](https://github.com/quananhle/Python/assets/35042430/81efd047-32ca-467f-8d43-7ad76b0ef20d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/21/ex1.png)
```
Input: n = 4, roads = [[0,1],[0,3],[1,2],[1,3]]
Output: 4
Explanation: The network rank of cities 0 and 1 is 4 as there are 4 roads that are connected to either 0 or 1. The road between 0 and 1 is only counted once.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/21/ex2.png)
```
Input: n = 5, roads = [[0,1],[0,3],[1,2],[1,3],[2,3],[2,4]]
Output: 5
Explanation: There are 5 roads that are connected to cities 1 or 2.
```

__Example 3:__
```
Input: n = 8, roads = [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]]
Output: 5
Explanation: The network rank of 2 and 5 is 5. Notice that all the cities do not have to be connected.
```

__Constraints:__

- $2 \le n \le 100$
- $0 \le roads.length \le n * (n - 1) / 2$
- $roads[i].length == 2$
- $0 \le ai, bi \le n-1$
- $ai != bi$
- Each pair of cities has at most one road connecting them.

---
