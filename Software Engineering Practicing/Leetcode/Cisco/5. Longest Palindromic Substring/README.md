## [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a string ```s```, return _the __longest palindromic substring__ in ```s```_.

![image](https://user-images.githubusercontent.com/35042430/223540736-d921565d-e915-45a7-850a-3130070c9fa5.png)

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

```

#### Bottom-Up Dynamic Programming

```Python

```
