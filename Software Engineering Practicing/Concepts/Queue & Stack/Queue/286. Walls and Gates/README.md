## 286. Walls and Gates

```Tag```: ```Queue``` ```Breadth-First Search``` ```BFS```

#### Difficulty: Medium

You are given an ```m x n``` grid ```rooms``` initialized with these three possible values.

- ```-1``` A wall or an obstacle.
- ```0``` A gate.
- ```INF``` Infinity means an empty room. We use the value 2<sup>31</sup> - 1 = ```2147483647``` to represent ```INF``` as you may assume that the distance to a gate is less than ```2147483647```.

Fill each empty room with the distance to its _nearest gate_. If it is impossible to reach a gate, it should be filled with ```INF```.

![image](https://user-images.githubusercontent.com/35042430/208265729-88eaf4b6-a639-43ae-a638-8050e64bfa9e.png) 

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/03/grid.jpg)

Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]

__Example 2:__

```
Input: rooms = [[-1]]
Output: [[-1]]
```

__Constraints:__

```
m == rooms.length
n == rooms[i].length
1 <= m, n <= 250
rooms[i][j] is -1, 0, or 231 - 1.
```
---


For shortest-path problems:
- If graph weights are __equal__: ```Bellman-Ford```, ```Dijkstra's algorithms``` and ```BFS traversal``` are all solutions but the ```BFS``` is the most efficient
- If graph weights are different and all are __positive__: ```Bellman-Ford``` and ```Dijkstra's algorithms``` are solutions but the ```Dijkstra's``` is the most efficient
- If graph weights are different and could be __positive/negative__: ```Bellman-Ford``` algorithms is the only solution betweem the 3 algorithm mentioned here.


