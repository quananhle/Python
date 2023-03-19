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
                num, j = self.calculate(s[i + 1])
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
