## [1091. Shortest Path in Binary Matrix](https://leetcode.com/problems/shortest-path-in-binary-matrix/)

```Tag```: ```Breadth-First Search``` ```Matrix```

#### Difficulty: Medium

Given an ```n x n``` binary matrix ```grid```, return _the length of the shortest clear path in the matrix_. If there is no clear path, return ```-1```.

A clear path in a binary matrix is a path from the top-left cell (i.e., ```(0, 0)```) to the bottom-right cell (i.e., ```(n - 1, n - 1)```) such that:

- All the visited cells of the path are ```0```.
- All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).

The length of a clear path is the number of visited cells of this path.

![image](https://github.com/quananhle/Python/assets/35042430/8731efb6-b620-45c8-8aa2-e5d046608788)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/18/example1_1.png)
```
Input: grid = [[0,1],[1,0]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/18/example2_1.png)
```
Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
Output: 4
```

__Example 3:__
```
Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
Output: -1
```

__Constraints:__

- ```n == grid.length```
- ```n == grid[i].length```
- ```1 <= n <= 100```
- ```grid[i][j]``` is ```0``` or ```1```

---

