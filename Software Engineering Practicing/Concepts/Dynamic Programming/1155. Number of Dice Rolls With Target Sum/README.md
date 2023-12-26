## [1155. Number of Dice Rolls With Target Sum](https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

You have ```n``` dice, and each die has ```k``` faces numbered from ```1``` to ```k```.

Given three integers ```n```, ```k```, and ```target```, return _the number of possible ways (out of the k<sup>n</sup> total ways) to roll the dice, so the sum of the face-up numbers equals ```target```_. Since the answer may be too large, return it modulo 10<sup>9</sup> + 7.

![image](https://github.com/quananhle/Python/assets/35042430/14028776-579f-4bc5-88a1-57362dc17172)

---

__Example 1:__
```
Input: n = 1, k = 6, target = 3
Output: 1
Explanation: You throw one die with 6 faces.
There is only one way to get a sum of 3.
```

__Example 2:__
```
Input: n = 2, k = 6, target = 7
Output: 6
Explanation: You throw two dice, each with 6 faces.
There are 6 ways to get a sum of 7: 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.
```

__Example 3:__
```
Input: n = 30, k = 30, target = 500
Output: 222616187
Explanation: The answer must be returned modulo 109 + 7.
```

__Constraints:__

- $1 \le n, k \le 30$
- $1 \le target \le 1000$

---

### Brute Force

```Python
"""
n = 2, k = 6, target = 7
loop from 1 to k:
    ways += recursion call (1, 6, 6)
        n = 1, k = 6, target = 6
        loop from 1 to k + 1:
            ways += recursion call (0, 6, 5) => 0
            ways += recursion call (0, 6, 4) => 0
            ways += recursion call (0, 6, 3) => 0
            ways += recursion call (0, 6, 2) => 0
            ways += recursion call (0, 6, 1) => 0
            ways += recursion call (0, 6, 0) => 1
        n = 1, k = 6, target = 5
        loop from 1 to k + 1:
            ways += recursion call (0, 6, 4) => 0
            ways += recursion call (0, 6, 3) => 0
            ways += recursion call (0, 6, 2) => 0
            ways += recursion call (0, 6, 1) => 0
            ways += recursion call (0, 6, 0) => 1
            ways += recursion call (0, 6,-1) => 0
        n = 1, k = 6, target = 4
        loop from 1 to k + 1:
            ways += recursion call (0, 6, 3) => 0
            ways += recursion call (0, 6, 2) => 0
            ways += recursion call (0, 6, 1) => 0
            ways += recursion call (0, 6, 0) => 1
            ways += recursion call (0, 6,-1) => 0
            ways += recursion call (0, 6,-2) => 0
        n = 1, k = 6, target = 3
        loop from 1 to k + 1:
            ways += recursion call (0, 6, 2) => 0
            ways += recursion call (0, 6, 1) => 0
            ways += recursion call (0, 6, 0) => 1
            ways += recursion call (0, 6,-1) => 0
            ways += recursion call (0, 6,-2) => 0
            ways += recursion call (0, 6,-3) => 0
        n = 1, k = 6, target = 2
        loop from 1 to k + 1:
            ways += recursion call (0, 6, 1) => 0
            ways += recursion call (0, 6, 0) => 1
            ways += recursion call (0, 6,-1) => 0
            ways += recursion call (0, 6,-2) => 0
            ways += recursion call (0, 6,-3) => 0
            ways += recursion call (0, 6,-4) => 0
        n = 1, k = 6, target = 1
        loop from 1 to k + 1:
            ways += recursion call (0, 6, 0) => 1
            ways += recursion call (0, 6,-1) => 0
            ways += recursion call (0, 6,-2) => 0
            ways += recursion call (0, 6,-3) => 0
            ways += recursion call (0, 6,-4) => 0
            ways += recursion call (0, 6,-5) => 0
"""
```

```Python
class Solution:
    @lru_cache(None)
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        # Brute Force
        MOD = 10**9 + 7
        
        # Base cases:
        if n == 0:
            if target == 0:
                return 1
            else:
                return 0

        ways = 0
        
        for i in range(1, k + 1):
            ways += self.numRollsToTarget(n - 1, k, target - i)

        return ways % MOD
```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

![image](https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/Documents/1155/1155.svg)

```Python
class Solution:
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        MOD = 10**9 + 7
        
        # Top-Down DP (Recursion)
        @functools.lru_cache(maxsize=None)
        def dp(i, current):
            # Base cases
            if i == n:
                if current == target:
                    return 1
                else:
                    return 0

            ways = 0

            for face_value in range(1, k + 1):
                # Recurrence relation
                ways += dp(i + 1, current + face_value) % MOD

            return ways
            
        return dp(0, 0) % MOD
```

```Python
class Solution:
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        MOD = 10**9 + 7
        
        memo = collections.defaultdict(int)

        def dp(i, current):
            # Base cases
            if i == 0:
                if current == 0:
                    return 1
                else:
                    return 0

            if (i, current) in memo:
                return memo[(i, current)]

            for face_value in range(1, k + 1):
                # Recurrence relation
                memo[(i, current)] += dp(i - 1, current - face_value) % MOD

            return memo[(i, current)]

        return dp(n, target) % MOD
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
"""
n = 2, k = 6, target = 7

    0  1  2  3  4  5  6  7
    |  |  |  |  |  |  |  |
0 - 6, 5, 4, 3, 2, 1, 0, 0
1 - 0, 1, 1, 1, 1, 1, 1, 0
2 - 0, 0, 0, 0, 0, 0, 0, 1

"""
```

```Python
class Solution:
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        MOD = 10**9 + 7
        dp = [[0] * (target + 1) for _ in range(n + 1)]

        dp[n][target] = 1

        for i in range(n - 1, -1, -1):
            for j in range(target + 1):
                ways = 0
                for face_value in range(1, min(k, target - j) + 1):
                    ways += dp[i + 1][j + face_value] % MOD
                dp[i][j] = ways

        return dp[0][0] % MOD
```

```Python
"""
n = 2, k = 6, target = 7

[[1, 0, 0, 0, 0, 0, 0, 0], 
 [0, 1, 1, 1, 1, 1, 1, 0], 
 [0, 0, 1, 2, 3, 4, 5, 6]]
"""
```

```Python
class Solution:
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        MOD = 10**9 + 7
        dp = [[0] * (target + 1) for _ in range(n + 1)]

        dp[0][0] = 1

        for i in range(1, n + 1):
            s = dp[i - 1][0]
            for current in range(1, target + 1):
                if current > k:
                    s = (s - dp[i - 1][current - k - 1]) % MOD
                dp[i][current] = s
                s = (s + dp[i - 1][current]) % MOD

        return dp[n][target]
```
