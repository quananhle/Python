## On Strings

### [5. Longest Palindromic Substring](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Longest%20Substring%20%7C%20Palindrome/5.%20Longest%20Palindromic%20Substring)

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)
        dp = collections.defaultdict(bool)
        ans = [0, 0]

        # Base case for all substrings of length 1
        for i in range(n):
            dp[(i, i)] = True

        # Check every even pair of the substring
        for i in range(n - 1):
            if s[i] == s[i + 1]:
                dp[(i, i + 1)] = True
                ans = [i, i + 1]

        # Check every odd substring
        for diff in range(2, n):
            for i in range(n - diff):
                j = i + diff
                if s[i] == s[j] and dp[(i + 1, j - 1)]:
                    dp[(i, j)] = True
                    ans = [i, j]

        i, j = ans
        return s[i:j + 1]
```

### 139. Word Break

```Python
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        n = len(s)
        words = set(wordDict)

        @functools.lru_cache(maxsize=None)
        def dp(start):
            # Base case
            if start == n:
                return True
            
            for end in range(start + 1, n + 1):
                if s[start:end] in words and dp(end):
                    return True

            return False
        
        return dp(0)
```

### 516. Longest Palindromic Subsequence

```Python

```

### 72. Edit Distance

```Python

```

### 712. Minimum ASCII Delete Sum for Two Strings

```Python

```

### 115. Distinct Subsequences

```Python

```
