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


```Python
class Solution:
    def removeDuplicateLetters(self, s: str) -> str:
        counter = Counter(s)
        pivot = 0
        n = len(s)

        for i in range(n):
            if s[i] < s[pivot]:
                pivot = i
            counter[s[i]] -= 1
            if counter[s[i]] == 0:
                del counter[s[i]]
                break
        
        # Output is the leftmost letter plus the recursive call on the remainder of the string
        # Note: have to get rid of further occurrences of s[pivot] to ensure that there are no duplicates
        return s[pivot] + self.removeDuplicateLetters(s[pivot:].replace(s[pivot], "")) if s else ""
```

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
