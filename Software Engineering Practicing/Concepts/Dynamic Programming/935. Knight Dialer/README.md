## [935. Knight Dialer](https://leetcode.com/problems/knight-dialer)

```Tag```: ```Dynamic Programming``` ```Math```

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
```
Input: n = 1
Output: 10
Explanation: We need to dial a number of length 1, so placing the knight over any numeric cell of the 10 cells is sufficient.
```

__Example 2:__
```
Input: n = 2
Output: 20
Explanation: All the valid number we can dial are [04, 06, 16, 18, 27, 29, 34, 38, 40, 43, 49, 60, 61, 67, 72, 76, 81, 83, 92, 94]
```

__Example 3:__
```
Input: n = 3131
Output: 136006598
Explanation: Please take care of the mod.
```

__Constraints:__

- $1 \le n \le 5000$

---

|From|	Can Jump To|
|--|--|
|0	|4, 6|
|1	|6, 8|
|2	|7, 9|
|3	|4, 8|
|4	|3, 9, 0|
|5	||
|6	|1, 7, 0|
|7	|2, 6|
|8	|1, 3|
|9	|2, 4|

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

```Python

```

```Python
class Solution:
    def knightDialer(self, n: int) -> int:
        jumps = [
            [4, 6],
            [6, 8],
            [7, 9],
            [4, 8],
            [3, 9, 0],
            [],
            [1, 7, 0],
            [2, 6],
            [1, 3],
            [2, 4]
        ]

        ans = 0
        MOD = 10**9 + 7

        @functools.lru_cache(maxsize=None)
        def dp(curr_cell, curr):
            # Base case
            if curr == n:
                return 1
            
            # DP Transitions:
            ans = 0
            for next_cell in jumps[curr_cell]:
                ans = (ans + dp(next_cell, curr + 1)) % MOD
            
            return ans
                
        for cell in range(10):
            ans = (ans + dp(cell, 1)) % MOD

        return ans
```

#### Bottom-Up Dynamic Programming

```Python

```

#### Space-Optimized Bottom-Up Dynamic Programming

```Python

```
