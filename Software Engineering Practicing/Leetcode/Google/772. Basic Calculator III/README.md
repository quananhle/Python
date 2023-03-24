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
