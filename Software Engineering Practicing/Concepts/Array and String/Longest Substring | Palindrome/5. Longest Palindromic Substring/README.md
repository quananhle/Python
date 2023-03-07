## [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

```Tag```: ```Dynamic Programming``` ```Two Pointers```

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




### Expand Around Center

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        ans = ""
        n = len(s)
        for i in range(n):
            # Odd length palindromic substring
            left, right = i, i
            while 0 <= left and right < n and s[left] == s[right]:
                left -= 1
                right += 1
            palindrome = s[left+1:right]
            if len(palindrome) > len(ans):
                ans = palindrome
            
            # Even length palindromic substring
            left, right = i, i + 1
            while 0 <= left and right < n and s[left] == s[right]:
                left -= 1
                right += 1
            palindrome = s[left+1:right]
            if len(palindrome) > len(ans):
                ans = palindrome

        return ans
```

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        def extract_palindrome(left, right):
            while 0 <= left and right < len(s) and s[left] == s[right]:
                left -= 1
                right += 1
            return s[left+1:right]

        ans = ""
        n = len(s)

        for i in range(n):
            # Check odd length palindrome
            palindrome = extract_palindrome(i, i)
            if len(palindrome) > len(ans):
                ans = palindrome
            # Check even length palindrome
            palindrome = extract_palindrome(i, i + 1)
            if len(palindrome) > len(ans):
                ans = palindrome
        
        return ans
```
