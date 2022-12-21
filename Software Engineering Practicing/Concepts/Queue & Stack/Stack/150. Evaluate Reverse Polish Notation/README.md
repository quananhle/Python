## 150. Evaluate Reverse Polish Notation

```Tag```: ```Stack```

#### Difficulty: Medium

Evaluate the value of an arithmetic expression in __Reverse Polish Notation__.

Valid operators are ```+```, ```-```, ```*```, and ```/```. Each operand may be an integer or another expression.

Note that division between two integers should truncate toward zero.

It is __guaranteed__ that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

![image](https://user-images.githubusercontent.com/35042430/208998788-1113d042-0f8e-4a0b-881d-82b99749b335.png)

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
```
1 <= tokens.length <= 104
tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].
```

---

