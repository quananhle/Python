## [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

```Tag```: ```Dynamic Programming``` ```Two Pointers``` ```Sliding Window```

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

### The Framework

#### Top-Down Dynamic Programming

```Python

```

#### Bottom-Up Dynamic Programming

```Python

```

### Expand Around Center

- __Time complexity__: O(n<sup>2</sup>), since expanding a palindrome around its center could take O(n) time, the overall complexity is O(n<sup>2</sup>)
- __Space complexity__: O(1)

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


### Sliding Window

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)
        if s == s[::-1] or n < 2:
            return s
        
        start, end = 0, 1

        for i in range(1, len(s)):
            left, right = i - end, i + 1
            s1, s2 = s[left-1:right], s[left:right]
            
            if left - 1 >= 0 and s1 == s1[::-1]:
                start, end = left - 1, end + 2
            elif s2 == s2[::-1]:
                start, end = left, end + 1
        
        return s[start:start+end]
```

```Python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)
        if s == s[::-1] or n < 2:
            return s

        start, max_len = 0, 1

        for i in range(1, n):
            # Check odd length palindromic substring
            start = i - max_len - 1
            odd = s[start:i+1]
            if start >= 0 and odd == odd[::-1]:
                max_len += 2
            
            # Check even length palindromic substring
            start = i - max_len
            even = s[start:i+1]
            if start >= 0 and even == even[::-1]:
                max_len += 1

        return s[start:start+max_len] 
```

