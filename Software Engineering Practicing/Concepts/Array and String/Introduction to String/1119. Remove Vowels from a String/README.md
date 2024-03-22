## [1119. Remove Vowels from a String](https://leetcode.com/problems/remove-vowels-from-a-string)

```Tag```: ```Array & String``` ```Hash Set```

#### Difficulty: Easy

Given a string ```s```, remove the vowels ```'a'```, ```'e'```, ```'i'```, ```'o'```, and ```'u'``` from it, and return _the new string_.

![image](https://github.com/quananhle/Python/assets/35042430/dc8b5e0e-207e-4304-9848-f98c398c6efd)

---

__Example 1:__
```
Input: s = "leetcodeisacommunityforcoders"
Output: "ltcdscmmntyfrcdrs"
```

__Example 2:__
```
Input: s = "aeiou"
Output: ""
```

__Constraints:__

- $1 \le s.length \le 1000$
- ```s``` consists of only lowercase English letters.

---

### Hash Set

```Python
class Solution:
    def removeVowels(self, s: str) -> str:
        vowels = {'a', 'e', 'i', 'o', 'u'}
        res = list()
        for i, c in enumerate(s):
            if c in vowels:
                continue
            res.append(c)
        return "".join(res)
```

#### One Liner

```Python
class Solution:
    def removeVowels(self, s: str) -> str:
        return "".join([c for c in s if c not in {'a', 'e', 'i', 'o', 'u'}])
```
