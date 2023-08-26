## [97. Interleaving String](https://leetcode.com/problems/interleaving-string/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

Given strings ```s1```, ```s2```, and ```s3```, find whether ```s3``` is formed by an interleaving of ```s1``` and ```s2```.

An interleaving of two strings ```s``` and ```t``` is a configuration where ```s``` and ```t``` are divided into ```n``` and ```m``` substrings respectively, such that:

- ```s``` = s<sub>1</sub> + s<sub>2</sub> + ... + s<sub>n</sub>
- ```t``` = t<sub>1</sub> + t<sub>2</sub> + ... + t<sub>m</sub>
- ```|n - m| <= 1```
- The interleaving is s<sub>1</sub> + t<sub>1</sub> + s<sub>2</sub> + t<sub>2</sub> + s<sub>3</sub> + t<sub>3</sub> + ... or t<sub>1</sub> + s<sub>1</sub> + t<sub>2</sub> + s<sub>2</sub> + t<sub>3</sub> + s<sub>3</sub> + ...

Note: ```a + b``` is the concatenation of strings ```a``` and ```b```.

![image](https://user-images.githubusercontent.com/35042430/222198491-62aae9c0-6fdb-43bf-ab8f-a90a9dbf6942.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/02/interleave.jpg)
```
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
Output: true
Explanation: One way to obtain s3 is:
Split s1 into s1 = "aa" + "bc" + "c", and s2 into s2 = "dbbc" + "a".
Interleaving the two splits, we get "aa" + "dbbc" + "bc" + "a" + "c" = "aadbbcbcac".
Since s3 can be obtained by interleaving s1 and s2, we return true.
```

__Example 2:__
```
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
Output: false
Explanation: Notice how it is impossible to interleave s2 with any other string to obtain s3.
```

__Example 3:__
```
Input: s1 = "", s2 = "", s3 = ""
Output: true
```

__Constraints:__

- ```0 <= s1.length, s2.length <= 100```
- ```0 <= s3.length <= 200```
- ```s1```, ```s2```, and ```s3``` consist of lowercase English letters.
 
---

### Brute Force (Recursion)

```Python
class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        # Brute Force
        if len(s1) + len(s2) != len(s3):
            return False

        def dfs(i, j):
            # Base case
            if i == len(s1) and j == len(s2):
                return True
            
            choose_s1, choose_s2 = False, False
            if i < len(s1) and s1[i] == s3[i + j]:
                choose_s1 = dfs(i + 1, j)
            if j < len(s2) and s2[j] == s3[i + j]:
                choose_s2 = dfs(i, j + 1)

            return choose_s1 or choose_s2
        
        return dfs(0, 0)
```

---

### The Framework

#### Top-Down Dynamic Programming

- Time Complexity: ```O(m * n)```
- Space Complexity: ```O(m * n)```

```Python
class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        # Brute Force
        if len(s1) + len(s2) != len(s3):
            return False

        @lru_cache(None
        def dp(i, j):
            # Base case
            if i == len(s1) and j == len(s2):
                return True
            
            choose_s1, choose_s2 = False, False
            if i < len(s1) and s1[i] == s3[i + j]:
                choose_s1 = dp(i + 1, j)
            if j < len(s2) and s2[j] == s3[i + j]:
                choose_s2 = dp(i, j + 1)

            return choose_s1 or choose_s2
        
        return dfs(0, 0)
```

```Python
class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        n, m = len(s1), len(s2)

        if n + m != len(s3):
            return False

        memo = collections.defaultdict(int)

        def dp(i, j):
            # Base case
            if i == len(s1) and j == len(s2):
                return True
            
            if (i, j) in memo:
                return memo[(i, j)]

            path1, path2 = False, False
            if i < len(s1) and s1[i] == s3[i + j]:
                path1 = dp(i + 1, j)
            if j < len(s2) and s2[j] == s3[i + j]:
                path2 = dp(i, j + 1)

            memo[(i, j)] = path1 or path2
            return path1 or path2
        
        return dp(0, 0
```

```Python
class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        m, n, l = len(s1), len(s2), len(s3)

        if m + n != l:
            return False
        
        @lru_cache(maxsize=None)
        def dp(i, j, k):
            # Base case
            if i == m:
                return s2[j:] == s3[k:]
            if j == n:
                return s1[i:] == s3[k:]

            if (s1[i] == s3[k] and dp(i + 1, j, k + 1)) or (s2[j] == s3[k] and dp(i, j + 1, k + 1)):
                return True
            
            return False
        
        return dp(0, 0, 0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        n, m = len(s1), len(s2)
        if m + n != len(s3):
            return False
        
        dp = [[False] * (m + 1) for _ in range(n + 1)]
        dp[0][0] = True

        for i in range(1, n + 1):
            dp[i][0] = dp[i - 1][0] and s1[i - 1] == s3[i - 1]
        for j in range(1, m + 1):
            dp[0][j] = dp[0][j - 1] and s2[j - 1] == s3[j - 1]

        for i in range(1, n + 1):
            for j in range(1, m + 1):
                path1, path2 = False, False

                if s1[i - 1] == s3[i + j - 1]:
                    path1 = dp[i - 1][j]
                if s2[j - 1] == s3[i + j - 1]:
                    path2 = dp[i][j - 1]

                dp[i][j] = path1 or path2

        return dp[n][m]
```

__Follow up__: Could you solve it using only ```O(s2.length)``` additional memory space?

#### Optimized Space Bottom-Up Dynamic Programming

- Time Complexity: ```O(m * n)```
- Space Complexity: ```O(min(m, n))```

```Python
class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        m, n = len(s1), len(s2)

        if m + n != len(s3):
            return False

        if n > m:
            m, n = n, m
            s1, s2 = s2, s1

        dp = [False] * (n + 1)
        dp[0] = True

        for j in range(1, n + 1):
            dp[j] = dp[j - 1] and s2[j - 1] == s3[j - 1]

        for i in range(1, m + 1):
            dp[0] = dp[0] and s1[i - 1] == s3[i - 1]
            for j in range(1, n + 1):
                path1, path2 = False, False

                if s1[i - 1] == s3[i + j - 1]:
                    path1 = dp[j]
                if s2[j - 1] == s3[i + j - 1]:
                    path2 = dp[j - 1]

                dp[j] = path1 or path2

        return dp[-1]
```
