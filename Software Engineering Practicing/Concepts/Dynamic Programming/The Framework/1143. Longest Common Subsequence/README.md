## [1143. Longest Common Subsequence](https://leetcode.com/problems/longest-common-subsequence)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given two strings ```text1``` and ```text2```, return _the length of their __longest common subsequence___. If there is no common subsequence, return ```0```.

A __subsequence__ of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

- For example, ```"ace"``` is a subsequence of ```"abcde"```.

A __common subsequence__ of two strings is a subsequence that is common to both strings.

![image](https://github.com/quananhle/Python/assets/35042430/ab462b4d-e783-4b57-a570-3833b3a4d86c)

---

__Example 1:__
```
Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
```

__Example 2:__
```
Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
```

__Example 3:__
```
Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
```

__Constraints:__

- $1 \le text1.length, text2.length \le 1000$
- ```text1``` and ```text2``` consist of only lowercase English characters.

---

### The Framework

![image](https://leetcode.com/problems/longest-common-subsequence/solutions/598321/Figures/1143/subproblem_partial_graph_with_all_links.png)

There are 2 scenarios:

   - If the first character of each string is not the same, then either one or both of those characters will not be used in the final result (i.e. not have a line drawn to or from it). Therefore, the length of the longest common subsequence is ```max(LCS(p1 + 1, p2), LCS(p1, p2 + 1))```.
   - When the first character of each string is the same, the length of the longest common subsequence is ```1 + LCS(p1 + 1, p2 + 1)```. In other words, we draw a line between the first two characters, adding 1 to the length to represent that line, and then solving the resulting subproblem (that has the first character removed from each string).

#### Top-Down Dynamic Programming (Recursion)

__Time complexity__: ```O(M ⋅ N)```, there are M ⋅ N subproblems

__Space complexity__: ```O(M ⋅ N)```, store M ⋅ N subproblems in a recursive call stack

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        # Top-Down DP (Recursion)
        n, m = len(text1), len(text2)
        memo = collections.defaultdict(int)

        def dp(n, m):
            # Base case
            if n == 0 or m == 0:
                return 0
            if memo[(n, m)]:
                return memo[(n, m)]

            # Recurrence relation
            if text1[n - 1] == text2[m - 1]:
                memo[(n, m)] = 1 + dp(n - 1, m - 1)
            else:
                memo[(n, m)] = max(dp(n, m - 1), dp(n - 1, m))

            return memo[(n, m)]

        return dp(n, m)
```

```Python
        n, m = len(text1), len(text2)
        memo = collections.defaultdict(int)

        def dp(t1, t2):
            if t1 == n or t2 == m:
                return 0
            if memo[(t1, t2)]:
                return memo[(t1, t2)]
            
            if text1[t1] == text2[t2]:
                memo[(t1, t2)] = 1 + dp(t1 + 1, t2 + 1)
            else:
                memo[(t1, t2)] = max(dp(t1 + 1, t2), dp(t1, t2 + 1))
            
            return memo[(t1, t2)]

        return dp(0, 0)
```

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        ans = 0
        m, n = len(text1), len(text2)

        @functools.lru_cache(maxsize=None)
        def dp(i, j):
            # Base case: when a string is reached the end, no more common element
            if i == m or j == n:
                return 0
            
            lcs = 0
            # DP Transitions:
            #   - Match: if two elements match, move on to the next elements in both strings, count 1 to final answer
            #   - Unmatch: two cases, check next element of text1 with current element of text2, and vice versa
            if text1[i] == text2[j]:
                lcs = dp(i + 1, j + 1) + 1
            else:
                lcs = max(dp(i + 1, j), dp(i, j + 1))

            return lcs

        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming (Tabulation)

__Time complexity__: ```O(M ⋅ N)```, there are M ⋅ N subproblems

__Space complexity__: ```O(M ⋅ N)```, allocating a hash map of M ⋅ N subproblems

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        # Bottom-Up DP (Tabulation)
        n, m = len(text1), len(text2)
        dp = collections.defaultdict(int)

        for i in range(1, n + 1):
            for j in range(1, m + 1):
                # Recurrence relation
                if text1[i - 1] == text2[j - 1]:
                    dp[(i, j)] = 1 + dp[(i - 1, j - 1)]
                else:
                    dp[(i, j)] = max(dp[(i - 1, j)], dp[(i, j - 1)])
        
        return dp[(n, m)]
```

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        # Bottom-Up DP (Tabulation)
        n, m = len(text1), len(text2)
        dp = collections.defaultdict(int)

        for i in range(n - 1, -1, -1):
            for j in range(m - 1, -1, -1):
                # Recurrence relation
                if text1[i] == text2[j]:
                    dp[(i, j)] = 1 + dp[(i + 1, j + 1)]
                else:
                    dp[(i, j)] = max(dp[(i, j + 1)], dp[(i + 1, j)])
        
        return dp[(0, 0)]
```

#### Optimized Space Bottom-Up Dynamic Programming

You might have noticed in the previous bottom-up approach, only current column and the previous column are looked at. After that, previously computed columns are no longer needed.

![image](https://user-images.githubusercontent.com/35042430/219426437-08edc4ac-907f-4a67-8d71-49f9f4c307a0.png)

__Time complexity__: ```O(M ⋅ N)```, there are M ⋅ N subproblems

__Space complexity__: ```O(min(M, N))```, allocating a hash map of shortest string subproblems

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        # If text1 doesn't reference the shortest string, swap them 
        if len(text1) > len(text2):
            text1, text2 = text2, text1

        n, m = len(text1), len(text2)
        previous = collections.defaultdict(int)
        current = collections.defaultdict(int)

        for row in range(n - 1, -1, -1):
            for col in range(m - 1, -1, -1):
                if text1[row] == text2[col]:
                    current[col] = 1 + previous[col + 1]
                else:
                    current[col] = max(previous[col], current[col + 1])
            # The current column becomes the previous one, and vice versa.
            previous, current = current, previous

        return previous[0]
```

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        # If text1 doesn't reference the shortest string, swap them 
        if len(text1) > len(text2):
            text1, text2 = text2, text1

        n, m = len(text1), len(text2)
        previous = collections.defaultdict(int)
        current = collections.defaultdict(int)

        for i in range(n - 1, -1, -1):
            for j in range(m - 1, -1, -1):
                if text1[i] == text2[j]:
                    current[j] = 1 + previous[j + 1]
                else:
                    current[j] = max(previous[j], current[j + 1])
            # The current column becomes the previous one, and vice versa.
            previous, current = current, previous
            
        return previous[0]
```
