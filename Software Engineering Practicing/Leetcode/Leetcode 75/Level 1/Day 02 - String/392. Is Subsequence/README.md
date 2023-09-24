## [392. Is Subsequence](https://leetcode.com/problems/is-subsequence)

```Tag```: ```Two Pointers``` ```Greedy Algorithm``` ```Divide & Conquer``` ```Dynamic Programming```

#### Difficulty: Easy

Given two strings ```s``` and ```t```, return ```true``` if ```s``` is a __subsequence__ of ```t```, or ```false``` otherwise.

A __subsequence__ of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., ```"ace"``` is a __subsequence__ of ```"abcde"``` while ```"aec"``` is not).

![image](https://user-images.githubusercontent.com/35042430/205380949-977ed83a-4f51-44f1-86d3-6411153715d2.png)

![image](https://github.com/quananhle/Python/assets/35042430/4aa4ec9b-4445-4938-b4d3-4a6daed5c049)

---

__Example 1:__
```
Input: s = "abc", t = "ahbgdc"
Output: true
```

__Example 2:__
```
Input: s = "axc", t = "ahbgdc"
Output: false
```

__Constraints:__
```
0 <= s.length <= 100
0 <= t.length <= 104
s and t consist only of lowercase English letters.
```

#### Follow up: Suppose there are lots of incoming ```s```, say ```s1, s2, ..., sk``` where ```k >= 109```, and you want to check one by one to see if ```t``` has its subsequence. In this scenario, how would you change your code?

---

### Two-Pointers

```Python
class Solution(object):
    def isSubsequence(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # Two Pointers
        #### Time Complexity: O(N), traverse through length of input t but iterate though length t and length s at the same time
        #### Space Complexity: O(1), only pointers are needed, no extra space required
        if len(t) < len(s):
            return False
        else:
            if not s:
                return True
            else:
                i, j = 0, 0
                while i < len(s):
                    while j < len(t):
                        if i >= len(s):
                            return True
                        else:
                            if t[j] == s[i]:
                                i += 1
                            j += 1
                    if i >= len(s):
                        return True
                    return False
```

```Python
        s_idx, t_idx = 0, 0
        S_BOUND, T_BOUND = len(s), len(t)
        while s_idx < S_BOUND and t_idx < T_BOUND:
            if s[s_idx] == t[t_idx]:
                s_idx += 1
            t_idx += 1
        return s_idx == S_BOUND
```

```Python
        s_idx = t_idx = 0
        S_BOUND, T_BOUND = len(s), len(t)
        while s_idx < S_BOUND and t_idx < T_BOUND:
            if s[s_idx] == t[t_idx]:
                s_idx += 1
            t_idx += 1
        return s_idx == S_BOUND
```

```Python
class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        m, n = len(s), len(t)

        i, j = 0, 0
        while i < m and j < n:
            if s[i] == t[j]:
                i += 1; j += 1
            else:
                j += 1
            
        return i == m
```

```Python
        if len(s) == 0:
            return True
        seen = 0
        for c in t:
            if s[seen] == c:
                seen += 1
            if seen == len(s):
                return True
        return False
```

### Divide and Conquer with Greedy

```Python
class Solution(object):
    def isSubsequence(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # Divide and Conquer with Greedy
        #### Time Complexity:
        #### Space Complexity:
        S_BOUND, T_BOUND = len(s), len(t)
        def helper(s_idx, t_idx):
            # Base cases
            if s_idx == S_BOUND:
                return True
            elif t_idx == T_BOUND:
                return False
            elif s[s_idx] == t[t_idx]:
                s_idx += 1
            t_idx += 1
            return helper(s_idx, t_idx)
        return helper(0, 0)
```

--- 

### Dynamic Programming

#### Top-Down Dynamic Programming

```Python
class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        m, n = len(s), len(t)

        @lru_cache(None)
        def dp(i, j):
            # Base case
            if i < 0:
                return True
            if j < 0:
                return False

            if s[i] == t[j]:
                ans = dp(i - 1, j - 1)
            else:
                ans = dp(i, j - 1)
            
            return ans
        
        return dp(m - 1, n - 1)
```

```Python
class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        m, n = len(s), len(t)

        @lru_cache(None)
        def dp(i, j):
            # Base case
            if i == m:
                return True
            if j == n:
                return False

            if s[i] == t[j]:
                ans = dp(i + 1, j + 1)
            else:
                ans = dp(i, j + 1)
            
            return ans
        
        return dp(0, 0)
```
