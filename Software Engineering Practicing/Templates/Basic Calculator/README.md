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
        i, operand, stack, operator, n = 0, 0, list(), '+', len(s)

        nums = set(str(num) for num in range(0, 10))
        
        def compute(operand, operator):
            if operator == '+': stack.append(operand)
            if operator == '-': stack.append(-operand)
        
        while i < n:
            char = s[i]
            if char in nums:
                operand = operand * 10 + int(char)
            elif char in '+-':
                compute(operand, operator)
                operator, operand = char, 0
            elif char == '(':
                j, operand = self.calculate(s[i+1:])
                i += j
            elif char == ')':
                compute(operand, operator)
                return i + 1, sum(stack)
            
            i += 1
        
        compute(operand, operator)
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
class Solution:
    def calculate(self, s: str) -> int:
        i, operand, stack, operator, n = 0, 0, list(), '+', len(s)

        nums = set(str(num) for num in range(0, 10))
        
        def compute(operand, operator):
            if operator == '+': stack.append(operand)
            if operator == '-': stack.append(-operand)
            if operator == '*': stack[-1] = stack[-1] * operand
            if operator == '/': stack[-1] = int(stack[-1] / operand)
        
        while i < n:
            char = s[i]
            if char.isdigit():
                operand = operand * 10 + int(char)
            elif char in '+-*/':
                compute(operand, operator)
                operator, operand = char, 0

            i += 1
        
        compute(operand, operator)
        return sum(stack)
```

---

### [Basic Calculator III](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Google/772.%20Basic%20Calculator%20III)

```
Example 1:
Input: s = "1+1"
Output: 2

Example 2:
Input: s = "6-4/2"
Output: 4

Example 3:
Input: s = "2*(5+5*2)/3+(6/2+8)"
Output: 21
```

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, operand, stack, operator, n = 0, 0, list(), '+', len(s)

        nums = set(str(num) for num in range(0, 10))
        
        def compute(operand, operator):
            if operator == '+': stack.append(operand)
            if operator == '-': stack.append(-operand)
            if operator == '*': stack[-1] = stack[-1] * operand
            if operator == '/': stack[-1] = int(stack[-1] / operand)
        
        while i < n:
            char = s[i]
            if char in nums:
                operand = operand * 10 + int(char)
            elif char in '+-*/':
                compute(operand, operator)
                operator, operand = char, 0
            elif char == '(':
                j, operand = self.calculate(s[i+1:])
                i += j
            elif char == ')':
                compute(operand, operator)
                return i + 1, sum(stack)
            
            i += 1
        
        compute(operand, operator)
        return sum(stack)
```
