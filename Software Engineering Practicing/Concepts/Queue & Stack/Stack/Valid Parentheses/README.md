## Valid Parentheses

```Tag```: ```Stack``` ```Hash Map```

#### Difficulty: Easy

Given a string ```s``` containing just the characters ```'('```, ```')'```, ```'{'```, ```'}'```, ```'['``` and ```']'```, determine if the input string is valid.

An input string is valid if:

- Open brackets must be closed by the same type of brackets.
- Open brackets must be closed in the correct order.
- Every close bracket has a corresponding open bracket of the same type.
 
---

__Example 1:__

```
Input: s = "()"
Output: true
```

__Example 2:__

```
Input: s = "()[]{}"
Output: true
```

__Example 3:___

```
Input: s = "(]"
Output: false
```

__Constraints:__

```
1 <= s.length <= 104
s consists of parentheses only '()[]{}'.
```

---

### Stack and Hash Map

```Python
class Solution:
    def isValid(self, s: str) -> bool:
        # Stack and Hash Map
        hash_map = {"]":"[", "}":"{", ")":"("}
        stack = list()
        for paren in s:
            if not paren in hash_map:
                stack.append(paren)
            else:
                if not stack:
                    return False
                elif stack[-1] == hash_map[paren]:
                    stack.pop()
                else:
                    return False
        return len(stack) == 0
```

```Python
class Solution:
    def isValid(self, s: str) -> bool:
        hash_map = {'[':']', '{':'}', '(':')'}
        stack = list()
        for paren in s:
            if paren in hash_map:
                stack.append(paren)
            else:
                if not stack:
                    return False
                elif paren == hash_map[stack[-1]]:
                    stack.pop()
                else:
                    return False
        return len(stack) == 0
```

```Python
class Solution:
    def isValid(self, s: str) -> bool:
        hash_map = {"]":"[", "}":"{", ")":"("}
        stack = list()
        for paren in s:
            if not paren in hash_map:
                stack.append(paren)
            else:
                if stack and hash_map[paren] == stack[len(stack)-1]:
                    stack.pop()
                else:
                    return False
        return stack == []
```

