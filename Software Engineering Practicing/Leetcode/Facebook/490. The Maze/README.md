## [490. The Maze](https://leetcode.com/problems/the-maze/)

```Tag```:

#### Difficulty: Medium

There is a ball in a ```maze``` with empty spaces (represented as ```0```) and walls (represented as ```1```). The ball can go through the empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

Given the ```m x n``` maze, the ball's ```start``` position and the destination, where ```start = [startrow, startcol]``` and ```destination = [destinationrow, destinationcol]```, return _```true``` if the ball can stop at the destination, otherwise return ```false```_.

You may assume that the borders of the maze are all walls (see examples).

![image](https://github.com/quananhle/Python/assets/35042430/ed21f4cf-006f-4ff9-9db1-902c1bad57eb)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/31/maze1-1-grid.jpg)
```
Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
Output: true
Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/31/maze1-2-grid.jpg)
```
Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [3,2]
Output: false
Explanation: There is no way for the ball to stop at the destination. Notice that you can pass through the destination but you cannot stop there.
```

__Example 3:__
```
Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
Output: false
```

__Constraints:__

- $m == maze.length$
- $n == maze[i].length$
- $1 \le m, n \le 100$
- $maze[i][j] is 0 or 1$.
- $start.length == 2$
- $destination.length == 2$
- $0 \le startrow, destinationrow \le m$
- $0 \le startcol, destinationcol \le n$
- Both the ```ball``` and the ```destination``` exist in an empty space, and they will not be in the same position initially.
- The maze contains at least ```2``` empty spaces.

---
