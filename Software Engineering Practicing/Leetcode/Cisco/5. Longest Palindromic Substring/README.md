## [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a string ```s```, return _the __longest palindromic substring__ in ```s```_.

![image](https://github.com/quananhle/Python/assets/35042430/3dc3bccb-45f2-4ba7-8af5-83a0471e6d3a)

---

__Example 1:__
```
Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.
```

__Example 2:__
```
Input: s = "cbbd"
Output: "bb"
```

__Constraints:__

- ```1 <= s.length <= 1000```
- ```s``` consist of only digits and English letters.

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^{3})$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        # Time Limit Exceeded
        n = len(s)

        if n == 1:
            return s

        def is_palindrome(start, end):
            left, right = start, end - 1

            while left < right:
                if s[left] != s[right]:
                    return False
                left += 1
                right -= 1

            return True
        
        res = ""
        for end in range(n + 1):
            for start in range(end):
                if is_palindrome(start, end) and len(res) < len(s[start:end]):
                    res = s[start:end]
        
        return res
```

#### Optimized Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^{3})$. Note that this time complexity is in the worst case and has a significant constant divisor that is dropped by big $\mathcal{O}$. Due to the optimizations of checking the longer length substrings first and exiting the palindrome check early if we determine that a substring cannot be a palindrome, the practical runtime of this algorithm is not too bad.
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)

        def is_palindrome(start, end):
            left, right = start, end - 1

            while left < right:
                if s[left] != s[right]:
                    return False
                left += 1
                right -= 1

            return True
            
        for length in range(n, 0, -1):
            for start in range(n - length + 1):
                if is_palindrome(start, start + length):
                    return s[start:start + length]
        
        return ""
```

--- 

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        # Memory Limit Exceeded
        n = len(s)
        ans = leftmost = 0
        memo = collections.defaultdict(int)

        def dp(left, right):
            nonlocal ans
            nonlocal leftmost
            # Base case
            if left > right:
                return 0
            elif left == right:
                return 1

            if (left, right) in memo:
                return memo[(left, right)]
            
            if s[left] == s[right]:
                length = right - left - 1
                if length == dp(left + 1, right - 1):
                    count = length + 2
                    if ans < count:
                        ans = count
                        leftmost = left
                    memo[(left, right)] = count
                    return count
            
            start = dp(left + 1, right)
            end = dp(left, right - 1)
            memo[(left, right)] = max(start, end)
            return max(start, end)
        
        window = dp(0, n - 1)
        return s[leftmost:leftmost + window]
```

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        # Memory Limit Exceeded
        n = len(s)
        ans = leftmost = 0

        @functools.lru_cache(maxsize=None)
        def dp(left, right):
            nonlocal ans
            nonlocal leftmost
            # Base case
            if left > right:
                return 0
            elif left == right:
                return 1
            
            if s[left] == s[right]:
                length = right - left - 1
                if length == dp(left + 1, right - 1):
                    count = length + 2
                    if ans < count:
                        ans = count
                        leftmost = left
                    return count
            
            start = dp(left + 1, right)
            end = dp(left, right - 1)
            return max(start, end)
        
        window = dp(0, n - 1)
        return s[leftmost:leftmost + window]
```

#### Bottom-Up Dynamic Programming

![image](https://leetcode.com/problems/longest-palindromic-substring/Figures/5/2.png)

We know that all substrings of length 1 are palindromes. From this, we can check if each substring of length 3 is a palindrome using the above fact. We just need to check every ```i, j``` pair where ```j - i = 2```. Once we know all palindromes of length 3, we can use that information to find all palindromes of length 5, and then 7, and so on.

What about even-length palindromes? A substring of length 2 is a palindrome if both characters are equal. That is, ```i```, ```i + 1``` is a palindrome if ```s[i] == s[i + 1]```. From this, we can use the earlier logic to find all palindromes of length 4, then 6, and so on.

```dp[(i, j)]``` is a boolean representing if the substring with inclusive bounds ```i, j``` is a palindrome. We initialize ```dp[(i, i)] = True``` for the substrings of length 1, and then ```dp[(i, i + 1)] = (s[i] == s[i + 1])``` for the substrings of length 2.

Because we are starting with the shortest substrings and iterating toward the longest substrings, every time we find a new palindrome, it must be the longest one we have seen so far. We can use this fact to keep track of the answer on the fly.

Algorithm

Initialize n = s.length and a boolean table dp with size n * n, and all values to false.

Initialize ans = [0, 0]. This will hold the inclusive bounds of the answer.

Set all dp[i][i] = true.

Iterate over all pairs i, i + 1. For each one, if s[i] == s[i + 1], then set dp[i][i + 1] = true and update ans = [i, i + 1].

Now, we populate the dp table. Iterate over diff from 2 until n. This variable represents the difference j - i.

In a nested for loop, iterate over i from 0 until n - diff.

Set j = i + diff.
Check the condition: if s[i] == s[j] && dp[i + 1][j - 1], we found a palindrome.
In that case, set dp[i][j] = true and ans = [i, j]
Retrieve the answer bounds from ans as i, j. Return the substring of s starting at index i and ending with index j.

- __Time Complexity__: $\mathcal{O}(n^{2})$
- __Space Complexity__: $\mathcal{O}(n^{2})$

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)
        dp = collections.defaultdict(bool)
        ans = [0, 0]

        for i in range(n):
            dp[(i, i)] = True
        
        for i in range(n - 1):
            if s[i] == s[i + 1]:
                dp[(i, i + 1)] = True
                ans = [i, i + 1]
            
        for diff in range(2, n):
            for i in range(n - diff):
                j = i + diff
                if s[i] == s[j] and dp[(i + 1, j - 1)]:
                    dp[(i, j)] = True
                    ans = [i, j]

        i, j = ans
        return s[i:j + 1]
```
