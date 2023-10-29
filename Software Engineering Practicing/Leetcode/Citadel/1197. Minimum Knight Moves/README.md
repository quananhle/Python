## [1197. Minimum Knight Moves](https://leetcode.com/problems/minimum-knight-moves)

```Tag```: ```Breadth-First Search``` ```Djikstra's Algorithm``` ```Depth-First Search``` ```Dynamic Programming```

#### Difficulty: Medium

In an __infinite__ chess board with coordinates from ```-infinity``` to ```+infinity```, you have a __knight__ at square ```[0, 0]```.

A knight has ```8``` possible moves it can make, as illustrated below. Each move is two squares in a cardinal direction, then one square in an orthogonal direction.

![image](https://assets.leetcode.com/uploads/2018/10/12/knight.png)

Return _the minimum number of steps needed to move the knight to the square ```[x, y]```. It is guaranteed the answer exists__.

![image](https://github.com/quananhle/Python/assets/35042430/095d0bf8-6807-492a-bb18-f865a8012fa8)

---

Example 1:

Input: x = 2, y = 1
Output: 1
Explanation: [0, 0] → [2, 1]
Example 2:

Input: x = 5, y = 5
Output: 4
Explanation: [0, 0] → [2, 1] → [4, 2] → [3, 4] → [5, 5]
 

Constraints:

-300 <= x, y <= 300
0 <= |x| + |y| <= 300

---
