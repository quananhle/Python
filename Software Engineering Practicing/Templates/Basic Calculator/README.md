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

### [Basic Calculator II](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2018%20-%20Stack/227.%20Basic%20Calculator%20II)

```
Example 1:
Input: s = "3+2*2"
Output: 7

Example 2:
Input: s = " 3/2 "
Output: 1

Example 3:
Input: s = " 3+5 / 2 "
Output: 5
```

```Python

```

---

### [Basic Calculator III](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Google/772.%20Basic%20Calculator%20III)

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, operand, stack, sign = 0, 0, list(), '+'
        n = len(s)

        def dfs(operation, operand):
            if operation == '+': stack.append(operand)
            if operation == '-': stack.append(-operand)
            # Multiplication and Division operations are to be performed before Addition and Subtraction
            if operation == '*': stack.append(stack.pop() * operand)
            if operation == '/': stack.append(int(stack.pop() / operand))
        
        while i < n:
            ch = s[i]
            # Check if ch is a digit number
            if ch.isdigit():
                operand = operand * 10 + int(ch)
            # Check if ch is a sign operation
            elif ch in '+-*/':
                dfs(sign, operand)
                # Reset operand and update the operation
                sign, operand = ch, 0
            i += 1
        
        dfs(sign, operand)
        return sum(stack)
```

---

