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

### Pattern

#### Array Pattern

![image](https://user-images.githubusercontent.com/35042430/216508458-aa8bd57f-0a63-4531-87d0-3456738bca19.png)

```Python
class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if not s or numRows == 1:
            return s

        res = list()
        step = 2 * numRows - 2
        for i in range(0, numRows):
            for j in range(i, len(s), step):
                res.append(s[j])
                # Check if not in first and last rows and not step out of bound
                if 0 < i < numRows - 1 and (j + step - 2*i) < len(s):
                    res.append(s[j + step - 2*i])

        return ''.join(res)
```
