## [712. Minimum ASCII Delete Sum for Two Strings](https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

Given two strings ```s1``` and ```s2```, return _the lowest __ASCII__ sum of deleted characters to make two strings equal_.

---

__Example 1:__
```
Input: s1 = "sea", s2 = "eat"
Output: 231
Explanation: Deleting "s" from "sea" adds the ASCII value of "s" (115) to the sum.
Deleting "t" from "eat" adds 116 to the sum.
At the end, both strings are equal, and 115 + 116 = 231 is the minimum sum possible to achieve this.
```

__Example 2:__
```
Input: s1 = "delete", s2 = "leet"
Output: 403
Explanation: Deleting "dee" from "delete" to turn the string into "let",
adds 100[d] + 101[e] + 101[e] to the sum.
Deleting "e" from "leet" adds 101[e] to the sum.
At the end, both strings are equal to "let", and the answer is 100+101+101+101 = 403.
If instead we turned both strings into "lee" or "eet", we would get answers of 433 or 417, which are higher.
```

__Constraints:__

- $1 \le s1.length, s2.length \le 1000$
- ```s1``` and ```s2``` consist of lowercase English letters.

---

### Recursion (Time Limit Exceeded)

__Complexity Analysis__

Let ```s``` be the longer string between ```s1``` and ```s2```. Let ```K``` be the length of ```s```.

- __Time Complexity__: $mathcal{O}(3^{K} \cdot K)$.
- __Space Complexity__: $mathcal{O}(K)$.

```Python
class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        m, n = len(s1), len(s2)

        def helper(i, j):
            # Check if s1 is empty, delete all character in s2
            if i < 0:
                cost = 0
                for curr in range(j + 1):
                    cost += ord(s2[curr])
                return cost
            
            # Check if s2 is empty, delete all character in s1
            if j < 0:
                cost = 0
                for curr in range(i + 1):
                    cost += ord(s1[curr])
                return cost
            
            # Compare s1 and s2: matching or not matching character
            # Matching: skip, no deletion required
            if s1[i] == s2[j]:
                return helper(i - 1, j - 1)
            # Not matching: get the lowest cost from deleting character in s1 or s2 or both
            else:
                return min(ord(s1[i]) + helper(i - 1, j), ord(s2[j]) + helper(i, j - 1), ord(s1[i]) + ord(s2[j]) + helper(i - 1, j - 1))
            
        return helper(m - 1, n - 1)

```

---

### The Framework

#### Top-Down Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $mathcal{O}(M \cdot N)$.
- __Space Complexity__: $mathcal{O}(M \cdot N)$.

```Python
class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        m, n = len(s1), len(s2)
        memo = collections.defaultdict(int)
        
        def dp(i, j):
            # Base case
            if i == m and j == n:
                return 0

            if (i, j) in memo:
                return memo[(i, j)]
            
            # Recurrence relation: matching or not matching character to delete

            # Check if one string is already empty, delete the entire other string
            if i > m - 1:
                memo[(i, j)] = ord(s2[j]) + dp(i, j + 1)
                return memo[(i, j)]
            if j > n - 1:
                memo[(i, j)] = ord(s1[i]) + dp(i + 1, j)
                return memo[(i, j)]
            
            # Matching: no action required, move on to the next characters in both strings
            if s1[i] == s2[j]:
                memo[(i, j)] = dp(i + 1, j + 1)
            # Not matching: delete character in s1 or delete character in s2 will yield the lowest cost?
            else:
                memo[(i, j)] = min(ord(s1[i]) + dp(i + 1, j), ord(s2[j]) + dp(i, j + 1))

            return memo[(i, j)]
        
        return dp(0, 0)
```

```Python
class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        m, n = len(s1), len(s2)
        memo = collections.defaultdict(int)
        
        def dp(i, j):
            # Base case
            if i == -1 and j == -1:
                return 0

            if (i, j) in memo:
                return memo[(i, j)]
            
            # Recurrence relation: matching or not matching character to delete

            # Check if one string is already empty, delete the entire other string
            if i < 0:
                memo[(i, j)] = ord(s2[j]) + dp(i, j - 1)
                return memo[(i, j)]
            if j < 0:
                memo[(i, j)] = ord(s1[i]) + dp(i - 1, j)
                return memo[(i, j)]
            
            # Matching
            if s1[i] == s2[j]:
                memo[(i, j)] = dp(i - 1, j - 1)
            # Not matching: delete character in s1 or delete character in s2 will yield the lowest cost?
            else:
                memo[(i, j)] = min(ord(s1[i]) + dp(i - 1, j), ord(s2[j]) + dp(i, j - 1))

            return memo[(i, j)]
        
        return dp(m - 1, n - 1)
```

```Python
class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        m, n = len(s1), len(s2)

        @lru_cache(maxsize=None)
        def dp(i, j):
            # Base case
            if i == m and j == n:
                return 0
            
            # Recurrence relation
            if i > m - 1:
                ans = ord(s2[j]) + dp(i, j + 1)
                return ans
            if j > n - 1:
                ans = ord(s1[i]) + dp(i + 1, j)
                return ans
            
            if s1[i] == s2[j]:
                ans = dp(i + 1, j + 1)
            else:
                ans = min(ord(s1[i]) + dp(i + 1, j), ord(s2[j]) + dp(i, j + 1))

            return ans
        
        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        m, n = len(s1), len(s2)
        dp = [[0] * (n + 1) for _ in range(m + 1)]

        for i in range(1, m + 1):
            dp[i][0] = dp[i - 1][0] + ord(s1[i - 1])
        for j in range(1, n + 1):
            dp[0][j] = dp[0][j - 1] + ord(s2[j - 1])
        
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                # Matching
                if s1[i - 1] == s2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                # Not matching
                else:
                    dp[i][j] = min(ord(s1[i - 1]) + dp[i - 1][j], ord(s2[j - 1]) + dp[i][j - 1])
        
        return dp[m][n]
```

#### Space-Optimized Dynamic Programming

```Python
class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        if len(s1) < len(s2):
            return self.minimumDeleteSum(s2, s1)
    
        m, n = len(s1), len(s2)
        dp = [0] * (n + 1)
        for j in range(1, n + 1):
            dp[j] = dp[j - 1] + ord(s2[j - 1])
        
        for i in range(1, m + 1):
            tmp = dp[0]
            dp[0] += ord(s1[i - 1])
        
            for j in range(1, n + 1):
                if s1[i - 1] == s2[j - 1]:
                    cost = tmp
                else:
                    cost = min(ord(s1[i - 1]) + dp[j], ord(s2[j - 1]) + dp[j - 1])
                tmp = dp[j]
                dp[j] = cost
            
        return dp[-1]
```
