## [647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings)

```Tag```: ```Dynamic Programming``` ```Manacher's Algorithm```

#### Difficulty: Medium

Given a string ```s```, return _the number of palindromic substrings in it_.

A string is a palindrome when it reads the same backward as forward.

A substring is a contiguous sequence of characters within the string.

![image](https://github.com/quananhle/Python/assets/35042430/80ad76d6-2c39-4082-bdc5-e62d2ccac511)

---

__Example 1:__
```
Input: s = "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".
```

__Example 2:__
```
Input: s = "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
```

__Constraints:__

- $1 \le s.length \le 1000$
- ```s``` consists of lowercase English letters.

---

### Brute Force

#### Check All Substrings

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^3)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        ans = 0

        def is_palindrome(string, start, end):
            while start < end:
                if string[start] != string[end]:
                    return False
                start += 1; end -= 1
            return True

        for start in range(n):
            for end in range(start, n):
                ans += is_palindrome(s, start, end)
        
        return ans
```

```Python
class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        ans = 0

        def is_palindrome(string):
            left, right = 0, len(string) - 1

            while left < right:
                if string[left] != string[right]:
                    return False
                left += 1; right -= 1

            return True

        for start in range(n):
            for end in range(n, start, -1):
                ans += is_palindrome(s[start:end])

        return ans
```

#### Optimized Brute Force

```Python
class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        ans = 0
        memo = collections.defaultdict(int)

        def is_palindrome(string):
            left, right = 0, len(string) - 1

            while left < right:
                if string[left] != string[right]:
                    return False
                left += 1; right -= 1

            return True

        for start in range(n):
            for end in range(n, start, -1):
                if s[start:end] in memo:
                    ans += memo[s[start:end]]
                    continue
                memo[s[start:end]] = is_palindrome(s[start:end])
                ans += memo[s[start:end]]

        return ans
```

---

### Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(N^2)$

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        ans = 0

        dp = [[1] * n for _ in range(n)]

        # Base case: single letter substrings
        for i in range(n):
            ans += dp[i][i]

        # Base case: double letter substrings
        for i in range(n - 1):
            dp[i][i + 1] = s[i] == s[i + 1]
            ans += dp[i][i + 1]

        # All other cases: substrings of length 3 to n
        for length in range(3, n + 1):
            for start in range(n - length + 1):
                end = start + length - 1
                dp[start][end] = dp[start + 1][end - 1] and (s[start] == s[end])
                ans += dp[start][end]

        return ans
```

---

### Manacher'S Algorithm | Expand Around Possible Centers

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def countSubstrings(self, s: str) -> int:
        def count_palindrome_around_center(s, lo, hi):
            ans = 0
            while 0 <= lo and hi < len(s):
                if s[lo] != s[hi]:
                    break
                lo -= 1; hi += 1
            
                ans += 1
            return ans
        
        ans = 0
        for i in range(len(s)):
            # Odd-length palindromes, single character center
            ans += count_palindrome_around_center(s, i, i)
            # Even-length palindromes, consecutive characters center
            ans += count_palindrome_around_center(s, i, i + 1)
        
        return ans
```

