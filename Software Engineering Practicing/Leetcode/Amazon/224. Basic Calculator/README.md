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

