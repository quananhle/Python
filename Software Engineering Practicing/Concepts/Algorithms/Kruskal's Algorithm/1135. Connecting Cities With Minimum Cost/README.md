## [1135. Connecting Cities With Minimum Cost](https://leetcode.com/problems/connecting-cities-with-minimum-cost/)

```Tag```: ```Graph``` ```Union Find```

#### Difficulty: Medium

There are ```n``` cities labeled from ```1``` to ```n```. You are given the integer ```n``` and an array connections where ```connections[i] = [xi, yi, costi]``` indicates that the cost of connecting city ```xi``` and city ```yi``` (bidirectional connection) is ```costi```.

Return _the minimum cost to connect all the ```n``` cities such that there is at least one path between each pair of cities_. If it is impossible to connect all the ```n``` cities, return ```-1```,

The cost is the sum of the connections' costs used.

![image](https://github.com/quananhle/Python/assets/35042430/957978f6-ceae-43bd-96ac-2cbfc7f1e49d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/04/20/1314_ex2.png)
```
Input: n = 3, connections = [[1,2,5],[1,3,6],[2,3,1]]
Output: 6
Explanation: Choosing any 2 edges will connect all cities so we choose the minimum 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/04/20/1314_ex1.png)
```
Input: n = 4, connections = [[1,2,3],[3,4,4]]
Output: -1
Explanation: There is no way to connect all cities even if all edges are used.
``` 

__Constraints:__

- $1 \le n \le 10^{4}$
- $1 \le connections.length \le 10^{4}$
- $connections[i].length == 3$
- $1 \le xi, yi \le n$
- $xi != yi$
- $0 \le costi \le 10^{5}$

---
