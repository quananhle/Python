## [316. Remove Duplicate Letters](https://leetcode.com/problems/remove-duplicate-letters/)

```Tag```: ```Greedy``` ```Monotonic Stack```

#### Difficulty: Medium

Given a string ```s```, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.

![image](https://github.com/quananhle/Python/assets/35042430/b07a6a7d-2bb1-454d-a5b5-d26bc42aa8db)

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

- ```1 <= s.length <= 10^4```
- ```s``` consists of lowercase English letters.

__Note__: This question is the same as [1081](https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/)

---

### Greedy Algorithm

#### Solving Letter by Letter

__Intuition__



### Monotonic Stack

```Python
class Solution:
    def removeDuplicateLetters(self, s: str) -> str:
        stack = list()
        seen = set()
        memo = {c:i for i, c in enumerate(s)}

        for i, c in enumerate(s):
            if not c in seen:
                while stack and c < stack[-1] and i < memo[stack[-1]]:
                    seen.discard(stack.pop())
                seen.add(c)
                stack.append(c)
            
        return "".join(stack)
```
