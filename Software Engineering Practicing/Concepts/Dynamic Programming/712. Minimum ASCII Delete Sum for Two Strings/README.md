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

### Recursion

```Python

```

---

### The Framework

```Python

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
