## [150. Evaluate Reverse Polish Notation](https://leetcode.com/problems/evaluate-reverse-polish-notation)

```Tag```: ```Stack```

#### Difficulty: Medium

Evaluate the value of an arithmetic expression in __Reverse Polish Notation__.

Valid operators are ```+```, ```-```, ```*```, and ```/```. Each operand may be an integer or another expression.

Note that division between two integers should truncate toward zero.

It is __guaranteed__ that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

![image](https://github.com/quananhle/Python/assets/35042430/3a7593a9-6e03-4ba1-b520-8677c2207548)

---

__Example 1:__

```
Input: tokens = ["2","1","+","3","*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9
```

__Example 2:__

```
Input: tokens = ["4","13","5","/","+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
```

__Example 3:__

```
Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
Output: 22
Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
```

__Constraints:__

- $1 \le tokens.length \le 10^4$
- ```tokens[i]``` is either an operator: ```"+"```, ```"-"```, ```"*"```, or ```"/"```, or an integer in the range $[-200, 200]$.

---

```Python
class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        '''
        Keep track of a pair of innermost digits standing before an operators, and recursively develop to the outside
        Can be divided into subproblems; hence, dynamic programming and stack could be used
        '''
        #### Time Complexity: O(N), traverse through the input once
        #### Space Complexity: O(N), to store all the digits of input
        def helper(num1, num2, operator):

            if operator == "+":
                return num1 + num2
            elif operator == "-":
                return num2 - num1
            elif operator == "*":
                return num1 * num2
            else:
                # Python division does not truncate towards zero; hence, use int(a/b). Note that int(a/b) != int(a//b)                
                return int(num2 / num1)
                
        operators = {"+", "-", "*", "/"}
        digit_stack = list()
        for token in tokens:
            '''
            if not token.strip('-').isdigit():
            '''
            '''
            if token in "+-*/":
            '''
            if token in operators:
                if digit_stack:
                    num1 = digit_stack.pop()
                    num2 = digit_stack.pop()
                    digit_stack.append(helper(num1, num2, token))
            else:
                digit_stack.append(int(token))
        return digit_stack.pop()
```

### Stack and Lambda

```Python
class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        '''
        Keep track of a pair of innermost digits standing before an operators, and recursively develop to the outside
        Can be divided into subproblems; hence, dynamic programming and stack could be used
        '''
        #### Time Complexity: O(N), traverse through the input once
        #### Space Complexity: O(N), to store all the digits of input
        
        operations = {
            "+" : lambda a, b: a + b,
            "-" : lambda a, b: b - a,
            "/" : lambda a, b: int(b / a),
            "*" : lambda a, b: a * b
        }
        
        digit_stack = []
        for token in tokens:
            if token in operations:
                num1 = digit_stack.pop()
                num2 = digit_stack.pop()
                operation = operations[token]
                digit_stack.append(operation(num1, num2))
            else:
                digit_stack.append(int(token))
        return digit_stack.pop()
```
