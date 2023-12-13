## [242. Valid Anagram](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Bloomberg/242.%20Valid%20Anagram)

```Python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s_order, t_order = [0] * 26, [0] * 26

        for c in s:
            s_order[ord(c) - ord('a')] += 1
        for c in t:
            t_order[ord(c) - ord('a')] += 1

        return s_counter == t_counter
```

#### Follow Up Question: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

```Python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        # For special character case
        s_counter, t_counter = collections.defaultdict(int), collections.defaultdict(int)
        for c in s:
            s_counter[c] += 1
        for c in t:
            t_counter[c] += 1
        
        for c, f in s_counter.items():
            if not c in t_counter or f != t_counter[c]:
                return False
        for c, f in t_counter.items():
            if not c in s_counter or f != s_counter[c]:
                return False
        
        return True
```
