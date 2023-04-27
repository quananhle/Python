## [727. Minimum Window Subsequence](https://leetcode.com/problems/minimum-window-subsequence/)

```Tag```: ```Dynamic Programming``` ```Sliding Window``` ```Greedy```

#### Difficulty: Hard

Given strings ```s1``` and ```s2```, return _the minimum contiguous substring part of ```s1```, so that ```s2``` is a subsequence of the part_.

If there is no such window in ```s1``` that covers all characters in ```s2```, return the empty string ```""```. If there are multiple such minimum-length windows, return the one with __the left-most starting index__.

![image](https://user-images.githubusercontent.com/35042430/233907015-a7a3df6c-7837-4634-ac65-ce2901730a9e.png)

---

__Example 1:__
```
Input: s1 = "abcdebdde", s2 = "bde"
Output: "bcde"
Explanation: 
"bcde" is the answer because it occurs before "bdde" which has the same length.
"deb" is not a smaller window because the elements of s2 in the window must occur in order.
```

__Example 2:__
```
Input: s1 = "jmeqksfrsdcmsiwvaovztaqenprpvnbstl", s2 = "u"
Output: ""
```

__Constraints:__

- 1 <= ```s1.length``` <= 2 * 10<sup>4</sup>
- 1 <= ```s2.length``` <= 100
- ```s1``` and ```s2``` consist of lowercase English letters.

---

### The Framework

__1. Dynamic Programming Function__

Let's define ```dp[i][j]``` as the minimum length of a substring of ```s1``` ending at index ```i - 1``` that contains ```b[j]``` as a subsequence.

- If ```a[i]``` does not contain ```b[j]```, then ```dp[i][j]``` equals infinity.
- Otherwise, ```dp[i][j] = k```, where the substring of ```s1``` starting at index ```i - k``` and ending at index ```i - 1``` contains ```b[j]``` as a subsequence, and ```k``` is minimized.

Notice that if ```j = m```, we are looking for the original input ```s2```. Therefore, the answer to the original problem is the minimum value of ```dp[i][m]```. We need to search all values of ```i```, as the answer could end at an arbitrary index.

__2. Dynamic Programming Base Case__

The base case of this Dynamic Programming are ```dp[i][0]``` and ```dp[0][j]```.

For ```j = 0```, we consider an empty prefix of ```s2```. Since an empty string (the string of length ```0```) contains an empty prefix of ```s2```, thus ```dp[i][0] = 0```.

For ```i = 0``` and ```j > 0```, we consider an empty string of ```s1``` and a non-empty prefix of ```s2```. Since an empty string does not contain a non-empty one, ```dp[0][j]``` is infinity for ```j > 0```.

__3. DB Transition__

Consider ```i > 0```, ```j > 0```, so the prefixes ```a[i]``` and ```b[j]``` are non-empty. 

By definition of the DP, we need to find the smallest length ```k``` such that the substring of ```s1``` of length ```k``` ending at position ```i - 1``` contains ```b[j]```. Since the substring we're looking for ends at position ```i - 1```, its last character is ```s1[i - 1]```.

Let's consider the target substring as the combination of ```p``` and ```s1[i - 1]```, where ```p``` is the target substring with the final character removed. ```p``` is the substring of ```s1``` with length ```k - 1``` ending at index ```i - 2```.

The last character of the prefix ```b[j]``` (the prefix of ```s2``` of length ```j```) is ```s2[j - 1]```. Similarly, let's split this prefix into ```b[j - 1] + s2[j - 1]```. Again, we just split the string at the last character.

The substring ```p + s1[i - 1]``` must contain ```b[j - 1] + s2[j - 1]``` and we want the length of ```p + s1[i - 1]``` to be as small as possible. Since ```len(p + s1[i - 1]) = len(p) + 1```, we want to minimize ```len(p)```, where ```len``` denotes the length of a string.

For every state ```(i, j)```, we have two possibilities:

- If the last character that we removed from each of the two strings is the same, i.e. ```s1[i - 1] == s2[j - 1]```, the condition "```p + s1[i - 1]``` contains ```b[j - 1] + s2[j - 1]```" is equivalent to the condition "```p``` contains ```b[j - 1]```". Remember that ```p``` is a substring of ```s1``` ending at position ```i-2``` and we want to minimize its length. By definition of DP, the smallest length of a substring ending at position ```i-2``` and containing ```b[j - 1]``` is ```dp[i - 1][j - 1]```. Therefore, we have ```dp[i][j] = dp[i - 1][j - 1] + 1```. The ```+ 1``` comes from using this last character that we removed during the split.
- If the last character that we removed from each of the two strings is not the same, i.e. ```s1[i - 1] != s2[j - 1]```, the condition "```p + s1[i - 1]``` contains ```b[j - 1] + s2[j - 1]```" is equivalent to the condition "```p``` contains ```b[j - 1] + s2[j - 1]```", since ```s1[i - 1]``` is useless. Note that ```b[j - 1] + s2[j - 1] = b[j]```. Therefore, we have the condition "```p``` contains ```b[j]```". This is the same as in the previous case, but now we are looking at ```b[j]``` instead of ```b[j - 1]```. Therefore, we have ```dp[i][j] = dp[i - 1][j] + 1```.

#### Top-Down Dynamic Programming

```Python
class Solution:
    def minWindow(self, s1: str, s2: str) -> str:
        m, n = len(s1), len(s2)
        k = float('inf')
        memo = collections.defaultdict(int)

        def dp(i, j):
            # Base case
            if j == 0:
                return 0
            
            if i == 0 and j > 0:
                return float("inf")
            
            if (i, j) in memo:
                return memo[(i, j)]

            # Recurrence relation
            if s1[i - 1] == s2[j - 1]:
                memo[(i, j)] = 1 + dp(i - 1, j - 1)
            else:
                memo[(i, j)] = 1 + dp(i - 1, j)
            
            return memo[(i, j)]


        for i in range(m  + 1):
            k = min(k, dp(i, n))

        if k == float("inf"):
            return ""

        for j in range(m + 1):
            if dp(j, n) == k:
                return s1[j - k:j]
```

```Python
class Solution:
    def minWindow(self, s1: str, s2: str) -> str:
        m, n = len(s1), len(s2)
        k = float('inf')

        @lru_cache(None)
        def dp(i, j):
            # Base cases
            if j == 0:
                return 0
            
            if i == 0 and j > 0:
                return float("inf")
            
            # Recurrence relation
            if s1[i - 1] == s2[j - 1]:
                ans = 1 + dp(i - 1, j - 1)
            else:
                ans = 1 + dp(i - 1, j)
            
            return ans


        for i in range(m  + 1):
            k = min(k, dp(i, n))

        if k == float("inf"):
            return ""

        for j in range(m + 1):
            if dp(j, n) == k:
                return s1[j - k:j]
```

#### Bottom-Up Dynamic Programming

__Algorithm__

1. Let ```n``` be the length of ```s1``` and ```m``` be the length of ```s2```.
2. Declare the DP table ```dp[n + 1][m + 1]``` and initialize it with very large values.
3. Set ```dp[0][0] = 0```. (The base case of the DP.)
4. Initialize ```end = 0``` and ```length = n + 1```.
5. Iterate ```i``` from ```1``` to ```n```.
    - Set ```dp[i][0] = 0```. (The base case of the DP.)
    - Iterate ```j``` from ```1``` to ```m```.
        - If ```s1[i - 1] = s2[j - 1]```, set ```dp[i][j] = dp[i - 1][j - 1] + 1```.
        - Otherwise, set ```dp[i][j] = dp[i - 1][j] + 1```.
    - If ```dp[i][m] < length```, set ```length = dp[i][m]``` and ```end = i```.
6. If ```length > n```, that means that we never updated it with any DP value and we return an empty string, otherwise we return the substring of ```s1``` of length ```length``` ending at position ```end - 1```.

```Python
class Solution:
    def minWindow(self, s1: str, s2: str) -> str:
        m, n = len(s1), len(s2)
        dp = [[math.inf] * (n + 1) for _ in range(m + 1)]
        dp[0][0] = 0
        end = 0
        length = m + 1

        for i in range(1, m + 1):
            dp[i][0] = 0
            for j in range(1, n + 1):
                dp[i][j] = 1 + (dp[i - 1][j - 1] if s1[i - 1] == s2[j - 1] else dp[i - 1][j])
            
            if dp[i][n] < length:
                length = dp[i][n]
                end = i
        
        return "" if length > m else s1[end-length:end]
```

#### Optimized Space Bottom-Up Dynamic Programming

```Python
class Solution:
    def minWindow(self, s1: str, s2: str) -> str:
        m, n = len(s1), len(s2)
        f = [1000000000] * (n + 1)
        g = [None] * (n + 1)
        f[0] = 0
        end = 0
        length = m + 1

        for i in range(1, m + 1):
            g[0] = 0
            for j in range(1, n + 1):
                g[j] = 1 + (f[j - 1] if s1[i - 1] == s2[j - 1] else f[j])
            f = g.copy()
            if f[n] < length:
                end = i
                length = f[n]

        return "" if length > m else s1[end - length:end]
```

---

### Greedy

```Python

```
