## [1140. Stone Game II](https://leetcode.com/problems/stone-game-ii/)

```Tag```: ```Dynamic Programming``` ```Math``` ```Game Theory```

#### Difficulty: Medium

Alice and Bob continue their games with piles of stones.  There are a number of piles arranged in a row, and each pile has a positive integer number of stones ```piles[i]```.  The objective of the game is to end with the most stones. 

Alice and Bob take turns, with Alice starting first.  Initially, ```M = 1```.

On each player's turn, that player can take all the stones in the first ```X``` remaining piles, where ```1 <= X <= 2M```.  Then, we set ```M = max(M, X)```.

The game continues until all the stones have been taken.

Assuming Alice and Bob play optimally, return _the maximum number of stones Alice can get_.

![image](https://github.com/quananhle/Python/assets/35042430/5bbe31d9-9e31-4978-9354-20eebe26e4c1)

---

__Example 1:__
```
Input: piles = [2,7,9,4,4]
Output: 10
Explanation:  If Alice takes one pile at the beginning, Bob takes two piles, then Alice takes 2 piles again. Alice can get 2 + 4 + 4 = 10 piles in total. If Alice takes two piles at the beginning, then Bob can take all three piles left. In this case, Alice get 2 + 7 = 9 piles in total. So we return 10 since it's larger.
```

__Example 2:__
```
Input: piles = [1,2,3,4,5,100]
Output: 104
```

__Constraints:__

- ```1 <= piles.length <= 100```
- ```1 <= piles[i] <= 10^4```

---

### The Framwork

#### Top-Down Dynamic Programming

```Python
class Solution:
    def stoneGameII(self, piles: List[int]) -> int:
        n = len(piles)

        @lru_cache(None)
        def dp(curr, turn, total):
            # Base case: no more stones to get
            if curr == n:
                return 0
            
            ans = 0
            taken = 0

            # Recurrence relation: take 1 stone or more than 1 stone but no more than 2*M from the current position
            # However, 2 * M from the current position may exceed the size of piles; hence, use min() to get max limit
            for i in range(curr, min(curr + 2 * turn, n)):
                # Take this pile of stones
                taken += piles[i]
                # Move on to the next position, with new M = max(X, M), where X is the current position + 1
                ans = max(ans, total - dp(i + 1, max(turn, i - curr + 1), total - taken))

            return ans

        return dp(0, 1, sum(piles))
```

