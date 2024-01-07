## [1561. Maximum Number of Coins You Can Get](https://leetcode.com/problems/maximum-number-of-coins-you-can-get)

```Tag```: ```Array & String``` ```Sorting```

#### Difficulty: Medium

There are $3^n$ piles of coins of varying size, you and your friends will take piles of coins as follows:

- In each step, you will choose __any__ ```3``` piles of coins (not necessarily consecutive).
- Of your choice, Alice will pick the pile with the maximum number of coins.
- You will pick the next pile with the maximum number of coins.
- Your friend Bob will pick the last pile.
- Repeat until there are no more piles of coins.

Given an array of integers ```piles``` where ```piles[i]``` is the number of coins in the $i^{th}$ pile.

Return _the maximum number of coins that you can have_.

![image](https://github.com/quananhle/Python/assets/35042430/79e64408-617d-48b9-87dd-961f2faad763)

---

__Example 1:__
```
Input: piles = [2,4,1,2,7,8]
Output: 9
Explanation: Choose the triplet (2, 7, 8), Alice Pick the pile with 8 coins, you the pile with 7 coins and Bob the last one.
Choose the triplet (1, 2, 4), Alice Pick the pile with 4 coins, you the pile with 2 coins and Bob the last one.
The maximum number of coins which you can have are: 7 + 2 = 9.
On the other hand if we choose this arrangement (1, 2, 8), (2, 4, 7) you only get 2 + 4 = 6 coins which is not optimal.
```

__Example 2:__
```
Input: piles = [2,4,5]
Output: 4
```

__Example 3:__
```
Input: piles = [9,8,7,6,5,1,2,3,4]
Output: 18
```

__Constraints:__

- $3 \le piles.length \le 10^5$
- $piles.length % 3 == 0$
- $1 \le piles[i] \le 10^4$

---

### Sorting

```Python
class Solution:
    def maxCoins(self, piles: List[int]) -> int:
        # Time Limit Exceeded
        piles.sort()
        ans = 0

        while piles:
            alice = piles.pop()
            ans += piles.pop()
            piles = piles[1:]

        return ans
```
