## [32. Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses)

```Tag```: ```Monotonic Stack``` ```Dynamic Programming```

#### Difficulty: Hard

Given a string containing just the characters ```'('``` and ```')'```, return _the length of the longest valid (well-formed) parentheses substring_.

![image](https://github.com/quananhle/Python/assets/35042430/4c8f5f55-b499-4d3c-a7a9-596a4b5b4f12)

---

__Example 1:__
```
Input: s = "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()".
```

__Example 2:__
```
Input: s = ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()".
```

__Example 3:__
```
Input: s = ""
Output: 0
```

__Constraints:__

- $0 \le s.length \le 3 * 10^{4}$
- ```s[i]``` is ```'('```, or ```')'```.

---

### Stack

Complexity Analysis

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python
class Solution:
    def longestValidParentheses(self, s: str) -> int:
        n = len(s)
        stack, ans = [-1], 0
        for i in range(n):
            # For every ‘(’ encountered, push its index onto the stack.
            if s[i] == '(':
                stack.append(i)
            # For every ‘)’ encountered, pop the topmost element
            else:
                stack.pop()
                # If stack is empty, the current index is the most recent index of invalid parentheses, push onto stack
                if not stack:
                    stack.append(i)
                # Otherwise, get the length of the current valid parentheses, and its maximum length
                else:
                    ans = max(ans, i - stack[-1])
        
        return ans
```
