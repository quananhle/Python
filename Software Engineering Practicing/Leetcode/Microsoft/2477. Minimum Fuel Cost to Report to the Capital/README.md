## 2477. Minimum Fuel Cost to Report to the Capital

```Tag```: ```Graph & Tree``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

There is a tree (i.e., a connected, undirected graph with no cycles) structure country network consisting of ```n``` cities numbered from ```0``` to ```n - 1``` and exactly ```n - 1``` roads. The capital city is city ```0```. You are given a 2D integer array roads where ```roads[i]``` = [a<sub>i</sub>, b<sub>i</sub>] denotes that there exists a bidirectional road connecting cities a<sub>i</sub> and b<sub>i</sub>.

There is a meeting for the representatives of each city. The meeting is in the capital city.

There is a car in each city. You are given an integer ```seats``` that indicates the number of seats in each car.

A representative can use the car in their city to travel or change the car and ride with another representative. The cost of traveling between two cities is one liter of fuel.

Return _the minimum number of liters of fuel to reach the capital city_.

![image](https://user-images.githubusercontent.com/35042430/218288964-e42197e6-2e8f-4a44-8779-7d1c08597f83.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/09/22/a4c380025e3ff0c379525e96a7d63a3.png)
```
Input: roads = [[0,1],[0,2],[0,3]], seats = 5
Output: 3
Explanation: 
- Representative1 goes directly to the capital with 1 liter of fuel.
- Representative2 goes directly to the capital with 1 liter of fuel.
- Representative3 goes directly to the capital with 1 liter of fuel.
It costs 3 liters of fuel at minimum. 
It can be proven that 3 is the minimum number of liters of fuel needed.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/11/16/2.png)
```
Input: roads = [[3,1],[3,2],[1,0],[0,4],[0,5],[4,6]], seats = 2
Output: 7
Explanation: 
- Representative2 goes directly to city 3 with 1 liter of fuel.
- Representative2 and representative3 go together to city 1 with 1 liter of fuel.
- Representative2 and representative3 go together to the capital with 1 liter of fuel.
- Representative1 goes directly to the capital with 1 liter of fuel.
- Representative5 goes directly to the capital with 1 liter of fuel.
- Representative6 goes directly to city 4 with 1 liter of fuel.
- Representative4 and representative6 go together to the capital with 1 liter of fuel.
It costs 7 liters of fuel at minimum. 
It can be proven that 7 is the minimum number of liters of fuel needed.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2022/09/27/efcf7f7be6830b8763639cfd01b690a.png)
```
Input: roads = [], seats = 1
Output: 0
Explanation: No representatives need to travel to the capital city.
```

__Constraints:__

- 1 <= ```n``` <= 10<sup>5</sup>
- ```roads.length == n - 1```
- ```roads[i].length == 2```
- ```0 <= ai, bi < n```
- ```ai != bi```
- ```roads``` represents a valid tree.
- 1 <= ```seats``` <= 10<sup>5</sup>

---

We are given a tree with n nodes (or cities) from 0 to n - 1 and exactly n - 1 edges.

There is one car and one representative at each node. We are given an integer seats that represents the maximum number of representatives that can together go in any car. The cost of travelling over an edge using a car takes one liter of fuel.

Our task is to move all the representatives to node 0 by using the minimum fuel and return the minimum fuel required to do so.

Before moving on to the solution, consider some of the graph terminologies that will be used later:

![image](https://leetcode.com/problems/minimum-fuel-cost-to-report-to-the-capital/solutions/3080167/Figures/2477/2477-1.png)

1. Child: A node that is one edge further away from a given node in a rooted tree. In the above image, nodes 3, 4 are children of 1, which is called the parent.
2. Descendants: Descendants of a node are children, children of children, and so on. In the above image, nodes 3, 4, 6, 7, 9 are all descendants of 1.
3. Subtree: A subtree of a node T is a tree S consisting of a node T and all of its descendants in T. The subtree corresponding to the root node is the entire tree.
4. Level: A node's level (or depth) in a tree data structure is its distance from the tree's root node. The root node is said to be at level 0, and its children are at level 1, and the children of the nodes at level 1 are at level 2, and so on. In our case, the root node is node 0, because this is where we want to take all of the representatives.

Although the edges are given as undirected, we will treat the graph as a tree where 0 is the root and only consider moving in one direction.Although the edges are given as undirected, we will treat the graph as a tree where 0 is the root and only consider moving in one direction.

### Depth-First Search

```Python

```

### Breadth-First Search

```Python


```
