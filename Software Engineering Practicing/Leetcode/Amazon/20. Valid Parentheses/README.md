## [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)

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
```

```Python
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
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

```Python
class Solution:
    def isValid(self, s: str) -> bool:
        closing_brackets = {']':'[', '}':'{', ')':'('}
        stack = list()

        for char in s:
            # Check if current character is an open bracket
            if not char in closing_brackets:
                stack.append(char)
            # Otherwise, the current character is a close bracket
            else:
                # Check if there is a character in the stack and it is the open bracket of the same type as the current character
                if stack and stack[-1] == closing_brackets[char]:
                    # Got a valid pair of bracket
                    stack.pop()
                # Otherwise, open bracket is closed by the different type of bracket
                else:
                    return False
        
        return len(stack) == 0
```
