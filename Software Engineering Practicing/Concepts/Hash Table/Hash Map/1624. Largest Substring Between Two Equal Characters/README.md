## [1624. Largest Substring Between Two Equal Characters](https://leetcode.com/problems/largest-substring-between-two-equal-characters)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

Given a string ```s```, return _the length of the longest substring between two equal characters, excluding the two characters_. If there is no such substring return ```-1```.

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

#### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^2)$. $\frac{n \cdot (n - 1)}{2} = \mathcal{O}(n^2)$
- __Space Complexity__: $\mathcal{O}(1)$

We aren't using any extra space.

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        ans = -1
        n = len(s)

        for left in range(n):
            for right in range(left + 1, n):
                if s[left] == s[right]:
                    ans = max(ans, right - left - 1)
        
        return ans
```

#### Two Pointers

- __Time Complexity__: $\mathcal{O}(26 \cdot n) = \mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        ans = -1
        n = len(s)

        for c in set(s):
            left, right = 0, n - 1
            while left < n and s[left] != c:
                left += 1
            while right > 0 and s[right] != c:
                right -= 1
            ans = max(ans, right - left - 1)
    
        return ans
```

#### First Occurrence Memorization

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        n = len(s)
        memo = [None] * 26
        ans = -1

        for i, c in enumerate(s):
            c = ord(c) - ord('a')
            if memo[c] is None:
                memo[c] = i
            else:
                ans = max(ans, i - memo[c] - 1)

        return ans
```

#### One Liner (```find``` + ```rfind```)

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        return max(s.rfind(c) - s.find(c) - 1 for c in set(s))
```

### Hash Map

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
class Solution:
    def maxLengthBetweenEqualCharacters(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        ans = -1

        for i, c in enumerate(s):
            if not c in memo:
                memo[c] = i
            else:
                ans = max(ans, i - memo[c] - 1)

        return ans
```

