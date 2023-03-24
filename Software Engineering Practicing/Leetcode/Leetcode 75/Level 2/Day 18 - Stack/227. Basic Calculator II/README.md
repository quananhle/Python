## [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)

```Tag```: ```Stack``` ```Recursion```

#### Difficulty: Medium

Given a string ```s``` which represents an expression, evaluate this expression and return its value. 

The integer division should truncate toward zero.

You may assume that the given expression is always valid. All intermediate results will be in the range of [-2<sup>31</sup>, 2<sup>31 - 1</sup>].

Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as ```eval()```.

![image](https://user-images.githubusercontent.com/35042430/226208411-c451b0a9-c522-4611-9e38-b5d7bf44672f.png)

---

__Example 1:__
```
Input: s = "3+2*2"
Output: 7
```

__Example 2:__
```
Input: s = " 3/2 "
Output: 1
```

__Example 3:__
```
Input: s = " 3+5 / 2 "
Output: 5
```

__Constraints:__

- 1 <= ```s.length``` <= 3 * 10<sup>5</sup>
- ```s``` consists of integers and operators ```('+', '-', '*', '/')``` separated by some number of spaces.
- ```s``` represents a valid expression.
- All the integers in the expression are non-negative integers in the range [0, 2<sup>31 - 1</sup>].
- The answer is guaranteed to fit in a 32-bit integer.

---

![image](https://leetcode.com/problems/basic-calculator-ii/Figures/227/calculator_overview.png)

- If the current operation is addition ```(+)``` or subtraction ```(-)```, then the expression is evaluated based on the precedence of the next operation.
- If the current operator is multiplication ```(*)``` or division ```(/)```, then the expression is evaluated irrespective of the next operation. This is because in the given set of operations ```(+,-,*,/)```, the ```*``` and ```/``` operations have the highest precedence and therefore must be evaluated first.

![image](https://user-images.githubusercontent.com/35042430/227580741-93889e71-f41a-41d5-b48c-155de6602119.png)

![image](https://user-images.githubusercontent.com/35042430/227582070-6fe32d9b-27aa-4f7c-9b08-746687b93299.png)

![image](https://user-images.githubusercontent.com/35042430/227582161-a38fb271-7728-4b13-a5ec-f222c15b0947.png)

![image](https://user-images.githubusercontent.com/35042430/227582200-feca9418-5549-44b6-8b4f-eda2830cc6f8.png)

![image](https://user-images.githubusercontent.com/35042430/227582285-848d6a85-3381-40fd-9f82-768c7eb8c74c.png)

![image](https://user-images.githubusercontent.com/35042430/227582420-9b0b0b6b-2aae-4802-8a60-ea0db0476bfe.png)

![image](https://user-images.githubusercontent.com/35042430/227582481-38551839-a88a-4170-beb2-68cdcda4b896.png)

![image](https://user-images.githubusercontent.com/35042430/227582572-f5b500a3-bfb7-448c-b204-5fbdff4b9093.png)

__Algorithm__

Scan the input string ```s``` from left to right and evaluate the expressions based on the following rules

1. If the current character is a digit ```0-9``` ( operand ), add it to the number ```currentNumber```.
2. Otherwise, the current character must be an operation ```(+,-,*, /)```. Evaluate the expression based on the type of operation.
    - Addition ```(+)``` or Subtraction ```(-)```: We must evaluate the expression later based on the next operation. So, we must store the ```currentNumber``` to be used later. Let's push the ```currentNumber``` in the Stack.

            Stack data structure follows Last In First Out (LIFO) principle. Hence, the last pushed number in the stack 
            would be popped out first for evaluation. In addition, when we pop from the stack and evaluate this expression 
            in the future, we need a way to determine if the operation was Addition (+) or Subtraction (-). To simplify 
            our evaluation, we can push -currentNumber in a stack if the current operation is subtraction (-) and assume 
            that the operation for all the values in the stack is addition (+). This works because (a - currentNumber) 
            is equivalent to (a + (-currentNumber)).

    - Multiplication ```(*)``` or Division ```(/)```: Pop the top values from the stack and evaluate the current expression. Push the evaluated value back to the stack.
3. Once the string is scanned, pop from the stack and add to the result.

```Python
class Solution:
    def calculate(self, s: str) -> int:
        inner, outer, ans, opt = 0, 0, 0, '+'
        for i in range(len(s) + 1):
            if i < len(s):
                c = s[i]
            else:
                c = '+'
            
            if c == ' ':
                continue
            
            if c.isdigit():
                inner = 10 * inner + int(c)
                continue
            
            if opt == '+':
                ans += outer
                outer = inner
            elif opt == '-':
                ans += outer
                outer = -inner
            elif opt == '*':
                outer = outer * inner
            elif opt == '/':
                outer = int(outer / inner)
            
            inner, opt = 0, c
        return ans + outer
```

```Python
class Solution:
    def calculate(self, s: str) -> int:
        stack, curr, operation, n = list(), 0, '+', len(s)
        if not s:
            return 0
        
        operators = {'+','-','*','/'}
        nums = set(str(x) for x in range(0, 10))
        
        for i in range(0, n):
            char = s[i]
            
            if char in nums:
                curr = curr * 10 + int(char)
                
            if char in operators or i == n - 1:
                if operation == '+':
                    stack.append(curr)
                
                elif operation == '-':
                    stack.append(-curr)m
                    
                elif operation == '*':
                    stack[-1] *= curr
                    
                elif operation == '/':
                    stack[-1] = int(stack[-1] / curr)
                        
                curr, operation = 0, char
                
        return sum(stack)
```

### Recursion

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, num, stack, sign = 0, 0, list(), '+'

        def dfs(operation, num):
            if operation == '+': stack.append(num)
            if operation == '-': stack.append(-num)
            if operation == '*': stack.append(stack.pop() * num)
            if operation == '/': stack.append(int(stack.pop() / num))
        
        while i < len(s):
            if s[i].isdigit():
                num = num * 10 + int(s[i])
            elif s[i] in '+-*/':
                dfs(sign, num)
                num, sign = 0, s[i]
            elif s[i] == '(':
                num, j = self.calculate(s[i + 1:])
                i = i + j
            elif s[i] == ')':
                dfs(sign, num)
                return sum(stack), i + 1
            i += 1
        
        dfs(sign, num)
        return sum(stack)
```

```Python
class Solution:
    def calculate(self, s: str) -> int:
        i, operand, stack, sign = 0, 0, list(), '+'
        n = len(s)

        def dfs(operation, operand):
            if operation == '+': stack.append(operand)
            if operation == '-': stack.append(-operand)
            # Multiplication and Division operations have highest precedence and therefore must be evaluated first
            if operation == '*': stack[-1] = stack[-1] * operand
            if operation == '/': stack[-1] = int(stack[-1] / operand)
        
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

```Python
class Solution:
    def calculate(self, s):    
        def calc(it):
            def update(op, v):
                if op == "+": stack.append(v)
                if op == "-": stack.append(-v)
                if op == "*": stack.append(stack.pop() * v)
                if op == "/": stack.append(int(stack.pop() / v))
        
            num, stack, sign = 0, [], "+"
            
            while it < len(s):
                if s[it].isdigit():
                    num = num * 10 + int(s[it])
                elif s[it] in "+-*/":
                    update(sign, num)
                    num, sign = 0, s[it]
                elif s[it] == "(":
                    num, j = calc(it + 1)
                    it = j - 1
                elif s[it] == ")":
                    update(sign, num)
                    return sum(stack), it + 1
                it += 1
            update(sign, num)
            return sum(stack)

        return calc(0)
```
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
