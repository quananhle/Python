## [439. Ternary Expression Parser](https://leetcode.com/problems/ternary-expression-parser/)

```Tag```: ```Stack``` ```Polish Notation``` ```Binary Search```

#### Difficulty: Medium

Given a string ```expression``` representing arbitrarily nested ternary expressions, evaluate the expression, and return the result of it.

You can always assume that the given expression is valid and only contains digits, ```'?'```, ```':'```, ```'T'```, and ```'F'``` where ```'T'``` is true and ```'F'``` is false. All the numbers in the expression are one-digit numbers (i.e., in the range ```[0, 9]```).

The conditional expressions group right-to-left (as usual in most languages), and the result of the expression will always evaluate to either a digit, ```'T'``` or ```'F'```.

![image](https://github.com/quananhle/Python/assets/35042430/963d52dc-1c30-4713-9099-439456b1f4df)

---

__Example 1:__
```
Input: expression = "T?2:3"
Output: "2"
Explanation: If true, then result is 2; otherwise result is 3.
```

__Example 2:__
```
Input: expression = "F?1:T?4:5"
Output: "4"
Explanation: The conditional expressions group right-to-left. Using parenthesis, it is read/evaluated as:
"(F ? 1 : (T ? 4 : 5))" --> "(F ? 1 : 4)" --> "4"
or "(F ? 1 : (T ? 4 : 5))" --> "(T ? 4 : 5)" --> "4"
```

__Example 3:__
```
Input: expression = "T?T?F:5:3"
Output: "F"
Explanation: The conditional expressions group right-to-left. Using parenthesis, it is read/evaluated as:
"(T ? (T ? F : 5) : 3)" --> "(T ? F : 3)" --> "F"
"(T ? (T ? F : 5) : 3)" --> "(T ? F : 5)" --> "F"
```

__Constraints:__

- $5 \le expression.length \le 10^[4}$
- ```expression``` consists of digits, ```'T'```, ```'F'```, ```'?'```, and ```':'```.
- It is guaranteed that ```expression``` is a valid ternary expression and that each number is a __one-digit number__.

---

### Approach 1: Find Rightmost Atomic Expression

As illustrated here, due to the right-to-left associativity of ternary expressions, we can find the rightmost atomic expression of the form ```B?E1:E2``` and replace it with its value. We can repeat this process until we are left with a single value.

![image](https://github.com/quananhle/Python/assets/35042430/e20b6333-7c5b-43f0-922b-304a16ad0541)

__Complexity Analysis__

- Time Complexity: $\mathcal{O}(N^{2})$
- Space Complexity: $\mathcal{O}(N)$

```Python
class Solution:
    def parseTernary(self, expression: str) -> str:
        def is_valid_atomic(s):
            return s[0] in 'TF' and s[1] == '?' and s[2] in 'TF0123456789' and s[3] == ':' and s[4] in 'TF0123456789'
        
        def solve_atomic(s):
            return s[2] if s[0] == 'T' else s[4]
        
        while len(expression) != 1:
            i = len(expression) - 1
            while not is_valid_atomic(expression[i-4:i+1]):
                i -= 1
            expression = expression[:i-4] + solve_atomic(expression[i-4:i+1]) + expression[i+1:]
        
        return expression
```

### Approach 2: Reverse Polish Notation

__Constraints:__

- $5 \le expression.length \le 10^[4}$
- ```expression``` consists of digits, ```'T'```, ```'F'```, ```'?'```, and ```':'```.
- It is guaranteed that ```expression``` is a valid ternary expression and that each number is a __one-digit number__.

```Python
class Solution:
    def parseTernary(self, expression: str) -> str:
        while len(expression) != 1:
            question_mark_idx = len(expression) - 1
            while expression[question_mark_idx] != '?':
                question_mark_idx -= 1
            
            if expression[question_mark_idx - 1] == 'T':
                value = expression[question_mark_idx + 1]
            else:
                value = expression[question_mark_idx + 3]
            
            expression = expression[:question_mark_idx - 1] + value + expression[question_mark_idx + 4:]
        
        return expression
```
