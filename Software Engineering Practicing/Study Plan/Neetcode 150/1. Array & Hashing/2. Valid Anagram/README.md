## [242. Valid Anagram](https://leetcode.com/problems/valid-anagram)

```Python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s_order, t_order = [0] * 26, [0] * 26

        for c in s:
            s_order[ord(c) - ord('a')] += 1
        for c in t:
            t_order[ord(c) - ord('a')] += 1

        for i in range(26):
            if s_order[i] != t_order[i]:
                return False
        
        return True
```
