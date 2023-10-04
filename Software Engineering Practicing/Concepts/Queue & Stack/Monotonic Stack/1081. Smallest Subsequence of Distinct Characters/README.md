## [1081. Smallest Subsequence of Distinct Characters](https://leetcode.com/problems/smallest-subsequence-of-distinct-characters)

```Tag```: ```Monotonic Stack``` ```Array & String``` ```Greedy```

#### Difficulty: Medium

Given a string ```s```, return _the __lexicographically smallest subsequence__ of ```s``` that contains all the distinct characters of ```s``` exactly once_.

![image](https://github.com/quananhle/Python/assets/35042430/c605e63e-7205-40e7-8a4e-0c6b65ef35fa)

---

__Example 1:__
```
Input: s = "bcabc"
Output: "abc"
```

__Example 2:__
```
Input: s = "cbacdcbc"
Output: "acdb"
```

__Constraints:__

- $1 \le s.length \le 1000$
- ```s``` consists of lowercase English letters.
 

Note: This question is the same as [316. Remove Duplicate Letters](https://leetcode.com/problems/remove-duplicate-letters/).

---

### Greedy

```Python
class Solution:
    def smallestSubsequence(self, s: str) -> str:
        n = len(s)
        pivot = 0
        counter = collections.Counter(s)

        for i, char in enumerate(s):
            if char < s[pivot]:
                pivot = i
            counter[char] -= 1
            if counter[char] == 0:
                del counter[char]
                break
        
        return s[pivot] + self.smallestSubsequence(s[pivot:].replace(s[pivot], "")) if s else ""
```

### Stack

```Python

```
