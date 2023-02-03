## 6. Zigzag Conversion

```Tag```: [```String Pattern```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/String%20Pattern)

#### Difficulty: Medium

The string ```"PAYPALISHIRING"``` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

```
P   A   H   N
A P L S I I G
Y   I   R
```

And then read line by line: ```"PAHNAPLSIIGYIR"```

Write the code that will take a string and make this conversion given a number of rows:

```def convert(self, s: str, numRows: int) -> str```

![image](https://user-images.githubusercontent.com/35042430/216506941-0e7bddbf-c2ac-4fa1-8e27-53fce224415f.png)

---

__Example 1:__
```
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```

__Example 2:__
```
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
```

__Example 3:__
```
Input: s = "A", numRows = 1
Output: "A"
```

__Constraints:__

- ```1 <= s.length <= 1000```
- ```s``` consists of English letters (lower-case and upper-case), ```','``` and ```'.'```.
- ```1 <= numRows <= 1000```

---
