## [772. Basic Calculator III](https://leetcode.com/problems/basic-calculator-iii/)

```Tag```: ```Stack```

#### Difficulty: Hard

Implement a basic calculator to evaluate a simple expression string.

The expression string contains only non-negative integers, ```'+'```, ```'-'```, ```'*'```, ```'/'``` operators, and open ```'('``` and closing parentheses ```')'```. The integer division should truncate toward zero.

You may assume that the given expression is always valid. All intermediate results will be in the range of [-2,sup>31</sup>, 2<sup>31</sup> - 1].

Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as ```eval()```.

![image](https://user-images.githubusercontent.com/35042430/227585228-0a5ca3a8-df4f-49e1-8730-7f3793a4a188.png)

---

__Example 1:__
```
Input: s = "1+1"
Output: 2
```

__Example 2:__
```
Input: s = "6-4/2"
Output: 4
```

__Example 3:__
```
Input: s = "2*(5+5*2)/3+(6/2+8)"
Output: 21
```

__Constraints:__

- 1 <= ```s``` <= 10<sup>4</sup>
- ```s``` consists of digits, ```'+'```, ```'-'```, ```'*'```, ```'/'```, ```'('```, and ```')'```.
- ```s``` is a valid expression.

---

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, operand, stack, operator, n = 0, 0, list(), '+', len(s)

        nums = set(str(num) for num in range(0, 10))
        
        def build_stack(operand, operator):
            if operator == '+': stack.append(operand)
            if operator == '-': stack.append(-operand)
            # Process Multiplication and Division with current operand and the last added number in stack
            if operator == '*': stack[-1] = stack[-1] * operand
            if operator == '/': stack[-1] = int(stack[-1] / operand)
        
        while i < n:
            char = s[i]
            # Check if the character is a digit number
            if char in nums:
                operand = operand * 10 + int(char)
            # Check if the character is a sign operation
            elif char in '+-*/':
                build_stack(operand, operator)
                # Reset operand and update the sign
                operator, operand = char, 0
            # Check if the character is an open parenthesis
            elif char == '(':
                # Recursively process the expression inside the parentheses
                j, operand = self.calculate(s[i+1:])
                # Move to the next character after the parenthesis
                i += j
            # Check if the character is a closing parenthesis
            elif char == ')':
                # Process the operations
                build_stack(operand, operator)
                return i + 1, sum(stack)
            
            i += 1
        
        build_stack(operand, operator)
        return sum(stack)
```
