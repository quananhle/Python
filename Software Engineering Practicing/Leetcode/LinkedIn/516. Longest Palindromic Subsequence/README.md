## [516. Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a string ```s```, find the longest palindromic subsequence's length in ```s```.

A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

![image](https://user-images.githubusercontent.com/35042430/232164473-a3479acf-1cf1-41a7-89bb-a8bd6414aeaf.png)

---

__Example 1:__
```
Input: s = "bbbab"
Output: 4
Explanation: One possible longest palindromic subsequence is "bbbb".
```

__Example 2:__
```
Input: s = "cbbd"
Output: 2
Explanation: One possible longest palindromic subsequence is "bb".
```

__Constraints:__

- ```1 <= s.length <= 1000```
- ```s``` consists only of lowercase English letters.

---

### Brute Force

```Python
class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        # Brute Force 
        n = len(s)
        ans = 0

        def recursion(l, r):
            nonlocal ans
            # Base case
            if l > r:
                return 0
            if l == r:
                return 1
            
            # Recurrence relation
            if s[l] == s[r]:
                ans = recursion(l + 1, r - 1) + 2
            else:
                ans = max(recursion(l, r - 1), recursion(l + 1, r))

            return ans

        return recursion(0, n - 1)
```

---

### The Framework

![image](https://leetcode.com/problems/longest-palindromic-subsequence/Figures/516/516-1.png)

#### Top-Down Dynamic Programming

__Recurrence relation__:

- If ```s[i] == s[j]```, perform ```answer = 2 + LPS(i + 1, j - 1)```.
- Else, perform ```answer = max(LPS(i, j - 1), LPS(i + 1, j)```.

- __Time complexity__: ```O(n^2)```
- __Space complexity__: ```O(n^2)```

```Python
class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        # Brute Force 
        n = len(s)
        memo = collections.defaultdict(int)

        def lps(l, r):
            # Base case
            if l > r:
                return 0
            if l == r:
                return 1
            
            if (l, r) in memo:
                return memo[(l, r)]

            # Recurrence relation
            if s[l] == s[r]:
                memo[(l, r)] = lps(l + 1, r - 1) + 2
            else:
                memo[(l, r)] = max(lps(l, r - 1), lps(l + 1, r))

            return memo[(l, r)]

        return lps(0, n - 1)
```

```Python
class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        n = len(s)
        ans = 0

        @lru_cache(None)
        def lps(l, r):
            nonlocal ans
            # Base case
            if l > r:
                return 0
            if l == r:
                return 1
            
            # Recurrence relation
            if s[l] == s[r]:
                ans = lps(l + 1, r - 1) + 2
            else:
                ans = max(lps(l, r - 1), lps(l + 1, r))

            return ans

        return lps(0, n - 1)
```

#### Bottom-Up Dynamic Programming

__Recurrence relation__:

- If ```s[i] == s[j]```, perform ```dp[i][j] = 2 + dp[i + 1][j - 1]```.
- Otherwise, perform ```dp[i][j] = max(dp[i][j - 1], dp[i + 1][j]```.

- __Time complexity__: ```O(n^2)```
- __Space complexity__: ```O(n^2)```

```Python
class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        n = len(s)
        dp = [[0] * n for _ in range(n)]

        for i in range(n - 1, -1, -1):
            dp[i][i] = 1
            for j in range(i + 1, n):
                if s[i] == s[j]:
                    dp[i][j] = dp[i + 1][j - 1] + 2
                else:
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
        
        return dp[0][n - 1]
```

#### Optimized Space Bottom-Up Dynamic Programming

__Recurrence relation__:

- If ```s[i] == s[j]```, perform ```dp[i][j] = 2 + dp[i + 1][j - 1]```.
- Otherwise, perform ```dp[i][j] = max(dp[i][j - 1], dp[i + 1][j]```.

- __Time complexity__: ```O(n^2)```
- __Space complexity__: ```O(n)```

```Python
class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        n = len(s) 
        dp, prev = [0] * n, [0] * n


        for i in range(n - 1, -1, -1):
            dp[i] = 1
            for j in range(i + 1, n):
                if s[i] == s[j]:
                    dp[j] = prev[j - 1] + 2
                else:
                    dp[j] = max(dp[j - 1], prev[j])
            prev = dp[:]
        
        return dp[n - 1]
```
