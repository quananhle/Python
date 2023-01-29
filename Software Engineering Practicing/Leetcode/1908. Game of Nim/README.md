## 1908. Game of Nim

```Tag```: ```Dynamic Programming``` ```Bit Manipulation```

#### Difficulty: Medium

Alice and Bob take turns playing a game with __Alice starting first__.

In this game, there are ```n``` piles of stones. On each player's turn, the player should remove any positive number of stones from a non-empty pile __of his or her choice__. The first player who cannot make a move loses, and the other player wins.

Given an integer array ```piles```, where ```piles[i]``` is the number of stones in the i<sup>th</sup> pile, return _```true``` if Alice wins, or ```false``` if Bob wins_.

Both Alice and Bob play __optimally__.

---

__Example 1:__
```
Input: piles = [1]
Output: true
Explanation: There is only one possible scenario:
- On the first turn, Alice removes one stone from the first pile. piles = [0].
- On the second turn, there are no stones left for Bob to remove. Alice wins.
```

__Example 2:__
```
Input: piles = [1,1]
Output: false
Explanation: It can be proven that Bob will always win. One possible scenario is:
- On the first turn, Alice removes one stone from the first pile. piles = [0,1].
- On the second turn, Bob removes one stone from the second pile. piles = [0,0].
- On the third turn, there are no stones left for Alice to remove. Bob wins.
```

__Example 3:__
```
Input: piles = [1,2,3]
Output: false
Explanation: It can be proven that Bob will always win. One possible scenario is:
- On the first turn, Alice removes three stones from the third pile. piles = [1,2,0].
- On the second turn, Bob removes one stone from the second pile. piles = [1,1,0].
- On the third turn, Alice removes one stone from the first pile. piles = [0,1,0].
- On the fourth turn, Bob removes one stone from the second pile. piles = [0,0,0].
- On the fifth turn, there are no stones left for Alice to remove. Bob wins.
```

__Constraints:__

- ```n == piles.length```
- ```1 <= n <= 7```
- ```1 <= piles[i] <= 7```
 
---

### Memoization

```Python
class Solution:
    def nimGame(self, piles: List[int]) -> bool:
        memo = collections.defaultdict()
        if sum(piles) == 0:
            return False

        def moves(piles):
            # Generate a key by concatenating the count of the stone in every pile
            key = "-".join(map(str, piles))
            # Check if this scenario has been come accross
            if key in memo:
                return memo[key]
            for i in range(len(piles)):
                # Check the stones in the pile
                for j in range(1, piles[i] + 1):
                    # Remove 1 stone from current pile[i]
                    piles[i] -= j
                    # Get all the possible next moves from here on out
                    next = sorted(piles)
                    # Check if there is no next possible move for opponent, win
                    if not moves(next):
                        memo[key] = True
                        return True
                    # Backtracking
                    piles[i] += j
            # All scenarios have been checked and no possible move next, lose
            memo[key] = False
            return False
```

__Follow-up__: Could you find a linear time solution? Although the linear time solution may be beyond the scope of an interview, it could be interesting to know.
