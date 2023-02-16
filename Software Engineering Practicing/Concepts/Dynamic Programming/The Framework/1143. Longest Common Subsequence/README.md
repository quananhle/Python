## 1143. Longest Common Subsequence

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given two strings ```text1``` and ```text2```, return _the length of their __longest common subsequence___. If there is no common subsequence, return ```0```.

A __subsequence__ of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

- For example, ```"ace"``` is a subsequence of ```"abcde"```.

A __common subsequence__ of two strings is a subsequence that is common to both strings.

![image](https://user-images.githubusercontent.com/35042430/219167142-9ee8e0ff-b1e1-4996-aa9e-5866a5764d3f.png)

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

- ```1 <= text1.length, text2.length <= 1000```
- ```text1``` and ```text2``` consist of only lowercase English characters.

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

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
