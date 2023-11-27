## [935. Knight Dialer](https://leetcode.com/problems/knight-dialer)

```Tag```:

#### Difficulty: Medium

The chess knight has a unique movement, it may move two squares vertically and one square horizontally, or two squares horizontally and one square vertically (with both forming the shape of an L). The possible movements of chess knight are shown in this diagaram:

![image](https://assets.leetcode.com/uploads/2020/08/18/chess.jpg)
A chess knight can move as indicated in the chess diagram below:

![image](https://assets.leetcode.com/uploads/2020/08/18/phone.jpg)
We have a chess knight and a phone pad as shown below, the knight can only stand on a numeric cell (i.e. blue cell).

Given an integer ```n```, return _how many distinct phone numbers of length n we can dial_.

You are allowed to place the knight on any numeric cell initially and then you should perform ```n - 1``` jumps to dial a number of length n. All jumps should be valid knight jumps.

As the answer may be very large, return the answer modulo $10^9 + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/7db2bb48-fece-4bde-9505-58f10140b019)

---

__Example 1:__

Input: n = 1
Output: 10
Explanation: We need to dial a number of length 1, so placing the knight over any numeric cell of the 10 cells is sufficient.
Example 2:

Input: n = 2
Output: 20
Explanation: All the valid number we can dial are [04, 06, 16, 18, 27, 29, 34, 38, 40, 43, 49, 60, 61, 67, 72, 76, 81, 83, 92, 94]
Example 3:

Input: n = 3131
Output: 136006598
Explanation: Please take care of the mod.
 

Constraints:

1 <= n <= 5000

---
