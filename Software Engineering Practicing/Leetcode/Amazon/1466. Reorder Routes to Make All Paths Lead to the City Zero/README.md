## [1466. Reorder Routes to Make All Paths Lead to the City Zero](https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

There are ```n``` cities numbered from ```0``` to ```n - 1``` and ```n - 1``` roads such that there is only one way to travel between two different cities (this network form a tree). Last year, The ministry of transport decided to orient the roads in one direction because they are too narrow.

Roads are represented by connections where ```connections[i]``` = [a<sub>i</sub>, b<sub>i</sub>] represents a road from city a<sub>i</sub> to city b<sub>i</sub>.

This year, there will be a big event in the capital (city ```0```), and many people want to travel to this city.

Your task consists of reorienting some roads such that each city can visit the city ```0```. Return _the minimum number of edges changed_.

It's __guaranteed__ that each city can reach city ```0``` after reorder.

![image](https://user-images.githubusercontent.com/35042430/227409436-7c8356c4-b600-4841-abe6-bb874ad73113.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/05/13/sample_1_1819.png)
```
Input: n = 6, connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
Output: 3
Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/05/13/sample_2_1819.png)
```
Input: n = 5, connections = [[1,0],[1,2],[3,2],[3,4]]
Output: 2
Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
```

__Example 3:__
```
Input: n = 3, connections = [[1,0],[2,0]]
Output: 0
```

__Constraints:__

- 2 <= ```n``` <= 5 * 10<sup>4</sup>
- ```connections.length == n - 1```
- ```connections[i].length == 2```
- 0 <= a<sub>i</sub>, b<sub>i</sub> <= ```n - 1```
- a<sub>i</sub> != b<sub>i</sub>

---

![image](https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/Figures/1466/1466-1.png)

1. __Child__: A node that is one edge further away from a given node in a rooted tree. In the above image, nodes ```3```, ```4``` are children of ```1```, which is called the parent. (When we consider ```0``` as the root)
2. __Descendants__: Descendants of a node are children, children of children, and so on. In the above image, nodes ```3, 4, 6, 7, 9``` are all descendants of ```1```.
3. __Subtree__: A subtree of a node ```T``` is a tree ```S``` consisting of a node ```T``` and all of its descendants in ```T```. The subtree corresponding to the root node is the entire tree.

### Depth-First Search


### Breadth-First Search


### Union-Find


