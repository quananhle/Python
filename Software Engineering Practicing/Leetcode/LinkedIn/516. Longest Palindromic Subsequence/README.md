## [516. Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/)

```Tag```: 

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

#### Top-Down Dynamic Programming

```Python

```
