## [647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings)

```Tag```: ```Dynamic Programming```

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
