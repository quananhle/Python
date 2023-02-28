## [790. Domino and Tromino Tiling](https://leetcode.com/problems/domino-and-tromino-tiling/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

You have two types of tiles: a ```2 x 1``` domino shape and a tromino shape. You may rotate these shapes.

![image](https://assets.leetcode.com/uploads/2021/07/15/lc-domino.jpg)

Given an integer ```n```, return _the number of ways to tile an ```2 x n``` board_. Since the answer may be very large, return it modulo 10<sup>9</sup> + 7_.

In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.

![image](https://user-images.githubusercontent.com/35042430/221771308-61e31597-bea4-4bf4-920c-503a8ba71e30.png)

---

__Example 1__:


![image](https://assets.leetcode.com/uploads/2021/07/15/lc-domino1.jpg)
```
Input: n = 3
Output: 5
Explanation: The five different ways are show above.
```

__Example 2:__
```
Input: n = 1
Output: 1
```

__Constraints:__

- ```1 <= n <= 1000```

---

