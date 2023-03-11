## [994. Rotting Oranges](https://leetcode.com/problems/rotting-oranges/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Recursion```

#### Difficulty: Medium

You are given an ```m x n``` ```grid``` where each cell can have one of three values:

- ```0``` representing an empty cell,
- ```1``` representing a fresh orange, or
- ```2``` representing a rotten orange.

Every minute, any fresh orange that is __4-directionally adjacent__ to a rotten orange becomes rotten.

Return _the minimum number of minutes that must elapse until no cell has a fresh orange_. If this is impossible, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/224512344-038804b7-20a9-4b0b-8724-1163dc2234bd.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/02/16/oranges.png)
```
Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
Output: 4
```

__Example 2:__
```
Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
```

__Example 3:__
```
Input: grid = [[0,2]]
Output: 0
Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.
```

__Constraints:__

- ```m == grid.length```
- ```n == grid[i].length```
- ```1 <= m, n <= 10```
- ```grid[i][j]``` is ```0```, ```1```, or ```2```.

---

### Breath-First Search

```Python

```
