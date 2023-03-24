## Basic Calculator

### [Basic Calculator I](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/224.%20Basic%20Calculator)

```
Example 1:
Input: s = "1 + 1"
Output: 2

Example 2:
Input: s = " 2-1 + 2 "
Output: 3

Example 3:
Input: s = "(1+(4+5+2)-3)+(6+8)"
Output: 23
```

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, num, stack, sign = 0, 0, list(), '+'

        def dfs(operation, num):
            if operation == '+': stack.append(num)
            if operation == '-': stack.append(-num)

        while i < len(s):
            if s[i].isdigit():
                num = num * 10 + int(s[i])
            elif s[i] in '+-':
                dfs(sign, num)
                num, sign = 0, s[i]
            elif s[i] == '(':
                num, j = self.calculate(s[i+1:])
                i += j
            elif s[i] == ')':
                dfs(sign, num)
                return sum(stack), i + 1
            i += 1
        
        dfs(sign, num)
        return sum(stack)
```

---

### Basic Calculator II

```Python

```

---

### [Basic Calculator III](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Google/772.%20Basic%20Calculator%20III)

```Python

```

---

