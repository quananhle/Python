## [1406. Stone Game III](https://leetcode.com/problems/stone-game-iii)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Alice and Bob continue their games with piles of stones. There are several stones arranged in a row, and each stone has an associated value which is an integer given in the array ```stoneValue```.

Alice and Bob take turns, with Alice starting first. On each player's turn, that player can take ```1```, ```2```, or ```3``` stones from the __first__ remaining stones in the row.

The score of each player is the sum of the values of the stones taken. The score of each player is ```0``` initially.

The objective of the game is to end with the highest score, and the winner is the player with the highest score and there could be a tie. The game continues until all the stones have been taken.

Assume Alice and Bob play optimally.

Return _```"Alice"``` if Alice will win, ```"Bob"``` if Bob will win, or ```"Tie"``` if they will end the game with the same score_.

![image](https://github.com/quananhle/Python/assets/35042430/943e9beb-7b14-4aa2-bf3d-2406abda55e1)

---

__Example 1:__
```
Input: values = [1,2,3,7]
Output: "Bob"
Explanation: Alice will always lose. Her best move will be to take three piles and the score become 6. Now the score of Bob is 7 and Bob wins.
```

__Example 2:__
```
Input: values = [1,2,3,-9]
Output: "Alice"
Explanation: Alice must choose all the three piles at the first move to win and leave Bob with negative score.
If Alice chooses one pile her score will be 1 and the next move Bob's score becomes 5. In the next move, Alice will take the pile with value = -9 and lose.
If Alice chooses two piles her score will be 3 and the next move Bob's score becomes 3. In the next move, Alice will take the pile with value = -9 and also lose.
Remember that both play optimally so here Alice will choose the scenario that makes her win.
```

__Example 3:__
```
Input: values = [1,2,3,6]
Output: "Tie"
Explanation: Alice cannot win this game. She can end the game in a draw if she decided to choose all the first three piles, otherwise she will lose.
```

__Constraints:__

- ```1 <= stoneValue.length <= 5 * 10^4```
- ```-1000 <= stoneValue[i] <= 1000```

---

### The Framework

#### Top-Down Dynamic Programming

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(n)```

```Python
class Solution:
    def stoneGameIII(self, stoneValue: List[int]) -> str:
        n = len(stoneValue)
        if n <= 3 and sum(stoneValue) > 0:
            return "Alice"

        memo = collections.defaultdict(default=sys.maxsize)

        def dp(curr):
            # Base case
            if curr == n:
                return 0

            if curr in memo:
                return memo[curr]
            
            # Recurrence relation: take 1 or 2 or 3 stones?

            # Check if taking 1 stone is possible
            if curr + 1 <= n:
                memo[curr] = stoneValue[curr] - dp(curr + 1)

            # Check if taking 2 stones is possible 
            if curr + 2 <= n:
                memo[curr] = max(memo[curr], stoneValue[curr] + stoneValue[curr + 1] - dp(curr + 2))

            # Check if taking 3 stones is possble
            if curr + 3 <= n:
                memo[curr] = max(memo[curr], stoneValue[curr] + stoneValue[curr + 1] + stoneValue[curr + 2] - dp(curr + 3))
            
            return memo[curr]

        ans = dp(0)
        if ans > 0:
            return "Alice"
        elif ans < 0:
            return "Bob"
        else:
            return "Tie"
```

```Python
class Solution:
    def stoneGameIII(self, stoneValue: List[int]) -> str:
        n = len(stoneValue)
        if n <= 3 and sum(stoneValue) > 0:
            return "Alice"

        memo = [float('inf')] * (n + 1)

        def dp(curr):
            # Base case
            if curr == n:
                return 0
            if memo[curr] != float('inf'):
                return memo[curr]

            
            # Recurrence relation: take 1 or 2 or 3 stones?

            # Check if taking 1 stone is possible
            if curr + 1 <= n:
                memo[curr] = stoneValue[curr] - dp(curr + 1)

            # Check if taking 2 stones is possible 
            if curr + 2 <= n:
                memo[curr] = max(memo[curr], stoneValue[curr] + stoneValue[curr + 1] - dp(curr + 2))

            # Check if taking 3 stones is possble
            if curr + 3 <= n:
                memo[curr] = max(memo[curr], stoneValue[curr] + stoneValue[curr + 1] + stoneValue[curr + 2] - dp(curr + 3))
            
            return memo[curr]

        ans = dp(0)
        if ans > 0:
            return "Alice"
        elif ans < 0:
            return "Bob"
        else:
            return "Tie"
```

```Python
class Solution:
    def stoneGameIII(self, stoneValue: List[int]) -> str:
        n = len(stoneValue)
        if n <= 3 and sum(stoneValue) > 0:
            return "Alice"

        @lru_cache(None)
        def dp(curr):
            # Base case
            if curr == n:
                return 0
            
            if curr + 1 <= n:
                ans = stoneValue[curr] - dp(curr + 1)

            if curr + 2 <= n:
                ans = max(ans, stoneValue[curr] + stoneValue[curr + 1] - dp(curr + 2))

            if curr + 3 <= n:
                ans = max(ans, stoneValue[curr] + stoneValue[curr + 1] + stoneValue[curr + 2] - dp(curr + 3))
            
            return ans

        ans = dp(0)
        if ans > 0:
            return "Alice"
        elif ans < 0:
            return "Bob"
        else:
            return "Tie"
```

#### Bottom-Up Dynamic Programming

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(n)```

```Python
class Solution:
    def stoneGameIII(self, stoneValue: List[int]) -> str:
        n = len(stoneValue)
        if n <= 3 and sum(stoneValue) > 0:
            return "Alice"

        dp = collections.defaultdict(int)

        for curr in range(n - 1, -1, -1):
            if curr + 1 <= n:
                dp[curr] = stoneValue[curr] - dp[curr + 1]
            if curr + 2 <= n:
                dp[curr] = max(dp[curr], sum(stoneValue[curr:curr+2]) - dp[curr + 2])
            if curr + 3 <= n:
                dp[curr] = max(dp[curr], sum(stoneValue[curr:curr+3]) - dp[curr + 3])

        if dp[0] > 0:
            return "Alice"
        elif dp[0] < 0:
            return "Bob"
        else:
            return "Tie"
```

#### Space Complexity Optimized Bottom-Up Dynamic Programming

To solve the problem with ```O(1)``` space complexity, we can use the observation that we only ever need the values $dp[i+1]$, $dp[i+2]$, and $dp[i+3]$ to calculate $dp[i]$. Therefore, we only need to keep track of the current and the next three values of $dp$.

```Python
class Solution:
    def stoneGameIII(self, stoneValue: List[int]) -> str:
        n = len(stoneValue)
        if n <= 3 and sum(stoneValue) > 0:
            return "Alice"

        dp = collections.defaultdict(int)

        for curr in range(n - 1, -1, -1):
            if curr + 1 <= n:
                dp[curr % 4] = stoneValue[curr] - dp[(curr + 1) % 4]
            if curr + 2 <= n:
                dp[curr % 4] = max(dp[curr % 4], sum(stoneValue[curr:curr+2]) - dp[(curr + 2) % 4])
            if curr + 3 <= n:
                dp[curr % 4] = max(dp[curr % 4], sum(stoneValue[curr:curr+3]) - dp[(curr + 3) % 4])

        if dp[0] > 0:
            return "Alice"
        elif dp[0] < 0:
            return "Bob"
        else:
            return "Tie"
```
