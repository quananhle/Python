## 20. Valid Parentheses

#### Difficulty: Easy

Given a string ```s``` containing just the characters ```'('```, ```')'```, ```'{'```, ```'}'```, ```'['``` and ```']'```, determine if the input string is valid.

An input string is valid if:

- Open brackets must be closed by the same type of brackets.
- Open brackets must be closed in the correct order.
- Every close bracket has a corresponding open bracket of the same type.

![image](https://user-images.githubusercontent.com/35042430/207241914-2de3acf7-bcc0-42ae-9897-ed929081e03a.png)

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

__Example 3:__
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

```Python
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        """
        stack = list()
        dictionary = {'}':'{' , ')':'(' , ']':'['}
        for c in s:
            if c in dictionary:
                if stack:
                    paren = stack.pop()
                else:
                    paren = '#'
                if dictionary[c] != paren:
                    return False
            else:
                stack.append(c)
        return not stack
        """
        stack = list()
        brackets = {'{':'}' , '(':')' , '[':']'}
        open_par = set(['(', '{', '['])
        for c in s:
            if c in open_par:
                stack.append(c)
            elif stack and brackets[stack[-1]] == c:
                stack.pop()
            else:
                return False
        return stack == []
```
