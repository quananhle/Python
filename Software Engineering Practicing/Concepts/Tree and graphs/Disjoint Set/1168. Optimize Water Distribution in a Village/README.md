## 1168. Optimize Water Distribution in a Village

```Tag```: 

#### Difficulty: Hard

There are ```n``` houses in a village. We want to supply water for all the houses by building wells and laying pipes.

For each house ```i```, we can either build a well inside it directly with cost ```wells[i - 1]``` (note the ```-1``` due to __0-indexing__), or pipe in water from another well to it. The costs to lay pipes between houses are given by the array ```pipes``` where each __pipes[j] = [house1<sub>j</sub>, house2<sub>j</sub>, cost<sub>j</sub>]__ represents the cost to connect __house1<sub>j</sub>__ and __house2<sub>j</sub>__ together using a pipe. Connections are bidirectional, and there could be multiple valid connections between the same two houses with different costs.

Return _the minimum total cost to supply water to all houses_.

![image](https://user-images.githubusercontent.com/35042430/211473285-880e1841-a37c-4120-8c83-f8039ee0b38c.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/05/22/1359_ex1.png)
```
Input: n = 3, wells = [1,2,2], pipes = [[1,2,1],[2,3,1]]
Output: 3
Explanation: The image shows the costs of connecting houses using pipes.
The best strategy is to build a well in the first house with cost 1 and connect the other houses to it with cost 2 so the total cost is 3.
```

__Example 2:__
```
Input: n = 2, wells = [1,1], pipes = [[1,2,1],[1,2,2]]
Output: 2
Explanation: We can supply water with cost two using one of the three options:
Option 1:
  - Build a well inside house 1 with cost 1.
  - Build a well inside house 2 with cost 1.
The total cost will be 2.
Option 2:
  - Build a well inside house 1 with cost 1.
  - Connect house 2 with house 1 with cost 1.
The total cost will be 2.
Option 3:
  - Build a well inside house 2 with cost 1.
  - Connect house 1 with house 2 with cost 1.
The total cost will be 2.
Note that we can connect houses 1 and 2 with cost 1 or with cost 2 but we will always choose the cheapest option. 
```

__Constraints:__
```
2 <= n <= 104
wells.length == n
0 <= wells[i] <= 105
1 <= pipes.length <= 104
pipes[j].length == 3
1 <= house1j, house2j <= n
0 <= costj <= 105
house1j != house2j
```

---

Since the problem description involves connecting ```houses``` (vertices) using ```pipes``` (edges), we can tell that this problem is a variant of __graph__ problems. More precisely, we can convert it into a standard __minimum spanning tree (MST)__

### Prim's Algorithm with Heap

Prim's (also known as Jarník's) algorithm is a greedy algorithm used to find the minimum spanning tree in a weighted and undirected graph.

    The algorithm operates by building the tree one vertex at a time, from an arbitrary starting vertex, at each step adding the cheapest possible connection from any vertex in the tree to a vertex that is not in the tree.

![image](https://leetcode.com/problems/optimize-water-distribution-in-a-village/solutions/1301513/Figures/1168/PrimAlgDemo.gif)

The above illustration demonstrates how Prim's algorithm works. Starting from an arbitrary vertex, Prim's algorithm grows the minimum spanning tree by adding one vertex at a time to the tree. The choice of a vertex is based on the greedy strategy, i.e. the addition of the new vertex incurs the minimum cost.

```Python

```
