## [224. Basic Calculator](https://leetcode.com/problems/basic-calculator/)

```Tag```: ```Stack```

#### Difficulty: Hard

Given a string ```s``` representing a valid expression, implement a basic calculator to evaluate it, and return _the result of the evaluation_.

__Note__: You are __not__ allowed to use any built-in function which evaluates strings as mathematical expressions, such as ```eval()```.

![image](https://user-images.githubusercontent.com/35042430/227119949-ed512e60-429d-48d2-950d-0781bf210bba.png)

---

__Example 1:__
```
Input: s = "1 +1"
Output: 2
```

__Example 2:__
```
Input: s = " 2-1 + 2 "
Output: 3
```

__Example 3:__
```
Input: s = "(1+(4+5+2)-3)+(6+8)"
Output: 23
```

__Constraints:__

- ```1 <= s.length <= 3 * 10^5```
- ```s``` consists of digits, ```'+'```, ```'-'```, ```'('```, ```')'```, and ```' '```.
- ```s``` represents a valid expression.
- ```'+'``` is not used as a unary operation (i.e., ```"+1"``` and ```"+(2 + 3)"``` is invalid).
- ```'-'``` could be used as a unary operation (i.e., ```"-1"``` and ```"-(2 + 3)"``` is valid).
- There will be no two consecutive operators in the input.
- Every number and running calculation will fit in a signed 32-bit integer.

---

![image](https://leetcode.com/problems/basic-calculator/Figures/224/Basic_Calculator_0.png)

![image](https://leetcode.com/problems/basic-calculator/Figures/224/Basic_Calculator_1.png)

![image](https://leetcode.com/problems/basic-calculator/Figures/224/Basic_Calculator_2.png)

__Algorithm__

1. Iterate the expression string in reverse order one character at a time. Since we are reading the expression character by character, we need to be careful when we are reading digits and non-digits.

2. The operands could be formed by multiple characters. A string "123" would mean a numeric 123, which could be formed as: ```123``` >> ```120 + 3``` >> ```100 + 20 + 3```. Thus, if the character read is a digit we need to form the operand by multiplying a power of ```10``` to the current digit and adding it to the overall operand. We do this since we are processing the string in the reverse order.

3. The operands could be formed by multiple characters. We need to keep track of an on-going operand. This part is a bit tricky since in this case the string is reversed. Once we encounter a character which is not a digit, we push the operand onto the stack.

4. When we encounter an opening parenthesis ```(```, this means an expression just ended. Recall we have reversed the expression. So an opening bracket would signify the end of the an expression. This calls for evaluation of the expression by popping operands and operators off the stack till we pop corresponding closing parenthesis. The final result of the expression is pushed back onto the stack.

        Note: We are evaluating all the sub-expressions within the main expression. The sub-expressions on the right 
        get evaluated first but the main expression itself is evaluated from left to right when all its components are 
        resolved, which is very important for correct results.

For eg. For expression ```A−(B+C)+(D+E−F), D+E−F``` is evaluated before ```B+C```. While evaluating ```D+E−F``` the order is from left to right. Similarly for the parent expression, all the child components are evaluated and stored on the stack so that final evaluation is left to right.

5. Push the other non-digits onto to the stack.

6. Do this until we get the final result. It's possible that we don't have any more characters left to process but the stack is still non-empty. This would happen when the main expression is not enclosed by parenthesis. So, once we are done evaluating the entire expression, we check if the stack is non-empty. If it is, we treat the elements in it as one final expression and evaluate it the same way we would if we had encountered an opening bracket.

We can also cover the original expression with a set of parenthesis to avoid this extra call.

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, operand, stack, sign = 0, 0, list(), '+'
        n = len(s)

        def dfs(operation, num):
            if operation == '+': stack.append(num)
            if operation == '-': stack.append(-num)

        while i < n:
            ch = s[i]
            # Check if the current character is a digit
            if ch.isdigit():
                # Compute the value of the entire number
                operand = operand * 10 + int(ch)
            # Check if the current character is a sign 
            elif ch in '+-':
                '''
                dfs(sign, operand)
                '''
                # Check the current sign
                if sign == '+':
                    # Add the positive value of operand
                    stack.append(operand)
                elif sign == '-':
                    # Add the negative value of operand
                    stack.append(-operand)
                # Reset the operand and update the sign
                operand, sign = 0, ch
            # Check if the current character is open parenthesis
            elif ch == '(':
                # Recursively build the stack inside the parentheses
                operand, j = self.calculate(s[i+1:])
                # Move on to the next character after the parentheses
                i += j
            elif ch == ')':
                # Process the evaluation inside the parenthese
                dfs(sign, operand)
                return sum(stack), i + 1

            i += 1
        
        dfs(sign, operand)
        return sum(stack)
```

```Python
class Solution:
    def calculate(self, s: str) -> int:
        ans, operand, stack, sign = 0, 0, list(), 1

        for ch in s:
            if ch.isdigit():
                operand = operand * 10 + int(ch)
            elif ch in '+-':
                if ch == '+':
                    ans += sign * operand
                    sign = 1
                elif ch == '-':
                    ans += sign * operand
                    sign = -1
                operand = 0
            elif ch == '(':
                stack.append(ans)
                stack.append(sign)
                sign = 1
                ans = 0
            elif ch == ')':
                ans += sign * operand
                ans *= stack.pop()
                ans += stack.pop()
                operand = 0
        
        return ans + sign * operand
```

### Without using Splicing

```Python
class Solution:
    def calculate(self, s):    
        def calc(curr):
            operand, stack, operator = 0, list(), '+'

            digits = set(str(num) for num in range(11))

            def compute(operand, operator):
                if operator == "+": stack.append(operand)
                if operator == "-": stack.append(-operand)
                if operator == "*": stack[-1] = stack[-1] * operand
                if operator == "/": stack[-1] = int(stack[-1] / operand)

            while curr < len(s):
                char = s[curr]
                if char in digits:
                    operand = operand * 10 + int(char)
                elif char in '+-*/':
                    compute(operand, operator)
                    operand, operator = 0, char
                elif char == '(':
                    operand, i = calc(curr + 1)
                    curr = i - 1
                elif char == ')':
                    compute(operand, operator)
                    return sum(stack), curr + 1

                curr += 1
            compute(operand, operator)
            return sum(stack)

        return calc(0)
```
