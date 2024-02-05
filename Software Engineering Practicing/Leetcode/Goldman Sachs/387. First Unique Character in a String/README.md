## [387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

Given a string ```s```, find the __first non-repeating character__ in it and return _its index_. If it does not exist, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/f78361da-aa7c-46b2-8efe-da5c3a2c3519)

---

__Example 1:__
```
Input: s = "leetcode"
Output: 0
```

__Example 2:__
```
Input: s = "loveleetcode"
Output: 2
```

__Example 3:__
```
Input: s = "aabb"
Output: -1
```

__Constraints:__

- $1 \le s.length \le 10^5$
- ```s``` consists of only lowercase English letters.

---

### Counter

#### Hash Map

```Python
class Solution:
    def firstUniqChar(self, s: str) -> int:
        counter = collections.defaultdict(int)
        for c in s:
            counter[c] = 1 + counter.get(c, 0)
        
        for i, c in enumerate(s):
            if counter[c] == 1:
                return i
        
        return -1
```

#### Array

```Python
class Solution:
    def firstUniqChar(self, s: str) -> int:
        bucket = [0] * 26
        for c in s:
            bucket[ord(c) - ord('a')] += 1
        
        for i, c in enumerate(s):
            if bucket[ord(c) - ord('a')] == 1:
                return i
        
        return -1
```
