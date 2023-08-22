## [168. Excel Sheet Column Title](https://leetcode.com/problems/excel-sheet-column-title/)

```Tag``` ```Math``` ```Array & String```

#### Difficulty: Easy

Given an integer ```columnNumber```, return _its corresponding column title as it appears in an Excel sheet_.

__For example__:

- A -> 1
- B -> 2
- C -> 3
- ...
- Z -> 26
- AA -> 27
- AB -> 28
- ...

![image](https://github.com/quananhle/Python/assets/35042430/653770ca-dcba-4b02-a026-e15cb6460154)

---

__Example 1:__
```
Input: columnNumber = 1
Output: "A"
```

__Example 2:__
```
Input: columnNumber = 28
Output: "AB"
```

__Example 3:__
```
Input: columnNumber = 701
Output: "ZY"
```

__Constraints:__

- $1 \le columnNumber \le 2^{31} - 1$

---

```N = 2002``` corresponds to ```BXZ```.

In terms of base ```26```:

- $N = (B + 1) \cdot 26^{2} + (X + 1) \cdot 26^{1} + (Z + 1) * 26^{0}$
- $N = (1 + 1) \cdot 676 + (23 + 1) \cdot 26 + (25 + 1) \cdot 1 = 2002$

Steps to get the letters:

1. Subtract ```1``` from ```N```. Now, ```N = 2001```. Take ```N``` modulo ```26``` and convert the result to the corresponding position in the alphabet. $2001 \% 26 = 25$, which corresponds to ```Z```, since we start with ```A = 0```.
2. Divide ```N``` by ```26```. We have $N = \frac{2001}{26} = 7$.
3. Repeat the process until ```N = 0```. We subtract ```1```, so now ```N = 75```. Take it modulo $26: 75 \% 26 = 23$. This corresponds to ```X```.
4. Divide ```N``` by ```26```. We have $N = \frac{75}{26} = 2$.
5. Subtract ```1```, so now ```N = 1```. Take it modulo $26: 1 \% 26 = 1$. This corresponds to ```B```.

__Algorithm__

1. Initialize an empty string ```ans``` which would store the column title.
2. Do the following as long as columnNumber is greater than 0:

Subtract 1 from the columnNumber
Find the character corresponding to columnNumber % 26 and append it to the ans in the end.
Assign columnNumber to columnNumber / 26.
Reverse the string columnNumber and return it.
