## 305. Number of Islands II

```Tag```: ```Union Find```

#### Difficulty: Hard

You are given an empty 2D binary grid ```grid``` of size ```m x n```. The grid represents a map where ```0```'s represent water and ```1```'s represent land. Initially, all the cells of ```grid``` are water cells (i.e., all the cells are ```0```'s).

We may perform an add land operation which turns the water at position into a land. You are given an array ```positions``` where ```positions[i]``` = [r<sub>i</sub>, c<sub>i</sub>] is the position (r<sub>i</sub>, c<sub>i</sub>) at which we should operate the i<sup>th</sup> operation.

Return _an array of integers ```answer``` where ```answer[i]``` is the number of islands after turning the cell (r<sub>i</sub>, c<sub>i</sub>) into a land_.

An __island__ is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

![image](https://user-images.githubusercontent.com/35042430/219112320-d54acf3b-e753-4149-afd8-18af4b9c53c7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/10/tmp-grid.jpg)
```
Input: m = 3, n = 3, positions = [[0,0],[0,1],[1,2],[2,1]]
Output: [1,1,2,3]
Explanation:
Initially, the 2d grid is filled with water.
- Operation #1: addLand(0, 0) turns the water at grid[0][0] into a land. We have 1 island.
- Operation #2: addLand(0, 1) turns the water at grid[0][1] into a land. We still have 1 island.
- Operation #3: addLand(1, 2) turns the water at grid[1][2] into a land. We have 2 islands.
- Operation #4: addLand(2, 1) turns the water at grid[2][1] into a land. We have 3 islands.
```

__Example 2:__
```
Input: m = 1, n = 1, positions = [[0,0]]
Output: [1]
```

__Constraints:__

- ```1 <= m, n, positions.length <= 10^4```
- ```1 <= m * n <= 10^4```
- ```positions[i].length == 2```
- 0 <= r<sub>i</sub> < m
- 0 <= c<sub>i</sub> < n
 
---

__Follow up:__ Could you solve it in time complexity ```O(k log(mn))```, where ```k == positions.length```?
