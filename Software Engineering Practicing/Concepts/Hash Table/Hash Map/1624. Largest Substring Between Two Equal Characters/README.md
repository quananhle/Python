## [1624. Largest Substring Between Two Equal Characters](https://leetcode.com/problems/largest-substring-between-two-equal-characters)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.

A substring is a contiguous sequence of characters within a string.

![image](https://github.com/quananhle/Python/assets/35042430/b53a7002-460d-4fc6-9f51-5cdef17383bf)

---

__Example 1:__
```
Input: s = "aa"
Output: 0
Explanation: The optimal substring here is an empty substring between the two 'a's.
```

__Example 2:__
```
Input: s = "abca"
Output: 2
Explanation: The optimal substring here is "bc".
```

__Example 3:__
```
Input: s = "cbzxy"
Output: -1
Explanation: There are no characters that appear twice in s.
```

__Constraints:__

- $1 \le s.length \le 300$
- ```s``` contains only lowercase English letters.

---

### Array

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        n = len(s)
        memo = [None] * 26
        ans = -math.inf

        for i, c in enumerate(s):
            c = ord(c) - ord('a')
            if memo[c] is None:
                memo[c] = i
            else:
                ans = max(ans, i - memo[c] - 1)

        return -1 if ans == -math.inf else ans
```

### Hash Map

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        ans = -math.inf

        for i, c in enumerate(s):
            if not c in memo:
                memo[c] = i
            else:
                ans = max(ans, i - memo[c] - 1)

        return -1 if ans == -math.inf else ans
```

