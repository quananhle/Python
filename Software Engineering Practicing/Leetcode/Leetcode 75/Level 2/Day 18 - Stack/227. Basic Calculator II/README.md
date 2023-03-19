## [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)

```Tag```:

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
