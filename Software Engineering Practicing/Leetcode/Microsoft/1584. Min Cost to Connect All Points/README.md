## [1584. Min Cost to Connect All Points](https://leetcode.com/problems/min-cost-to-connect-all-points)

```Tag```: ```Kruskal's Algorithm``` ```Prim's Algorithm``` ```Union-Find```

#### Difficulty: Medium

You are given an array ```points``` representing integer coordinates of some points on a 2D-plane, where ```points[i]``` = $[x_{i}, y_{i}]$.

The cost of connecting two points $[x_{i}, y_{i}]$ and $[x_{i}, y_{i}]$ is the __manhattan distance__ between them: $|x_{i} - x_{j}| + |y_{i} - y_{j}|$, where ```|val|``` denotes the absolute value of ```val```.

Return _the minimum cost to make all points connected_. All points are connected if there is __exactly one__ simple path between any two points.

![image](https://github.com/quananhle/Python/assets/35042430/cfe2fe6c-0a67-482f-973b-daf95705ff5f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/26/d.png)
```
Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
Output: 20
Explanation:
```

![image](https://assets.leetcode.com/uploads/2020/08/26/c.png)

```
We can connect the points as shown above to get the minimum cost of 20.
Notice that there is a unique path between every pair of points.
```

__Example 2:__
```
Input: points = [[3,12],[-2,5],[-4,1]]
Output: 18
```

__Constraints:__

- $1 \le points.length \le 1000$
- $-10^{6} \le x_{i}, y_{i} \le 10^{6}$
- All pairs $(x_{i}, y_{i})$ are distinct.

---

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/Slide1.PNG)

### Kruskal's Algorithm

Kruskal's algorithm is a greedy algorithm for building a minimum spanning tree in a weighted and undirected graph.

![image](https://leetcode.com/problems/min-cost-to-connect-all-points/Figures/1584/kruskal.gif)

The union-find data structure has two primary functions:

- ```find(a)```: Function which returns the ID of the group in which node ```a``` belongs.
- ```union(a, b)```: Function to merge the groups of node ```a``` and ```b```. If they already belong to the same group, we don't do anything and return ```false``` to signify the edge between ```a``` and ```b``` was not added. Otherwise, we return ```true```.

While there are several ways to implement union-find, in this approach, we will implement union-find by rank with path compression.

So, after sorting all the edges in increasing order, we will try to connect the end nodes of each edge one by one.
First, we need to check if these two nodes are already connected. To do so, we can use the ```find``` function. If they are already connected by some other path, then adding this edge will form a cycle; thus, we will omit this edge from the MST. If the nodes are not connected, we can use the ```union``` function to connect them. We will perform the ```find``` check inside the ```union``` function to keep our code clean.
