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

```Python

```
