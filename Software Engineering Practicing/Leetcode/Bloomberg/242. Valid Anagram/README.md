## [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)

```Tag```: ```String & Array``` ```Hash Map``` ```Sort```

#### Difficulty: Easy

Given two strings ```s``` and ```t```, return ```True``` if ```t``` is an anagram of ```s```, and ```False``` otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

![image](https://github.com/quananhle/Python/assets/35042430/90ad247b-5f37-4bb4-b4d8-552383018da8)

---

__Example 1:__
```
Input: s = "anagram", t = "nagaram"
Output: true
```

__Example 2:__
```
Input: s = "rat", t = "car"
Output: false
```

__Constraints:__

- $1 \le s.length, t.length \le 5 * 10^4$
- ```s``` and ```t``` consist of lowercase English letters.

---

### ```ord()```

```Python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s_counter, t_counter = [0] * 26, [0] * 26
        for c in s:
            s_counter[ord(c) - ord('a')] += 1
        for c in t:
            t_counter[ord(c) - ord('a')] += 1
        
        return s_counter == t_counter
```

__Follow up__: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

### Hash Map

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
