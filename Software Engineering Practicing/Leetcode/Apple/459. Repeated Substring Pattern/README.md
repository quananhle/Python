## [459. Repeated Substring Pattern](https://leetcode.com/problems/repeated-substring-pattern/description/)

```Tag```: 

#### Difficulty: Easy

Given a string ```s```, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

![image](https://github.com/quananhle/Python/assets/35042430/f3f24956-8359-4b85-ba4d-17a2f40f990e)

---

__Example 1:__

```
Input: s = "abab"
Output: true
Explanation: It is the substring "ab" twice.
```

__Example 2:__
```
Input: s = "aba"
Output: false
```

__Example 3:__
```
Input: s = "abcabcabcabc"
Output: true
Explanation: It is the substring "abc" four times or the substring "abcabc" twice.
```

__Constraints:__

- $1 \le s.length \le 10^{4}$
- ```s``` consists of lowercase English letters.

---

### String Matching

#### Using Divisors

```Python
class Solution:
    def repeatedSubstringPattern(self, s: str) -> bool:
        n = len(s)

        for i in range(1, n // 2 + 1):
            if n % i == 0:
                pattern = s[:i] * (n // i)
                if s == pattern:
                    return True

        return False
```

